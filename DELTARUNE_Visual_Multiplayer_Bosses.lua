local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local Fns = {}

local LocalPlayer = Players.LocalPlayer
local IsMobile = UserInputService.TouchEnabled

Fns.TableClear = function(t)
    if type(t) ~= "table" then
        return
    end
    for k in pairs(t) do
        t[k] = nil
    end
end

Fns.SafeHttpGet = function(url)
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
    local req = (syn and syn.request) or (http and http.request) or http_request or request
    if type(req) == "function" then
        local ok, res = pcall(function()
            return req({ Url = url, Method = "GET" })
        end)
        if ok and type(res) == "table" then
            local body = res.Body or res.body
            if type(body) == "string" and body ~= "" then
                return body
            end
        end
    end
    return result
end

Fns.SafeLoadstring = function(code)
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

Fns.LoadRemote = function(url)
    local src = Fns.SafeHttpGet(url)
    if type(src) ~= "string" or src == "" then
        return nil
    end
    local fn = Fns.SafeLoadstring(src)
    if type(fn) ~= "function" then
        return nil
    end
    local ok, result = pcall(fn)
    if ok then
        return result
    end
    return nil
end

local repoUrls = {
    "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/",
    "https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/",
}

local Library = nil
local ThemeManager = nil
local SaveManager = nil
local repo = repoUrls[1]

for i = 1, #repoUrls do
    local base = repoUrls[i]
    local result = Fns.LoadRemote(base .. "Library.lua")
    if type(result) == "table" and type(result.CreateWindow) == "function" then
        Library = result
        repo = base
        break
    end
end

if type(Library) ~= "table" or type(Library.CreateWindow) ~= "function" then

    return
end

pcall(function()
    ThemeManager = Fns.LoadRemote(repo .. "addons/ThemeManager.lua")
end)

pcall(function()
    SaveManager = Fns.LoadRemote(repo .. "addons/SaveManager.lua")
end)

local Options = Library.Options or {}
local Toggles = Library.Toggles or {}

Fns.ReadOptionValue = function(flag, fallback)
    local opt = Options[flag]
    if type(opt) == "table" then
        local v = rawget(opt, "Value")
        if v ~= nil and v ~= "" then
            return v
        end
    end
    return fallback
end

Fns.ReadOptionNumber = function(flag, fallback)
    local v = Fns.ReadOptionValue(flag, fallback)
    local n = tonumber(v)
    if n == nil then
        return tonumber(fallback) or 0
    end
    return n
end

pcall(function()
    Library.ForceCheckbox = false
    Library.ShowToggleFrameInKeybinds = true
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
    MercyBossName = "(none)",
    JevilChaosChoice = "Damage Enemy (Spade)",
    GersonShield = false,
    GersonRudeTiming = false,
    GersonAutoTiming = false,
    FreeActs = false,
    ProceedSnowgrave = false,
    FreeSpells = false,
    DateFreezeTime = false,
    DumbAttack = false,
    AntiFailAutoAttack = false,
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
    HPTargetActor = "All",
    QueenShieldAlwaysBroken = false,
    DisableAllMoves = false,
    RouxlsUnlockFullMenu = false,
    EramNoclip = false,
    EramNoAttackCD = false,
    EramNoAttackCDActor = "All",
    VisualDisableEffects = false,
    VisualStopBackground = false,
    VisualActor = "Kris",
    VisualSpriteSource = "Frisk",
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

Fns.EnsureConfigFolder = function()
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

Fns.ConfigPath = function(name)
    return ConfigFolder .. "/" .. tostring(name or "Default") .. ".json"
end

Fns.EncodeConfig = function(data)
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

Fns.DecodeConfig = function(str)
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

Fns.RefreshConfigList = function()
    Fns.EnsureConfigFolder()
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

Fns.SnapshotConfig = function()
    return {
        TPInfinite = PinksState.TPInfinite,
        HPInfinite = PinksState.HPInfinite,
        GodMode = PinksState.GodMode,
        FreeSoulToggle = PinksState.FreeSoulToggle,
        DeleteStinky = PinksState.DeleteStinky,
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

Fns.SaveConfig = function(name)
    name = tostring(name or ConfigNameValue or "Default")
    if name == "" then
        name = "Default"
    end
    Fns.EnsureConfigFolder()
    local data = Fns.SnapshotConfig()
    if not writefile then
        Fns.RefreshConfigList()
        return false
    end
    local ok = pcall(function()
        writefile(Fns.ConfigPath(name), Fns.EncodeConfig(data))
    end)
    Fns.RefreshConfigList()
    return ok
end

Fns.LoadConfig = function(name)
    name = tostring(name or ConfigNameValue or "Default")
    local path = Fns.ConfigPath(name)
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
    local data = Fns.DecodeConfig(raw)
    if type(ApplyConfig) == "function" then
        ApplyConfig(data)
    end
    return true
end

Fns.DeleteConfig = function(name)
    name = tostring(name or ConfigNameValue or "Default")
    local path = Fns.ConfigPath(name)
    if not delfile then
        Fns.RefreshConfigList()
        return false
    end
    local exists = true
    if isfile then
        local okIsFile, result = pcall(isfile, path)
        exists = okIsFile and result == true
    end
    if not exists then
        Fns.RefreshConfigList()
        return false
    end
    local ok = pcall(function()
        delfile(path)
    end)
    Fns.RefreshConfigList()
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

Fns.GetTensionMax = function()
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

Fns.GetConfig = function()
    local ok, cfg = pcall(function()
        return require(ReplicatedStorage.Core.Data.Config)
    end)
    return ok and cfg or nil
end

Fns.IsTensionController = function(v)
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

Fns.IsTensionBar = function(v)
    return type(v) == "table"
        and type(rawget(v, "Apparent")) == "number"
        and type(rawget(v, "Current")) == "number"
        and (type(rawget(v, "Snap")) == "function" or type(rawget(v, "Chase")) == "function" or rawget(v, "Root") ~= nil)
end

Fns.IsPartyMemberHP = function(v)
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

Fns.RescanCache = function(force)
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
                if Fns.IsTensionBar(v) then
                    table.insert(tensionBars, v)
                end
                if Fns.IsTensionController(v) then
                    table.insert(tensionTables, v)
                elseif type(rawget(v, "Tension")) == "number" and type(rawget(v, "TensionMax")) == "number" then
                    table.insert(tensionTables, v)
                end
                if rawget(v, "Invuln") ~= nil and type(rawget(v, "HP")) == "number" and type(rawget(v, "MaxHP")) == "number" then
                    table.insert(soulTables, v)
                end
                if Fns.IsPartyMemberHP(v) then
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

Fns.ApplyTPValue = function(value)
    local max = Fns.GetTensionMax()
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

Fns.ForceTP = function(amount)
    local max = Fns.GetTensionMax()
    local value = math.clamp(tonumber(amount) or max, 0, max)
    local function applyTo(ctrl)
        if type(ctrl) ~= "table" then return false end
        local tmax = tonumber(rawget(ctrl, "TensionMax")) or max
        if tmax < 1 then tmax = max end
        local setTo = math.clamp(value, 0, math.max(tmax, max))
        rawset(ctrl, "Tension", setTo)
        local bar = rawget(ctrl, "TensionBar")
        if type(bar) == "table" then
            if type(bar.Snap) == "function" then
                pcall(function() bar:Snap(setTo) end)
            else
                rawset(bar, "Apparent", setTo)
                rawset(bar, "Current", setTo)
            end
        end
        if type(ctrl.StepTensionBar) == "function" then
            pcall(function() ctrl:StepTensionBar() end)
        end
        return true
    end
    pcall(function()
        local battle = LiveBattleCache.Battle
        if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then
            battle = Fns.FindLiveBattleController(false)
        end
        local ok = applyTo(battle)
        if type(battle) == "table" then
            applyTo(rawget(battle, "Battle"))
        end
        if #Cache.TensionTables == 0 and #Cache.TensionBars == 0 then
            Fns.RescanCache(true)
        end
        Fns.ApplyTPValue(value)
        if not ok and type(getgc) == "function" then
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" and type(rawget(v, "Tension")) == "number" and type(rawget(v, "TensionMax")) == "number" then
                    applyTo(v)
                end
            end
        end
    end)
end

local BattleLifecycle

local LiveBattleCache = {
    Battle = nil,
    LastScan = 0,
}

local SoftRecoverAfterBattle = function() end
local QueenShieldCache = {
    Controller = nil,
    Enemy = nil,
    Shield = nil,
    LastScan = 0,
}

local EnemyHPOriginals = setmetatable({}, { __mode = "k" })

Fns.FindQueenShieldObjects = function(forceScan)
    local now = os.clock()
    local controller = LiveBattleCache.Battle
    if type(controller) ~= "table" then
        controller = Fns.FindLiveBattleController(false)
    end

    if QueenShieldCache.Controller ~= controller then
        QueenShieldCache.Controller = controller
        QueenShieldCache.Enemy = nil
        QueenShieldCache.Shield = nil
        QueenShieldCache.LastScan = 0
    end

    local enemy = QueenShieldCache.Enemy
    local shield = QueenShieldCache.Shield
    local seen = {}

    local function inspect(owner)
        if type(owner) ~= "table" or seen[owner] then
            return
        end
        seen[owner] = true

        if type(owner.QueenShield) == "function" then
            local ok, foundEnemy, foundShield = pcall(function()
                return owner:QueenShield()
            end)
            if ok then
                if type(foundEnemy) == "table" then enemy = foundEnemy end
                if type(foundShield) == "table" then shield = foundShield end
            end
        end

        if type(owner.Object) == "function" then
            pcall(function()
                if type(enemy) ~= "table" then
                    local found = owner:Object("obj_queen_enemy")
                    if type(found) == "table" then enemy = found end
                end
                if type(shield) ~= "table" then
                    local found = owner:Object("obj_queenshield_enemy")
                    if type(found) == "table" then shield = found end
                end
            end)
        end

        if type(rawget(owner, "Shieldhp")) == "number" and type(rawget(owner, "Shieldmaxhp")) == "number" then
            enemy = owner
        end

        local nestedKeys = { "Battle", "Fight", "FightState", "Scene", "Enemies", "Objects", "Instances" }
        for _, key in ipairs(nestedKeys) do
            local nested = rawget(owner, key)
            if type(nested) == "table" then
                if type(rawget(nested, "Shieldhp")) == "number" and type(rawget(nested, "Shieldmaxhp")) == "number" then
                    enemy = nested
                end
                for _, candidate in pairs(nested) do
                    if type(candidate) == "table" and type(rawget(candidate, "Shieldhp")) == "number" and type(rawget(candidate, "Shieldmaxhp")) == "number" then
                        enemy = candidate
                    elseif type(candidate) == "table" and rawget(candidate, "Shieldhurt") ~= nil and rawget(candidate, "Shieldhurttimer") ~= nil then
                        shield = candidate
                    end
                end
            end
        end
    end

    inspect(controller)
    if type(controller) == "table" then
        inspect(rawget(controller, "Battle"))
        inspect(rawget(controller, "Fight"))
        inspect(rawget(controller, "FightState"))
        inspect(rawget(controller, "Scene"))
    end

    local fightData = type(controller) == "table" and rawget(controller, "Fight") or nil
    local fightId = string.lower(tostring(type(fightData) == "table" and (rawget(fightData, "Id") or rawget(fightData, "Name")) or ""))
    local isQueenFight = string.find(fightId, "queen", 1, true) ~= nil or (type(enemy) == "table" and (rawget(enemy, "Shieldhp") ~= nil or rawget(enemy, "Shieldmaxhp") ~= nil))
    if forceScan or (type(enemy) ~= "table" and isQueenFight and now - QueenShieldCache.LastScan >= 1.5) then
        QueenShieldCache.LastScan = now
        if type(getgc) == "function" then
            pcall(function()
                for _, candidate in pairs(getgc(true)) do
                    if type(candidate) == "table" then
                        if type(enemy) ~= "table"
                            and type(rawget(candidate, "Shieldhp")) == "number"
                            and type(rawget(candidate, "Shieldmaxhp")) == "number"
                            and type(rawget(candidate, "Shieldacthp")) == "number"
                            and (rawget(candidate, "Def") ~= nil or rawget(candidate, "Myself") ~= nil or rawget(candidate, "Sprite") ~= nil) then
                            enemy = candidate
                        end
                        if type(shield) ~= "table" and rawget(candidate, "Shieldhurt") ~= nil and rawget(candidate, "Shieldhurttimer") ~= nil then
                            shield = candidate
                        end
                        if type(enemy) == "table" and type(shield) == "table" then
                            break
                        end
                    end
                end
            end)
        end
    end

    QueenShieldCache.Enemy = enemy
    QueenShieldCache.Shield = shield
    return enemy, shield
end

Fns.BreakQueenShieldNow = function(forceScan)
    local enemy, shield = Fns.FindQueenShieldObjects(forceScan == true)
    local changed = false

    local function breakEnemy(obj)
        if type(obj) ~= "table" then
            return
        end
        if rawget(obj, "Shieldhp") ~= nil or rawget(obj, "Shieldmaxhp") ~= nil or rawget(obj, "Shieldacthp") ~= nil then
            rawset(obj, "Shieldhp", 0)
            rawset(obj, "Shieldacthp", 0)
            rawset(obj, "Shieldbrokecon", 1)
            rawset(obj, "Shieldjustbroke", 1)
            rawset(obj, "Shieldjustwentdown", 1)
            if rawget(obj, "Sprite") ~= nil then rawset(obj, "Sprite", "spr_queen_drunk") end
            changed = true
        end
    end

    breakEnemy(enemy)

    if type(shield) == "table" then
        if rawget(shield, "Shieldhurt") ~= nil then rawset(shield, "Shieldhurt", 2) changed = true end
        if rawget(shield, "Shieldhurttimer") ~= nil then rawset(shield, "Shieldhurttimer", 0) changed = true end
        if rawget(shield, "Broken") ~= nil then rawset(shield, "Broken", true) changed = true end
    end

    local controller = LiveBattleCache.Battle
    if type(controller) == "table" then
        for _, key in ipairs({ "Battle", "Fight", "FightState", "Scene" }) do
            local nested = rawget(controller, key)
            if type(nested) == "table" and nested ~= enemy and nested ~= shield then
                breakEnemy(nested)
            end
        end
        local refresh = rawget(controller, "RefreshUi")
        if type(refresh) == "function" then pcall(function() controller:RefreshUi() end) end
    end

    return changed
end

local GetCurrentEnemyNames = function() return {} end
local GiveMercyToNamedBoss = function() return false end

Fns.GetBattleEnemies = function(battle)
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then return {} end
    local result = {}
    local seen = {}
    local nestedBattle = rawget(battle, "Battle")
    local fightState = rawget(battle, "FightState")
    local scene = rawget(battle, "Scene")
    local engine = type(nestedBattle) == "table" and rawget(nestedBattle, "Engine") or nil
    local instances = type(nestedBattle) == "table" and rawget(nestedBattle, "Instances") or nil
    local instancesEngine = type(instances) == "table" and rawget(instances, "Engine") or nil
    local directEngine = rawget(battle, "Engine")
    local stateEngine = type(fightState) == "table" and rawget(fightState, "Engine") or nil
    local sceneEngine = type(scene) == "table" and rawget(scene, "Engine") or nil
    local roots = { nestedBattle, engine, instances, instancesEngine, directEngine, fightState, stateEngine, scene, sceneEngine, battle }
    local listKeys = { "Monsterinstance", "MonsterInstance", "EnemyList", "EnemyRoster", "Enemies", "Monsters" }
    local function addEnemy(value)
        if type(value) ~= "table" or seen[value] or rawget(value, "Alive") == false or rawget(value, "Gone") == true or rawget(value, "Absent") == true then return end
        local def = rawget(value, "Def")
        local hasRuntimeState = rawget(value, "Myself") ~= nil
            or type(rawget(value, "Mercy")) == "number"
            or type(rawget(value, "MercyMax")) == "number"
            or type(rawget(value, "Maxmercy")) == "number"
            or type(rawget(value, "HP")) == "number"
            or type(rawget(value, "Shieldhp")) == "number"
        if hasRuntimeState and (type(def) == "table" or rawget(value, "Myself") ~= nil or type(rawget(value, "Mercy")) == "number") then
            seen[value] = true
            result[#result + 1] = value
        end
    end
    local exactEnemyList = nil
    local exactListOk = pcall(function()
        local method = battle.EnemyList
        if type(method) == "function" then exactEnemyList = method(battle) end
    end)
    if exactListOk and type(exactEnemyList) == "table" then
        for _, enemy in pairs(exactEnemyList) do addEnemy(enemy) end
        return result
    end
    for _, root in pairs(roots) do
        if type(root) == "table" then
            for _, key in ipairs(listKeys) do
                local list = rawget(root, key)
                if type(list) == "table" then
                    for _, enemy in pairs(list) do addEnemy(enemy) end
                end
            end
            local directEnemy = rawget(root, "Enemy")
            if type(directEnemy) == "table" then addEnemy(directEnemy) end
            local enemyListMethod = rawget(root, "EnemyList")
            if type(enemyListMethod) == "function" then
                pcall(function()
                    local list = root:EnemyList()
                    if type(list) == "table" then
                        for _, enemy in pairs(list) do addEnemy(enemy) end
                    end
                end)
            end
        end
    end
    return result
end

Fns.GetBattleFightLabel = function(battle)
    if type(battle) ~= "table" then return "" end
    local candidates = { rawget(battle, "Fight"), rawget(battle, "FightState"), rawget(battle, "Battle"), battle }
    for _, candidate in pairs(candidates) do
        if type(candidate) == "table" then
            local label = rawget(candidate, "Wall") or rawget(candidate, "Id") or rawget(candidate, "FightName") or rawget(candidate, "Name")
            if type(label) == "string" and label ~= "" then return label end
        end
    end
    return ""
end

Fns.IsTerminalBattleState = function(state)
    state = string.lower(tostring(state or ""))
    return state == "victory"
        or state == "gameover"
        or state == "game over"
        or state == "game_over"
        or state == "game-over"
        or state == "defeat"
        or state == "defeated"
        or state == "loss"
        or state == "lost"
        or state == "dead"
        or state == "ended"
        or state == "finished"
end

Fns.IsTerminalBattleController = function(controller)
    if type(controller) ~= "table" then return true end
    local function flagTrue(v)
        return v == true or v == 1 or v == "1"
    end
    if Fns.IsTerminalBattleState(rawget(controller, "State")) or Fns.IsTerminalBattleState(rawget(controller, "Status")) then
        return true
    end
    if flagTrue(rawget(controller, "Victory")) or flagTrue(rawget(controller, "Finished")) or flagTrue(rawget(controller, "Done")) or flagTrue(rawget(controller, "GameOver")) or flagTrue(rawget(controller, "Left")) then
        return true
    end
    if tonumber(rawget(controller, "Myfight")) == 7 then
        return true
    end
    for _, key in ipairs({ "Battle", "Fight", "FightState", "Ts", "Controller" }) do
        local nested = rawget(controller, key)
        if type(nested) == "table" then
            if Fns.IsTerminalBattleState(rawget(nested, "State")) or Fns.IsTerminalBattleState(rawget(nested, "Status")) then
                return true
            end
            if flagTrue(rawget(nested, "Victory")) or flagTrue(rawget(nested, "Finished")) or flagTrue(rawget(nested, "Done")) or flagTrue(rawget(nested, "GameOver")) or flagTrue(rawget(nested, "Left")) then
                return true
            end
            if tonumber(rawget(nested, "Myfight")) == 7 then
                return true
            end
        end
    end
    local roster = rawget(controller, "Roster")
    if type(roster) ~= "table" then
        return false
    end
    local members = rawget(roster, "Members")
    if type(members) ~= "table" or #members == 0 then
        return false
    end
    return false
end

Fns.FindLiveBattleController = function(force, forceRescan)
    local now = os.clock()
    local cached = LiveBattleCache.Battle
    local cachedValid = type(cached) == "table"
        and not Fns.IsTerminalBattleController(cached)
        and type(rawget(cached, "Roster")) == "table"
    local active = type(BattleLifecycle) == "table" and BattleLifecycle.ActiveController or nil
    local activeValid = type(BattleLifecycle) == "table"
        and type(active) == "table"
        and not Fns.IsTerminalBattleController(active)
        and type(rawget(active, "Roster")) == "table"
        and type(Fns.GetBattleSignature) == "function"
        and BattleLifecycle.ActiveSignature == Fns.GetBattleSignature(active)

    if activeValid and LiveBattleCache.Battle == active and not forceRescan then
        LiveBattleCache.LastScan = now
        return active
    end
    local cacheWindow = 6
    if PinksState and (PinksState.TPInfinite or PinksState.HPInfinite or PinksState.GodMode) then
        cacheWindow = 10
    end
    if cachedValid and not force and (now - (LiveBattleCache.LastScan or 0)) < cacheWindow then
        return cached
    end

    local found = nil
    local bestScore = -1
    local scanSucceeded = false
    local callSucceeded = pcall(function()
        if type(getgc) ~= "function" then return end
        local objects = getgc(true)
        if type(objects) ~= "table" then return end
        scanSucceeded = true
        for _, candidate in pairs(objects) do
            if type(candidate) == "table" and not Fns.IsTerminalBattleController(candidate) then
                local roster = rawget(candidate, "Roster")
                local members = type(roster) == "table" and rawget(roster, "Members") or nil
                if type(roster) == "table" and type(members) == "table" and #members > 0 then
                    local score = 4
                    if type(rawget(candidate, "Tension")) == "number" then score += 2 end
                    if type(rawget(candidate, "TensionMax")) == "number" then score += 1 end
                    if type(rawget(candidate, "TensionBar")) == "table" then score += 1 end
                    if type(rawget(candidate, "StartEnemyTurn")) == "function" then score += 3 end
                    if type(candidate.EnemyList) == "function" then
                        score += 6
                        local okEnemies, candidateEnemies = pcall(function() return candidate:EnemyList() end)
                        if okEnemies and type(candidateEnemies) == "table" then
                            local liveEnemyCount = 0
                            for _, candidateEnemy in pairs(candidateEnemies) do
                                if type(candidateEnemy) == "table"
                                    and rawget(candidateEnemy, "Alive") ~= false
                                    and rawget(candidateEnemy, "Gone") ~= true
                                    and rawget(candidateEnemy, "Absent") ~= true then
                                    liveEnemyCount += 1
                                end
                            end
                            if liveEnemyCount > 0 then
                                score = score + 9
                            else
                                score = score - 3
                            end
                        end
                    end
                    if type(rawget(candidate, "EnterVictory")) == "function" then score += 2 end
                    if type(rawget(candidate, "RefreshUi")) == "function" then score += 2 end
                    if type(rawget(candidate, "Step")) == "function" then score += 1 end
                    local stateName = string.lower(tostring(rawget(candidate, "State") or ""))
                    if stateName ~= "" then score += 2 end
                    if stateName == "fight" then score += 5 end
                    if stateName == "act" or stateName == "action" or stateName == "spell" or stateName == "playerturn" or stateName == "enemyturn" then score += 2 end
                    if type(rawget(candidate, "AttackRows")) == "table" and stateName == "fight" then score += 3 end
                    if type(rawget(candidate, "CommitLocal")) == "function" then score += 2 end
                    local nested = rawget(candidate, "Battle")
                    if type(nested) == "table" then
                        score += 2
                        if type(rawget(nested, "ClearBullets")) == "function" then score += 2 end
                        if type(rawget(nested, "Bullets")) == "table" then score += 1 end
                        if rawget(nested, "Soul") ~= nil or type(rawget(nested, "Souls")) == "table" then score += 2 end
                        if rawget(nested, "SoulActive") ~= nil then score += 1 end
                    end
                    if candidate == cached and cachedValid and not force then score += 1 end
                    if score > bestScore then
                        bestScore = score
                        found = candidate
                    end
                end
            end
        end
    end)

    if type(found) == "table" then
        LiveBattleCache.Battle = found
    elseif force and scanSucceeded and callSucceeded then
        LiveBattleCache.Battle = nil
    elseif not cachedValid then
        LiveBattleCache.Battle = nil
    end
    LiveBattleCache.LastScan = now
    return LiveBattleCache.Battle
end

Fns.GetLiveSoul = function(battle)
    if type(battle) ~= "table" then
        return nil
    end
    local b = rawget(battle, "Battle")
    if type(b) == "table" then
        local soul = rawget(b, "Soul")
        if type(soul) == "table" and Fns.IsLocalSoul(soul) then
            return soul
        end
        local souls = rawget(b, "Souls")
        if type(souls) == "table" then
            for _, s in pairs(souls) do
                if type(s) == "table" and rawget(s, "Invuln") ~= nil and Fns.IsLocalSoul(s) then
                    return s
                end
            end
        end
    end
    return nil
end

Fns.ForEachLiveSoul = function(battle, fn)
    if type(battle) ~= "table" or type(fn) ~= "function" then return end
    local roots, rootSeen, soulSeen = {}, {}, {}
    local function addRoot(root)
        if type(root) == "table" and not rootSeen[root] then
            rootSeen[root] = true
            roots[#roots + 1] = root
        end
    end
    local function addSoul(soul)
        if type(soul) == "table" and not soulSeen[soul] and Fns.IsLocalSoul(soul) then
            soulSeen[soul] = true
            fn(soul)
        end
    end
    addRoot(battle)
    for _, key in ipairs({ "Battle", "Controller", "Wave" }) do
        addRoot(rawget(battle, key))
    end
    local rootIndex = 1
    while rootIndex <= #roots do
        local root = roots[rootIndex]
        rootIndex += 1
        addRoot(rawget(root, "Battle"))
        addRoot(rawget(root, "Controller"))
        addSoul(rawget(root, "Soul"))
        local souls = rawget(root, "Souls")
        if type(souls) == "table" then
            for _, soul in pairs(souls) do addSoul(soul) end
        end
    end
end

Fns.UnlockTPNow = function()
    local max = Fns.GetTensionMax()
    Fns.RescanCache("hard")
    pcall(function()
        local battle = Fns.FindLiveBattleController(true)
        if type(battle) == "table" then
            if type(rawget(battle, "SetTensionMax")) == "function" then
                pcall(function() battle:SetTensionMax(max) end)
            end
            rawset(battle, "TensionMax", max)
            local bar = rawget(battle, "TensionBar")
            if type(bar) == "table" then
                if type(bar.Snap) == "function" then
                    pcall(function() bar:Snap(tonumber(rawget(battle, "Tension")) or 0) end)
                end
            end
            if type(battle.StepTensionBar) == "function" then
                pcall(function() battle:StepTensionBar() end)
            end
        end
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" and type(rawget(v, "TensionMax")) == "number" then
                if type(rawget(v, "Tension")) == "number" or type(rawget(v, "TensionBar")) == "table" then
                    rawset(v, "TensionMax", max)
                    if type(rawget(v, "SetTensionMax")) == "function" then
                        pcall(function() v:SetTensionMax(max) end)
                    end
                end
            end
        end
        for _, v in pairs(Cache.TensionTables) do
            rawset(v, "TensionMax", max)
            if type(rawget(v, "SetTensionMax")) == "function" then
                pcall(function() v:SetTensionMax(max) end)
            end
        end
    end)
end

Fns.MaxDokiMeterNow = function()
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

Fns.LightPartyHPFull = function()
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
        if type(member) == "table" and (type(Fns.IsLocalPartyMember) ~= "function" or Fns.IsLocalPartyMember(member)) then
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

Fns.ForcePartyHPFull = function(battleOverride)
    pcall(function()
        local battle = type(battleOverride) == "table" and battleOverride or Fns.FindLiveBattleController(true)
        if type(battle) == "table" then
            local roster = rawget(battle, "Roster")
            local members = type(roster) == "table" and rawget(roster, "Members") or nil
            if type(members) == "table" then
                for _, member in ipairs(members) do
                    if type(member) == "table" and (type(Fns.IsLocalPartyMember) ~= "function" or Fns.IsLocalPartyMember(member)) then
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
            Fns.ForEachLiveSoul(battle, function(soul)
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
        if not Fns.IsMultiplayerSession() then
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
        end
    end)
end

Fns.GivePartyHP = function(amount, actorFilter)
    amount = tonumber(amount) or 0
    if amount == 0 then
        return
    end
    actorFilter = tostring(actorFilter or PinksState.HPTargetActor or "All")
    local wantAll = actorFilter == "" or actorFilter == "All" or actorFilter == "(All)"
    local function matchesMember(member)
        if wantAll then return true end
        if type(member) ~= "table" then return false end
        local names = {
            rawget(member, "Key"),
            rawget(member, "Name"),
            rawget(member, "ActorKey"),
            rawget(member, "Id"),
            rawget(member, "ShowName"),
        }
        local def = rawget(member, "Def")
        if type(def) == "table" then
            table.insert(names, rawget(def, "Key"))
            table.insert(names, rawget(def, "Name"))
            table.insert(names, rawget(def, "Actor"))
        end
        local target = string.lower(actorFilter)
        for _, n in ipairs(names) do
            if type(n) == "string" and string.lower(n) == target then
                return true
            end
        end
        return false
    end
    pcall(function()
        local battle = LiveBattleCache.Battle
        if type(battle) ~= "table" then
            battle = Fns.FindLiveBattleController(true)
        end
        if type(battle) == "table" then
            local roster = rawget(battle, "Roster")
            local members = type(roster) == "table" and rawget(roster, "Members") or nil
            if type(members) == "table" then
                for _, member in ipairs(members) do
                    if type(member) == "table" and type(rawget(member, "HP")) == "number" and matchesMember(member) and Fns.IsLocalPartyMember(member) then
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
            Fns.RescanCache("hard")
        end
        if wantAll and not Fns.IsMultiplayerSession() then
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
        end
    end)
end

Fns.ClearLiveBattleAttacks = function(battle)
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
        end
        if type(rawget(b, "Bullets")) == "table" then
            local bullets = b.Bullets
            local keys = {}
            for k, bullet in pairs(bullets) do
                table.insert(keys, k)
                if type(bullet) == "table" then
                    rawset(bullet, "Harmful", false)
                    rawset(bullet, "Damage", 0)
                    rawset(bullet, "Alive", false)
                    if type(bullet.Destroy) == "function" then
                        pcall(function() bullet:Destroy() end)
                    end
                end
            end
            for _, k in ipairs(keys) do
                bullets[k] = nil
            end
            if table.clear then
                table.clear(bullets)
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

Fns.InstallDeleteAttackHooks = function(battle)
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
                    Fns.ClearLiveBattleAttacks(LiveBattleCache.Battle or battle)
                end)
            end
            return result
        end)
    end
end

Fns.LightClearAttacks = function()
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        battle = Fns.FindLiveBattleController(false)
    end
    if type(battle) ~= "table" then
        return
    end
    Fns.ClearLiveBattleAttacks(battle)
    pcall(function()
        local b = rawget(battle, "Battle") or battle
        if type(b) == "table" and type(b.ClearBullets) == "function" then
            b:ClearBullets()
        end
    end)
end

Fns.ClearBulletsNow = function()
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        battle = Fns.FindLiveBattleController(false)
    end
    if type(battle) == "table" then
        Fns.InstallDeleteAttackHooks(battle)
        Fns.ClearLiveBattleAttacks(battle)
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

Fns.GetNetModule = function()
    local net = nil
    pcall(function()
        net = require(ReplicatedStorage.Core.System.Net)
    end)
    return net
end

Fns.BroadcastWinSync = function()
    local Net = Fns.GetNetModule()
    if not Net or type(Net.SendSync) ~= "function" then
        return
    end
    pcall(function()
        Net.SendSync({ Win = 1 })
    end)
end

Fns.ZeroAllEnemiesOn = function(ctrl)
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

Fns.TryWinOn = function(ctrl)
    if type(ctrl) ~= "table" then return false end
    local ok = false
    pcall(function()
        Fns.ZeroAllEnemiesOn(ctrl)
        local nested = rawget(ctrl, "Battle")
        if type(nested) == "table" then
            if type(nested.StopWaves) == "function" then nested:StopWaves() end
            if type(nested.ClearBullets) == "function" then nested:ClearBullets() end
            Fns.ZeroAllEnemiesOn(nested)
        end
        if type(ctrl.StopWaves) == "function" then ctrl:StopWaves() end
        if type(ctrl.ClearBullets) == "function" then ctrl:ClearBullets() end
        if type(ctrl.WinCombat) == "function" then
            ctrl:WinCombat()
            ok = true
        end
        local ts = rawget(ctrl, "Ts") or ctrl
        if type(ts) == "table" then
            if type(ts.WinCombat) == "function" then
                ts:WinCombat()
                ok = true
            end
            if type(ts.EnterVictory) == "function" then
                local st = tostring(rawget(ts, "State") or "")
                if st ~= "Victory" and st ~= "GameOver" then
                    pcall(function() ts:EnterVictory() end)
                    ok = true
                end
            end
        end
        if type(ctrl.EnterVictory) == "function" then
            pcall(function() ctrl:EnterVictory() end)
            ok = true
        end
        if type(ctrl.EndBattle) == "function" then
            pcall(function() ctrl:EndBattle() end)
            ok = true
        end
        local fight = rawget(ctrl, "Fight") or rawget(ctrl, "FightState")
        if type(fight) == "table" then
            if type(fight.WinCombat) == "function" then pcall(function() fight:WinCombat() end) ok = true end
            if type(fight.EnterVictory) == "function" then pcall(function() fight:EnterVictory() end) ok = true end
        end
        if type(ctrl.Controller) == "table" then
            rawset(ctrl.Controller, "Victory", 1)
        end
        if rawget(ctrl, "Victory") ~= nil then
            rawset(ctrl, "Victory", 1)
        end
    end)
    return ok
end

Fns.InstantWinNow = function()
    pcall(function()
        local battle = LiveBattleCache.Battle
        if type(battle) ~= "table" then
            battle = Fns.FindLiveBattleController(true, false)
        end
        local fired = false
        if type(battle) == "table" then
            fired = Fns.TryWinOn(battle) or fired
            fired = Fns.TryWinOn(rawget(battle, "Battle")) or fired
            fired = Fns.TryWinOn(rawget(battle, "Fight")) or fired
            fired = Fns.TryWinOn(rawget(battle, "FightState")) or fired
            fired = Fns.TryWinOn(rawget(battle, "Ts")) or fired
        end
        if not fired and type(getgc) == "function" then
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" then
                    if type(rawget(v, "WinCombat")) == "function" or (type(rawget(v, "EnterVictory")) == "function" and type(rawget(v, "Roster")) == "table") then
                        if Fns.TryWinOn(v) then
                            fired = true
                            break
                        end
                    end
                end
            end
        end
        Fns.BroadcastWinSync()
        SoftRecoverAfterBattle()
    end)
end

Fns.SkipEnemyTurnNow = function()
    pcall(function()
        local battle = LiveBattleCache.Battle
        if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then
            battle = Fns.FindLiveBattleController(true)
        end
        local targets = {}
        if type(battle) == "table" then
            table.insert(targets, battle)
            local nested = rawget(battle, "Battle")
            if type(nested) == "table" then table.insert(targets, nested) end
            local fs = rawget(battle, "FightState")
            if type(fs) == "table" then table.insert(targets, fs) end
        end
        for _, v in ipairs(targets) do
            pcall(function()
                if type(v.StopWaves) == "function" then v:StopWaves() end
                if type(v.ClearBullets) == "function" then v:ClearBullets() end
                if type(rawget(v, "Bullets")) == "table" then
                    local bullets = v.Bullets
                    for i = #bullets, 1, -1 do
                        local b = bullets[i]
                        if type(b) == "table" then
                            rawset(b, "Harmful", false)
                            rawset(b, "Damage", 0)
                            if type(b.Destroy) == "function" then pcall(function() b:Destroy() end) end
                        end
                        table.remove(bullets, i)
                    end
                end
                if type(v.EndEnemyTurn) == "function" then v:EndEnemyTurn() end
                if type(v.StartPlayerTurn) == "function" then v:StartPlayerTurn() end
                if type(v.BeginPlayerTurn) == "function" then v:BeginPlayerTurn() end
                if rawget(v, "State") ~= nil then
                    local st = string.lower(tostring(rawget(v, "State") or ""))
                    if st == "enemyturn" or st == "enemy" or st == "bullet" then
                        rawset(v, "State", "playerturn")
                    end
                end
            end)
        end
        if type(battle) == "table" then
            Fns.ClearLiveBattleAttacks(battle)
        end
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" and type(rawget(v, "Roster")) == "table" and type(v.EndEnemyTurn) == "function" then
                pcall(function()
                    if type(v.StopWaves) == "function" then v:StopWaves() end
                    if type(v.ClearBullets) == "function" then v:ClearBullets() end
                    v:EndEnemyTurn()
                end)
            end
        end
    end)
end

Fns.EnemyMercyMax = function(enemy)
    if type(enemy) ~= "table" then return 100 end
    local def = rawget(enemy, "Def")
    local maxm = 100
    if type(def) == "table" then
        if type(rawget(def, "MercyMax")) == "number" and rawget(def, "MercyMax") > 0 then maxm = rawget(def, "MercyMax") end
        if type(rawget(def, "Maxmercy")) == "number" and rawget(def, "Maxmercy") > 0 then maxm = rawget(def, "Maxmercy") end
    end
    if type(rawget(enemy, "MercyMax")) == "number" and rawget(enemy, "MercyMax") > 0 then maxm = rawget(enemy, "MercyMax") end
    if type(rawget(enemy, "Maxmercy")) == "number" and rawget(enemy, "Maxmercy") > 0 then maxm = rawget(enemy, "Maxmercy") end
    return maxm
end

Fns.ApplyMercyToEnemy = function(owner, enemy, amount)
    if type(enemy) ~= "table" then return false end
    local maxm = Fns.EnemyMercyMax(enemy)
    local desired = amount
    if desired == nil then
        desired = maxm
    else
        desired = math.clamp(tonumber(desired) or 0, 0, maxm)
    end
    local current = tonumber(rawget(enemy, "Mercy")) or 0
    local delta = desired - current
    local ok = false
    if type(owner) == "table" and type(rawget(owner, "AddMercy")) == "function" and delta ~= 0 then
        local success = pcall(function() owner:AddMercy(enemy, delta) end)
        local after = tonumber(rawget(enemy, "Mercy"))
        if success and after ~= nil and math.abs(after - desired) < 0.5 then
            ok = true
        end
    end
    rawset(enemy, "Mercy", desired)
    local def = rawget(enemy, "Def")
    if type(def) == "table" and rawget(def, "Mercy") ~= nil then
        rawset(def, "Mercy", desired)
    end
    return true
end

Fns.CollectMercyTargets = function(battle)
    local list = {}
    local seen = {}
    local function add(e)
        if type(e) ~= "table" or seen[e] then return end
        if rawget(e, "Gone") == true or rawget(e, "Alive") == false then return end
        seen[e] = true
        list[#list + 1] = e
    end
    if type(battle) ~= "table" then return list end
    pcall(function()
        for _, e in ipairs(Fns.GetBattleEnemies(battle)) do add(e) end
    end)
    local roots = { battle, rawget(battle, "Battle"), rawget(battle, "Ts"), rawget(battle, "Fight"), rawget(battle, "FightState") }
    for _, root in ipairs(roots) do
        if type(root) == "table" then
            if type(rawget(root, "EnemyList")) == "function" then
                pcall(function()
                    local el = root:EnemyList()
                    if type(el) == "table" then
                        for _, e in pairs(el) do add(e) end
                    end
                end)
            end
            if type(rawget(root, "EnemyAt")) == "function" then
                for i = 1, 12 do
                    pcall(function()
                        local e = root:EnemyAt(i)
                        if type(e) == "table" then add(e) end
                    end)
                end
            end
            local inst = rawget(root, "Instances") or rawget(root, "Monsterinstance")
            if type(inst) == "table" then
                for _, e in pairs(inst) do
                    if type(e) == "table" and (rawget(e, "Mercy") ~= nil or type(rawget(e, "Def")) == "table") then
                        add(e)
                    end
                end
            end
        end
    end
    return list
end

Fns.MaxMercyNow = function()
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then
        battle = Fns.FindLiveBattleController(true, false)
    end
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then return false end
    if type(Fns.AdoptBattleController) == "function" then pcall(Fns.AdoptBattleController, battle) end
    local changed = false
    local owners = { battle, rawget(battle, "Battle"), rawget(battle, "Ts"), rawget(battle, "Fight") }
    local targets = Fns.CollectMercyTargets(battle)
    for _, enemy in ipairs(targets) do
        for _, owner in ipairs(owners) do
            Fns.ApplyMercyToEnemy(owner, enemy, nil)
        end
        Fns.ApplyMercyToEnemy(nil, enemy, nil)
        changed = true
    end
    pcall(function()
        if type(getgc) == "function" then
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" and type(rawget(v, "Mercy")) == "number" then
                    local maxm = Fns.EnemyMercyMax(v)
                    if tonumber(rawget(v, "Mercy")) < maxm then
                        rawset(v, "Mercy", maxm)
                        changed = true
                    end
                end
            end
        end
    end)
    for _, owner in ipairs(owners) do
        if type(owner) == "table" and type(rawget(owner, "RefreshUi")) == "function" then
            pcall(function() owner:RefreshUi() end)
        end
    end
    return changed
end

Fns.IsMultiplayerSession = function()
    local Net = nil
    local ok = pcall(function()
        Net = require(ReplicatedStorage.Core.System.Net)
    end)
    if not ok or type(Net) ~= "table" or rawget(Net, "Active") ~= true then
        return false
    end
    local localId = rawget(Net, "LocalId")
    local seen, count = {}, 0
    local function addOwner(ownerId)
        if ownerId == nil or seen[ownerId] then return end
        seen[ownerId] = true
        count += 1
    end
    local participants = rawget(Net, "Participants")
    if type(participants) == "table" then
        for _, participantId in pairs(participants) do addOwner(participantId) end
    end
    local ownership = rawget(Net, "Ownership")
    if type(ownership) == "table" then
        for _, ownerId in pairs(ownership) do addOwner(ownerId) end
    end
    if count > 1 then return true end
    if count == 1 then
        for ownerId in pairs(seen) do
            return ownerId ~= localId
        end
    end
    return true
end

Fns.IsLocalPartyMember = function(member)
    if type(member) ~= "table" then
        return false
    end
    local Net = nil
    pcall(function()
        Net = require(ReplicatedStorage.Core.System.Net)
    end)
    local localId = type(Net) == "table" and rawget(Net, "LocalId") or nil
    local owner = rawget(member, "Owner")
    if owner ~= nil and localId ~= nil then
        return owner == localId or owner == LocalPlayer.UserId
    end
    local slot = tonumber(rawget(member, "Slot"))
    local ownership = type(Net) == "table" and rawget(Net, "Ownership") or nil
    if slot and type(ownership) == "table" and ownership[slot] ~= nil and localId ~= nil then
        return ownership[slot] == localId or ownership[slot] == LocalPlayer.UserId
    end
    if Fns.IsMultiplayerSession() then
        return false
    end
    return true
end

Fns.IsLocalSoul = function(soul)
    if type(soul) ~= "table" then return false end
    local owner = rawget(soul, "Owner")
    if owner == nil then return true end
    local Net = nil
    pcall(function() Net = require(ReplicatedStorage.Core.System.Net) end)
    local localId = type(Net) == "table" and rawget(Net, "LocalId") or nil
    if localId ~= nil then return owner == localId or owner == LocalPlayer.UserId end
    return not Fns.IsMultiplayerSession()
end

Fns.DeferLocalSoulPatch = function(soul, callback)
    if type(soul) ~= "table" or type(callback) ~= "function" then return end
    local function apply()
        if Fns.IsLocalSoul(soul) then pcall(callback, soul) end
    end
    if Fns.IsMultiplayerSession() then
        if type(task) == "table" and type(task.defer) == "function" then
            pcall(function() task.defer(apply) end)
        end
        return
    end
    apply()
end

local HPInfiniteHookInstalled = false
local HPInfiniteHookWrapper = nil
local PartyDamagePrototype = nil

Fns.InstallHPInfiniteHook = function()
    local ok = pcall(function()
        local Party = require(ReplicatedStorage.Core.Data.Party)
        if type(Party) ~= "table" or type(Party.NewMember) ~= "function" then return end
        local sample = Party.NewMember("Kris", 1, 1)
        if type(sample) ~= "table" then return end
        local mt = getmetatable(sample)
        local prototype = type(mt) == "table" and (rawget(mt, "__index") or mt) or nil
        if type(prototype) ~= "table" then return end
        local currentDamage = rawget(prototype, "Damage")
        local installed = rawget(prototype, "_SWHpDamageWrapper")
        if type(currentDamage) == "function" and currentDamage == installed then
            PartyDamagePrototype = prototype
            HPInfiniteHookWrapper = installed
            HPInfiniteHookInstalled = true
            return
        end
        local originalDamage = rawget(prototype, "_SWHpOriginalDamage") or currentDamage
        if type(originalDamage) ~= "function" then return end
        local wrapper = function(self, ...)
            local protected = PinksState.HPInfinite == true or PinksState.GodMode == true
            if protected and type(self) == "table" and Fns.IsLocalPartyMember(self) then
                local maxHP = tonumber(rawget(self, "MaxHP"))
                if maxHP and maxHP > 0 then
                    rawset(self, "HP", maxHP)
                    rawset(self, "Down", false)
                    rawset(self, "Swooned", false)
                    return 0
                end
            end
            return originalDamage(self, ...)
        end
        rawset(prototype, "_SWHpOriginalDamage", originalDamage)
        rawset(prototype, "_SWHpDamageWrapper", wrapper)
        rawset(prototype, "Damage", wrapper)
        local hooks = rawget(Party, "DamageHooks")
        if type(hooks) == "table" and rawget(Party, "_SWHpDamageHook") == nil then
            local damageHook = function(member, amount, options)
                if (PinksState.HPInfinite or PinksState.GodMode)
                    and type(member) == "table" and Fns.IsLocalPartyMember(member) then
                    local maxHP = tonumber(rawget(member, "MaxHP"))
                    if maxHP and maxHP > 0 then
                        rawset(member, "HP", maxHP)
                        rawset(member, "Down", false)
                        rawset(member, "Swooned", false)
                    end
                    return 0
                end
                return amount
            end
            table.insert(hooks, damageHook)
            rawset(Party, "_SWHpDamageHook", damageHook)
        end
        PartyDamagePrototype = prototype
        HPInfiniteHookWrapper = wrapper
        HPInfiniteHookInstalled = true
    end)
    return ok and HPInfiniteHookInstalled
end

Fns.InstallHPInfiniteHook()

local GodModeSoulHooksInstalled = false

local GodModeSoulOriginals = setmetatable({}, { __mode = "k" })

Fns.PatchGodModeSoul = function(soul)
    if type(soul) ~= "table" or not Fns.IsLocalSoul(soul) then return end
    local protected = PinksState.HPInfinite == true or PinksState.GodMode == true
    local currentDamage = soul.Damage
    local installedWrapper = rawget(soul, "_SWGodModeDamageWrapper")
    if type(currentDamage) == "function" and currentDamage ~= installedWrapper then
        local originalDamage = rawget(soul, "_SWGodModeOriginalDamage") or currentDamage
        local wrapper = function(self, ...)
            if PinksState.HPInfinite == true or PinksState.GodMode == true then
                local maxHP = tonumber(rawget(self, "MaxHP"))
                if maxHP and maxHP > 0 then rawset(self, "HP", maxHP) end
                return false
            end
            return originalDamage(self, ...)
        end
        rawset(soul, "_SWGodModeOriginalDamage", originalDamage)
        rawset(soul, "_SWGodModeDamageWrapper", wrapper)
        rawset(soul, "Damage", wrapper)
    end
    if protected then
        local maxHP = tonumber(rawget(soul, "MaxHP"))
        if maxHP and maxHP > 0 then rawset(soul, "HP", maxHP) end
        if PinksState.GodMode then
            if not GodModeSoulOriginals[soul] then
                GodModeSoulOriginals[soul] = { Invuln = rawget(soul, "Invuln") }
            end
            rawset(soul, "Invuln", 999999)
        else
            local original = GodModeSoulOriginals[soul]
            if original then
                rawset(soul, "Invuln", original.Invuln)
                GodModeSoulOriginals[soul] = nil
            end
        end
    else
        local original = GodModeSoulOriginals[soul]
        if original then
            rawset(soul, "Invuln", original.Invuln)
            GodModeSoulOriginals[soul] = nil
        end
    end
end

Fns.PatchPartyMemberGodMode = function(member)
    Fns.InstallHPInfiniteHook()
    if type(member) == "table" and Fns.IsLocalPartyMember(member)
        and (PinksState.HPInfinite or PinksState.GodMode) then
        local maxHP = tonumber(rawget(member, "MaxHP"))
        if maxHP and maxHP > 0 then
            rawset(member, "HP", maxHP)
            rawset(member, "Down", false)
            rawset(member, "Swooned", false)
        end
    end
end

Fns.ApplyGodModeLive = function()
    if not PinksState.GodMode and not PinksState.HPInfinite then return end
    Fns.InstallHPInfiniteHook()
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then battle = Fns.FindLiveBattleController(false) end
    if type(battle) == "table" then
        Fns.ForEachLiveSoul(battle, function(soul)
            Fns.PatchGodModeSoul(soul)
            local hp, maxHP = tonumber(rawget(soul, "HP")), tonumber(rawget(soul, "MaxHP"))
            if hp and maxHP and maxHP > 0 then rawset(soul, "HP", maxHP) end
        end)
        local roster = rawget(battle, "Roster")
        local members = type(roster) == "table" and rawget(roster, "Members") or nil
        if type(members) == "table" then
            for _, member in ipairs(members) do Fns.PatchPartyMemberGodMode(member) end
        end
    end
    if not Fns.IsMultiplayerSession() then
        for _, soul in pairs(Cache.SoulTables) do
            if type(soul) == "table" then Fns.PatchGodModeSoul(soul) end
        end
    end
end

Fns.InstallGodModeSoulHooks = function()
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
            Fns.DeferLocalSoulPatch(soul, function(localSoul)
                Fns.PatchGodModeSoul(localSoul)
                if PinksState.FreeSoulToggle and type(Fns.PatchFreeSoulInstance) == "function" then
                    Fns.PatchFreeSoulInstance(localSoul)
                end
            end)
            return soul
        end
        GodModeSoulHooksInstalled = true
    end)
end

Fns.ApplyGodMode = function(on, battleOverride)
    PinksState.GodMode = on == true
    Fns.InstallGodModeSoulHooks()
    Fns.InstallHPInfiniteHook()
    pcall(Fns.InstallUndertaleProtectionHooks)
    local battle = type(battleOverride) == "table" and battleOverride or LiveBattleCache.Battle
    if type(battle) ~= "table" and on then battle = Fns.FindLiveBattleController(true) end
    if type(battle) == "table" then
        Fns.ForEachLiveSoul(battle, Fns.PatchGodModeSoul)
        local roster = rawget(battle, "Roster")
        local members = type(roster) == "table" and rawget(roster, "Members") or nil
        if type(members) == "table" then
            for _, member in ipairs(members) do Fns.PatchPartyMemberGodMode(member) end
        end
    end
    if not Fns.IsMultiplayerSession() then
        for _, soul in pairs(Cache.SoulTables) do
            if type(soul) == "table" then Fns.PatchGodModeSoul(soul) end
        end
    end
    if type(Fns.ApplyUndertaleProtectionStep) == "function" then pcall(Fns.ApplyUndertaleProtectionStep) end
end

local UndertaleHostInstances = setmetatable({}, { __mode = "k" })
local UndertaleHostOriginals = setmetatable({}, { __mode = "k" })
local UndertaleHostLastScan = 0

Fns.IsHPProtectionEnabled = function()
    return PinksState.HPInfinite == true or PinksState.GodMode == true
end

Fns.IsLocalUndertaleHost = function(host)
    if type(host) ~= "table" then return false end
    if not Fns.IsMultiplayerSession() then return true end

    local Net = nil
    pcall(function() Net = require(ReplicatedStorage.Core.System.Net) end)
    if type(Net) ~= "table" then return false end
    local localId = rawget(Net, "LocalId")
    local userId = LocalPlayer and LocalPlayer.UserId or nil
    local function matchesLocal(value)
        if type(value) == "table" then
            value = rawget(value, "UserId") or rawget(value, "Id") or rawget(value, "OwnerId")
        end
        return value ~= nil and (value == localId or value == userId)
    end

    local roots = { host, rawget(host, "Engine") }
    for _, root in ipairs(roots) do
        if type(root) == "table" then
            for _, key in ipairs({ "Owner", "OwnerId", "PlayerId", "UserId", "ClientId", "LocalId", "InputOwner" }) do
                local value = rawget(root, key)
                if value ~= nil then return matchesLocal(value) end
            end
            local slot = tonumber(rawget(root, "Slot")) or tonumber(rawget(root, "OwnerSlot"))
            local ownership = rawget(Net, "Ownership")
            if slot and type(ownership) == "table" and ownership[slot] ~= nil then
                return matchesLocal(ownership[slot])
            end
        end
    end

    local engine = rawget(host, "Engine")
    local room = rawget(host, "Room")
    local api = rawget(host, "Api")
    if type(engine) == "table" and type(room) == "table" and type(api) == "table" then
        return true
    end
    return false
end

Fns.KeepUndertaleHostAlive = function(host)
    if type(host) ~= "table" or not Fns.IsLocalUndertaleHost(host) then return end
    local engine = rawget(host, "Engine")
    if type(engine) ~= "table" then return end
    local hpKey = rawget(host, "HpKey") or "Hp"
    local maxKey = rawget(host, "MaxHpKey") or "Maxhp"
    local invKey = rawget(host, "InvcKey") or "Invc"
    if type(hpKey) ~= "string" then hpKey = "Hp" end
    if type(maxKey) ~= "string" then maxKey = "Maxhp" end
    if type(invKey) ~= "string" then invKey = "Invc" end
    if Fns.IsHPProtectionEnabled() then
        local maxHP = tonumber(rawget(engine, maxKey)) or tonumber(rawget(host, "HpFull")) or 9999
        if maxHP < 1 then maxHP = 9999 end
        rawset(engine, maxKey, maxHP)
        rawset(engine, hpKey, maxHP)
    end
    if PinksState.GodMode then
        local originals = UndertaleHostOriginals[host]
        if not originals then
            originals = {}
            UndertaleHostOriginals[host] = originals
        end
        if originals.Engine ~= engine or originals.InvKey ~= invKey or originals.InvulnCaptured ~= true then
            originals.Engine = engine
            originals.InvKey = invKey
            originals.Invuln = rawget(engine, invKey)
            originals.HasInvuln = originals.Invuln ~= nil
            originals.InvulnCaptured = true
        end
        rawset(engine, invKey, 999999)
    else
        local originals = UndertaleHostOriginals[host]
        if originals and originals.Engine == engine and originals.InvKey == invKey and originals.InvulnCaptured == true then
            if originals.HasInvuln then
                rawset(engine, invKey, originals.Invuln)
            else
                rawset(engine, invKey, nil)
            end
            originals.Invuln = nil
            originals.HasInvuln = false
            originals.InvulnCaptured = false
        end
    end
end

Fns.PatchUndertaleHostInstance = function(host)
    if type(host) ~= "table" then return false end
    UndertaleHostInstances[host] = true
    local originals = UndertaleHostOriginals[host]
    if not originals then
        originals = {}
        UndertaleHostOriginals[host] = originals
    end
    local methodNames = { "Hurt", "RecordHit", "StepDeath", "RoomGoto", "SyncHp" }
    for _, methodName in ipairs(methodNames) do
        local name = methodName
        local marker = "_SWUndertaleOriginal" .. name
        local wrapperMarker = "_SWUndertaleWrapper" .. name
        local current = host[name]
        local installed = rawget(host, wrapperMarker)
        if type(current) == "function" and current ~= installed then
            local original = rawget(host, marker) or current
            local wrapper
            if name == "SyncHp" then
                wrapper = function(self, ...)
                    local result = original(self, ...)
                    if Fns.IsLocalUndertaleHost(self) then
                        Fns.KeepUndertaleHostAlive(self)
                    end
                    return result
                end
            elseif name == "RoomGoto" then
                wrapper = function(self, destination, ...)
                    if Fns.IsHPProtectionEnabled()
                        and Fns.IsLocalUndertaleHost(self)
                        and destination == rawget(self, "GameOver") then
                        Fns.KeepUndertaleHostAlive(self)
                        return false
                    end
                    return original(self, destination, ...)
                end
            else
                wrapper = function(self, ...)
                    if Fns.IsHPProtectionEnabled() and Fns.IsLocalUndertaleHost(self) then
                        Fns.KeepUndertaleHostAlive(self)
                        if name == "StepDeath" then rawset(self, "Dying", nil) end
                        return false
                    end
                    return original(self, ...)
                end
            end
            rawset(host, marker, original)
            rawset(host, wrapperMarker, wrapper)
            rawset(host, name, wrapper)
        end
    end
    for _, callbackName in ipairs({ "OnHurt", "OnDrain" }) do
        local name = callbackName
        local marker = "_SWUndertaleOriginal" .. name
        local wrapperMarker = "_SWUndertaleWrapper" .. name
        local current = rawget(host, name)
        local installed = rawget(host, wrapperMarker)
        if type(current) == "function" and current ~= installed then
            local original = rawget(host, marker) or current
            local wrapper = function(...)
                if Fns.IsHPProtectionEnabled() and Fns.IsLocalUndertaleHost(host) then
                    Fns.KeepUndertaleHostAlive(host)
                    return
                end
                return original(...)
            end
            rawset(host, marker, original)
            rawset(host, wrapperMarker, wrapper)
            rawset(host, name, wrapper)
        end
    end
    if PinksState.FreeSoulToggle then
        local api = rawget(host, "Api")
        local soulApi = type(api) == "table" and rawget(api, "Soul") or nil
        local soulObject = type(soulApi) == "table" and rawget(soulApi, "Object") or nil
        if type(soulObject) == "table" then pcall(Fns.PatchFreeSoulInstance, soulObject) end
        local heart = rawget(host, "Heart")
        if type(heart) == "table" then pcall(Fns.PatchFreeSoulInstance, heart) end
    end
    Fns.KeepUndertaleHostAlive(host)
    return true
end

Fns.InstallUndertaleProtectionHooks = function()
    local ok = pcall(function()
        local Host = require(ReplicatedStorage.Core.Undertale.Host)
        if type(Host) ~= "table" then return end
        for _, methodName in ipairs({ "Start", "StartEmbedded" }) do
            local name = methodName
            local current = rawget(Host, name)
            local wrapperKey = "_SWUndertaleWrapper" .. name
            local installed = rawget(Host, wrapperKey)
            if type(current) == "function" and current ~= installed then
                local original = current
                local wrapper = function(...)
                    local host = original(...)
                    if type(host) == "table" then pcall(Fns.PatchUndertaleHostInstance, host) end
                    return host
                end
                rawset(Host, "_SWUndertaleOriginal" .. name, original)
                rawset(Host, wrapperKey, wrapper)
                rawset(Host, name, wrapper)
            end
        end
    end)
    return ok
end

Fns.ApplyUndertaleProtectionStep = function()
    if Fns.IsHPProtectionEnabled() or PinksState.FreeSoulToggle then
        pcall(Fns.InstallUndertaleProtectionHooks)
        local now = os.clock()
        if now - UndertaleHostLastScan >= 3.5 then
            UndertaleHostLastScan = now
            pcall(function()
                if type(getgc) ~= "function" then return end
                local objects = getgc(true)
                if type(objects) ~= "table" then return end
                for _, candidate in pairs(objects) do
                    if type(candidate) == "table"
                        and type(rawget(candidate, "Engine")) == "table"
                        and type(candidate.Hurt) == "function"
                        and type(candidate.SyncHp) == "function"
                        and (rawget(candidate, "Embedded") == true
                            or type(rawget(candidate, "HpKey")) == "string"
                            or rawget(candidate, "GameOver") ~= nil) then
                        pcall(Fns.PatchUndertaleHostInstance, candidate)
                    end
                end
            end)
        end
    end
    for host in pairs(UndertaleHostInstances) do
        if type(host) == "table" then pcall(Fns.PatchUndertaleHostInstance, host) end
    end
end

Fns.ApplyHPInfinite = function(on, battleOverride)
    PinksState.HPInfinite = on == true
    Fns.InstallHPInfiniteHook()
    Fns.InstallGodModeSoulHooks()
    pcall(Fns.InstallUndertaleProtectionHooks)
    local battle = type(battleOverride) == "table" and battleOverride or LiveBattleCache.Battle
    if type(battle) ~= "table" and on then battle = Fns.FindLiveBattleController(true, true) end
    if type(battle) == "table" then
        Fns.ForEachLiveSoul(battle, Fns.PatchGodModeSoul)
        if on then pcall(Fns.ForcePartyHPFull, battle) end
        local roster = rawget(battle, "Roster")
        local members = type(roster) == "table" and rawget(roster, "Members") or nil
        if type(members) == "table" then
            for _, member in ipairs(members) do pcall(Fns.PatchPartyMemberGodMode, member) end
        end
    end
    if not Fns.IsMultiplayerSession() then
        for _, soul in pairs(Cache.SoulTables) do
            if type(soul) == "table" then pcall(Fns.PatchGodModeSoul, soul) end
        end
    end
    pcall(Fns.ApplyUndertaleProtectionStep)
end

Fns.InstallUndertaleProtectionHooks()

local FreeSoulHooksInstalled = false

local EramNoclipActive = false
local SoulMovementOriginals = setmetatable({}, { __mode = "k" })
local SoulClampOriginal = nil
local SoulClampCaptured = false

Fns.IsSoulNoclipEnabled = function()
    return PinksState.FreeSoulToggle == true
        or (PinksState.EramNoclip == true and EramNoclipActive == true)
end

Fns.UpdateSoulClampOverride = function()
    if Fns.IsMultiplayerSession() then
        if SoulClampCaptured then
            local currentConfig = Fns.GetConfig()
            local currentSoulConfig = type(currentConfig) == "table" and rawget(currentConfig, "Soul") or nil
            if type(currentSoulConfig) == "table" then rawset(currentSoulConfig, "ClampToBattleArea", SoulClampOriginal) end
            SoulClampOriginal = nil
            SoulClampCaptured = false
        end
        return
    end
    local config = Fns.GetConfig()
    local soulConfig = type(config) == "table" and rawget(config, "Soul") or nil
    if type(soulConfig) ~= "table" then return end
    local enabled = Fns.IsSoulNoclipEnabled()
    if enabled then
        if not SoulClampCaptured then
            SoulClampOriginal = rawget(soulConfig, "ClampToBattleArea")
            SoulClampCaptured = true
        end
        rawset(soulConfig, "ClampToBattleArea", false)
    elseif SoulClampCaptured then
        rawset(soulConfig, "ClampToBattleArea", SoulClampOriginal)
        SoulClampOriginal = nil
        SoulClampCaptured = false
    end
end

Fns.PatchFreeSoulInstance = function(soul)
    if type(soul) ~= "table" or not Fns.IsLocalSoul(soul) then return end
    if rawget(soul, "_SWMovementHooksInstalled") ~= true then
        local originalIsBlocked = soul.IsBlocked
        local originalClampToArea = soul.ClampToArea
        if type(originalIsBlocked) == "function" then
            rawset(soul, "_SWMovementOriginalIsBlocked", originalIsBlocked)
            rawset(soul, "IsBlocked", function(self, ...)
                if Fns.IsSoulNoclipEnabled() then return false end
                return originalIsBlocked(self, ...)
            end)
        end
        if type(originalClampToArea) == "function" then
            rawset(soul, "_SWMovementOriginalClampToArea", originalClampToArea)
            rawset(soul, "ClampToArea", function(self, ...)
                if Fns.IsSoulNoclipEnabled() then return end
                return originalClampToArea(self, ...)
            end)
        end
        rawset(soul, "_SWMovementHooksInstalled", true)
    end

    if Fns.IsSoulNoclipEnabled() then
        if not SoulMovementOriginals[soul] then
            SoulMovementOriginals[soul] = {
                FreeRoam = rawget(soul, "FreeRoam"),
                Locked = rawget(soul, "Locked"),
                Frozen = rawget(soul, "Frozen"),
            }
        end
        rawset(soul, "FreeRoam", true)
        if rawget(soul, "Locked") ~= nil then rawset(soul, "Locked", false) end
        if rawget(soul, "Frozen") ~= nil then rawset(soul, "Frozen", false) end
    else
        local original = SoulMovementOriginals[soul]
        if original then
            rawset(soul, "FreeRoam", original.FreeRoam)
            rawset(soul, "Locked", original.Locked)
            rawset(soul, "Frozen", original.Frozen)
            SoulMovementOriginals[soul] = nil
            local clamp = rawget(soul, "_SWMovementOriginalClampToArea")
            if type(clamp) == "function" then pcall(clamp, soul) end
        end
    end
end

Fns.RefreshSoulMovementState = function(battle)
    if type(battle) == "table" then
        Fns.ForEachLiveSoul(battle, Fns.PatchFreeSoulInstance)
    end
    for soul in pairs(SoulMovementOriginals) do
        if type(soul) == "table" then Fns.PatchFreeSoulInstance(soul) end
    end
    Fns.UpdateSoulClampOverride()
end

Fns.InstallFreeSoulHooks = function()
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
            Fns.DeferLocalSoulPatch(soul, Fns.PatchFreeSoulInstance)
            if PinksState.GodMode or PinksState.HPInfinite then
                Fns.DeferLocalSoulPatch(soul, Fns.PatchGodModeSoul)
            end
            return soul
        end

        FreeSoulHooksInstalled = true
    end)
end

Fns.ApplyFreeSoul = function(on)
    PinksState.FreeSoulToggle = on == true
    Fns.InstallFreeSoulHooks()
    if #Cache.SoulTables == 0 then Fns.RescanCache("hard") end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" and on then battle = Fns.FindLiveBattleController(true) end
    Fns.RefreshSoulMovementState(battle)
    for _, soul in pairs(Cache.SoulTables) do
        if type(soul) == "table" then Fns.PatchFreeSoulInstance(soul) end
    end
    if type(Fns.ApplyUndertaleProtectionStep) == "function" then pcall(Fns.ApplyUndertaleProtectionStep) end
end

Fns.IsEramFight = function(battle)
    if type(battle) ~= "table" then return false end
    local roots, seen = {}, {}
    local function add(root)
        if type(root) == "table" and not seen[root] then
            seen[root] = true
            roots[#roots + 1] = root
        end
    end
    add(battle)
    for _, key in ipairs({ "Fight", "FightState", "Battle", "Controller", "Scene" }) do
        add(rawget(battle, key))
    end
    for _, root in ipairs(roots) do
        for _, key in ipairs({ "Id", "Wall", "Name", "Key", "FightId", "FightName" }) do
            local value = rawget(root, key)
            if type(value) == "string" and string.find(string.lower(value), "eram", 1, true) then
                return true
            end
        end
    end
    return false
end

Fns.EramNoclipStep = function()
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" and PinksState.EramNoclip then
        battle = Fns.FindLiveBattleController(false, false)
    end
    local active = PinksState.EramNoclip == true and type(battle) == "table" and Fns.IsEramFight(battle)
    EramNoclipActive = active == true
    Fns.RefreshSoulMovementState(battle)
end

Fns.ApplyEramNoclip = function(on)
    PinksState.EramNoclip = on == true
    Fns.EramNoclipStep()
end

local ERAM_CD_KEYS = {
    "AttackCooldown", "AttackCD", "AttackCooldownTimer", "AttackDelay",
    "AttackLockout", "NextAttackDelay", "NextAttackTimer", "NoAttackTimer",
    "SwingCooldown", "ActionCooldown", "ActCooldown", "SpellCooldown",
}
local ERAM_BOOL_KEYS = { "CanAttack", "AttackEnabled", "AttackReady" }
local EramNoAttackCDLastUpdate = 0

Fns.EramNoAttackCDStep = function()
    if not PinksState.EramNoAttackCD then return end
    local now = os.clock()
    if now - EramNoAttackCDLastUpdate < 0.08 then return end
    EramNoAttackCDLastUpdate = now
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" or not Fns.IsEramFight(battle) then return end

    local actorTarget = string.lower(tostring(PinksState.EramNoAttackCDActor or "All"))
    local roots, seen = {}, {}
    local function addRoot(root)
        if type(root) == "table" and not seen[root] then
            seen[root] = true
            roots[#roots + 1] = root
        end
    end
    addRoot(battle)
    for _, key in ipairs({ "Battle", "Ts", "Fight", "FightState", "Scene", "Controller" }) do
        addRoot(rawget(battle, key))
    end
    local rootIndex = 1
    while rootIndex <= #roots do
        local root = roots[rootIndex]
        rootIndex += 1
        for _, key in ipairs({ "Battle", "Ts", "Fight", "FightState", "Scene", "Controller", "Roster" }) do
            addRoot(rawget(root, key))
        end
    end

    local function resetCooldowns(target)
        if type(target) ~= "table" then return end
        for _, key in ipairs(ERAM_CD_KEYS) do
            local value = rawget(target, key)
            if type(value) == "number" then rawset(target, key, 0) end
        end
        for _, key in ipairs(ERAM_BOOL_KEYS) do
            if rawget(target, key) == false then rawset(target, key, true) end
        end
        local cooldowns = rawget(target, "Cooldowns")
        if type(cooldowns) == "table" then
            for _, key in ipairs(ERAM_CD_KEYS) do
                if type(rawget(cooldowns, key)) == "number" then rawset(cooldowns, key, 0) end
            end
            if type(rawget(cooldowns, "Attack")) == "number" then rawset(cooldowns, "Attack", 0) end
        end
    end

    for _, root in ipairs(roots) do
        local roster = rawget(root, "Roster")
        local members = type(roster) == "table" and rawget(roster, "Members") or rawget(root, "Members")
        if type(members) == "table" then
            for _, member in pairs(members) do
                if type(member) == "table" and Fns.IsLocalPartyMember(member) then
                    local actorKey = rawget(member, "Key") or rawget(member, "ActorKey") or rawget(member, "Name") or rawget(member, "Id")
                    if actorTarget == "all" or (type(actorKey) == "string" and string.lower(actorKey) == actorTarget) then
                        resetCooldowns(member)
                        for _, childKey in ipairs({ "Action", "Pending", "Combat", "Attack", "Cooldowns" }) do
                            resetCooldowns(rawget(member, childKey))
                        end
                    end
                end
            end
        end
    end
end

Fns.ApplyEramNoAttackCD = function(on)
    PinksState.EramNoAttackCD = on == true
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

    Fns.ApplyHPInfinite(PinksState.HPInfinite)
    Fns.ApplyGodMode(PinksState.GodMode)
    Fns.ApplyFreeSoul(PinksState.FreeSoulToggle)
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
        local battle = LiveBattleCache.Battle
        if type(battle) == "table" and type(rawget(battle, "Tension")) == "number" then
            local max = Fns.GetTensionMax()
            rawset(battle, "Tension", max)
            local bar = rawget(battle, "TensionBar")
            if type(bar) == "table" then
                if type(bar.Snap) == "function" then
                    pcall(function() bar:Snap(max) end)
                else
                    rawset(bar, "Apparent", max)
                    rawset(bar, "Current", max)
                end
            end
        end
    end

end

Fns.PartyHasNoelle = function()
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
        if on and not has and Fns.PartyHasNoelle() then
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

Fns.GetSpellsModule = function()
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

Fns.RescanBossCache = function(force)
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

Fns.IsLiveGersonSpearScene = function(scene)
    return type(scene) == "table"
        and rawget(scene, "Done") ~= true
        and type(rawget(scene, "Spears")) == "table"
        and rawget(scene, "Soul") ~= nil
        and rawget(scene, "Api") ~= nil
        and rawget(scene, "Battle") ~= nil
        and type(rawget(scene, "SpawnShield")) == "function"
end

Fns.GetGersonSpearScene = function(forceScan)
    local cached = GersonSceneCache.Scene
    if cached and Fns.IsLiveGersonSpearScene(cached) then
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
            if Fns.IsLiveGersonSpearScene(v) then
                found = v
                break
            end
        end
    end)

    GersonSceneCache.Scene = found
    return found
end

local REAL_ACT_MODULE_NAMES = {
    "TennaActs",
    "JevilActs",
    "KnightActs",
    "KingActs",
    "SpamtonActs",
    "SpamtonNeoActs",
    "BerdlyActs",
    "PinkActs",
    "AquaActs",
}

Fns.IsActEntry = function(v)
    return type(v) == "table"
        and type(rawget(v, "Key")) == "string"
        and type(rawget(v, "Name")) == "string"
        and type(rawget(v, "Cost")) == "number"
        and rawget(v, "Actor") ~= nil
end

Fns.CollectActEntries = function(value, found, seenTables, seenEntries, depth)
    if type(value) ~= "table" or depth > 5 or seenTables[value] then
        return
    end
    seenTables[value] = true

    if Fns.IsActEntry(value) then
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
            Fns.CollectActEntries(child, found, seenTables, seenEntries, depth + 1)
            visited += 1
            if visited >= 4000 then
                break
            end
        end
    end
end

Fns.LoadRealActModules = function()
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

Fns.ScanActRegistry = function(force)
    local now = os.clock()
    if not force and now - ActRegistry.LastScan < 2 then
        return ActRegistry.Options
    end
    ActRegistry.LastScan = now

    local found = {}
    local seenTables = {}
    local seenEntries = {}

    for _, result in ipairs(Fns.LoadRealActModules()) do
        Fns.CollectActEntries(result, found, seenTables, seenEntries, 0)
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

Fns.RefreshActDropdown = function(dropdown)
    local options = Fns.ScanActRegistry(true)
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

Fns.CloneActEntry = function(entry, owner, forceFree)
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

Fns.GetRealSpellOptions = function()
    local Spells = Fns.GetSpellsModule()
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

Fns.GetRealActorOptions = function()
    local result, seen = {}, {}
    local function add(name)
        if type(name) == "string" and not seen[name] then
            seen[name] = true
            table.insert(result, name)
        end
    end

    local Spells = Fns.GetSpellsModule()
    if Spells and type(Spells.Loadouts) == "table" then
        for actor in pairs(Spells.Loadouts) do
            add(actor)
        end
    end

    local actItems = ActRegistry.Items
    if type(actItems) ~= "table" then
        Fns.ScanActRegistry(false)
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

Fns.AddActToActor = function(actor, display)
    Fns.ScanActRegistry(false)
    local source = ActRegistry.Map[display]
    if not source then
        Fns.RefreshActDropdown(nil)
        source = ActRegistry.Map[display]
    end
    if not source then
        return false, "That Act is not present in the game's real Act tables."
    end

    PendingActs[actor] = PendingActs[actor] or {}
    PendingActs[actor][source.Key] = Fns.CloneActEntry(source.Entry, actor, PinksState.FreeActs)
    return true, source.Name .. " queued for " .. actor .. "."
end

Fns.AddSpellToActor = function(actor, spell)
    local Spells = Fns.GetSpellsModule()
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

Fns.InstallMagicHooks = function()
    if MagicHooksInstalled then
        return
    end

    local Spells = Fns.GetSpellsModule()
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
                        item.Entry = Fns.CloneActEntry(item.Entry, item.Entry.Owner, true)
                    end
                end
            end

            if queued then
                for key, entry in pairs(queued) do
                    if not present[key] and Fns.IsActEntry(entry) then
                        local injected = Fns.CloneActEntry(entry, actor, PinksState.FreeActs)
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

Fns.InstallMagicHooks()

ApplyFreeSpells = function(on)
    PinksState.FreeSpells = on == true
    Fns.InstallMagicHooks()
end

ApplyFreeActs = function(on)
    PinksState.FreeActs = on == true
    Fns.InstallMagicHooks()
end

local PinkDateCache = {
    State = nil,
    LastScan = 0,
    LastQuestion = nil,
    AnsweredForQ = nil,
}

Fns.IsLivePinkDateStateSafe = function(state)
    return type(state) == "table"
        and rawget(state, "Done") ~= true
        and type(rawget(state, "DateTimeLeft")) == "number"
        and type(rawget(state, "DateTimeLeftMax")) == "number"
        and rawget(state, "Con") ~= nil
end

Fns.GetPinkDateStateSafe = function(forceScan)
    local cached = PinkDateCache.State
    if cached and Fns.IsLivePinkDateStateSafe(cached) then
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

Fns.DateFreezeTimeStep = function()
    if not PinksState.DateFreezeTime then
        return
    end
    local state = Fns.GetPinkDateStateSafe(false)
    if not state then
        state = Fns.GetPinkDateStateSafe(true)
    end
    if not state then
        return
    end
    local maxT = rawget(state, "DateTimeLeftMax")
    if type(maxT) == "number" then
        rawset(state, "DateTimeLeft", maxT)
    end
end

Fns.ApplyDateFreezeTime = function(on)
    PinksState.DateFreezeTime = on == true
    if on then
        PinkDateCache.State = nil
        PinkDateCache.LastScan = 0
        Fns.DateFreezeTimeStep()
    end
end

local DumbAttackCache = {
    LastGcScan = 0,
}

Fns.FlipBulletForce = function(b)
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

Fns.DumbAttackStep = function()
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
                Fns.FlipBulletForce(bullet)
            end
        end
    end)
end

Fns.ApplyDumbAttack = function(on)
    PinksState.DumbAttack = on == true
    if on and #Cache.BattleTables == 0 then
        Fns.RescanCache(false)
    end
end

local FightAttackCache = {
    Controller = nil,
}

Fns.ViewHitboxEnabled = false
Fns.SetViewHitbox = function(on)
    Fns.ViewHitboxEnabled = on == true
    pcall(function()
        local cfg = Fns.GetConfig and Fns.GetConfig() or nil
        if type(cfg) ~= "table" then
            local ok, c = pcall(function() return require(ReplicatedStorage.Core.Data.Config) end)
            if ok then cfg = c end
        end
        if type(cfg) == "table" then
            if type(rawget(cfg, "Debug")) ~= "table" then
                rawset(cfg, "Debug", {})
            end
            local dbg = rawget(cfg, "Debug")
            rawset(dbg, "ShowHitboxes", Fns.ViewHitboxEnabled)
            rawset(dbg, "DrawHitboxes", Fns.ViewHitboxEnabled)
            rawset(dbg, "ShowHitbox", Fns.ViewHitboxEnabled)
        end
    end)
    pcall(function()
        local ok, HitboxDebug = pcall(function() return require(ReplicatedStorage.Core.Combat.HitboxDebug) end)
        if ok and type(HitboxDebug) == "table" then
            for _, v in pairs(HitboxDebug) do
                if type(v) == "table" and type(rawget(v, "Layer")) == "userdata" then
                    pcall(function()
                        v.Layer.Visible = Fns.ViewHitboxEnabled
                    end)
                end
            end
        end
    end)
    pcall(function()
        for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
            if gui.Name == "HitboxDebug" or gui.Name == "Hitbox" then
                if gui:IsA("GuiObject") then
                    gui.Visible = Fns.ViewHitboxEnabled
                end
            end
        end
    end)
    pcall(function()
        if type(getgc) ~= "function" then return end
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                local layer = rawget(v, "Layer")
                if typeof(layer) == "Instance" and layer.Name == "HitboxDebug" then
                    pcall(function()
                        layer.Visible = Fns.ViewHitboxEnabled
                    end)
                end
                if rawget(v, "Box") ~= nil and type(rawget(v, "Pool")) == "table" and type(rawget(v, "Draw")) == "function" then
                    if typeof(layer) == "Instance" then
                        pcall(function() layer.Visible = Fns.ViewHitboxEnabled end)
                    end
                end
            end
        end
    end)
end

local VisualEffectOriginals = setmetatable({}, { __mode = "k" })
local VisualBackgroundHooks = setmetatable({}, { __mode = "k" })
local VisualSpriteOriginals = setmetatable({}, { __mode = "k" })

local function VisualGetGcTables()
    if type(getgc) ~= "function" then return {} end
    local ok, result = pcall(getgc, true)
    return ok and type(result) == "table" and result or {}
end

local function VisualRestoreEffectHolders()
    for holder, originalVisible in pairs(VisualEffectOriginals) do
        pcall(function()
            if typeof(holder) == "Instance" then
                holder.Visible = originalVisible
            end
        end)
        VisualEffectOriginals[holder] = nil
    end
end

Fns.ApplyVisualDisableEffectsStep = function(objects)
    if not PinksState.VisualDisableEffects then
        VisualRestoreEffectHolders()
        return
    end
    objects = type(objects) == "table" and objects or VisualGetGcTables()
    for _, candidate in pairs(objects) do
        if type(candidate) ~= "table" then continue end
        local effects = rawget(candidate, "Effects")
        if type(effects) ~= "table" then continue end
        for _, effect in pairs(effects) do
            if type(effect) ~= "table" then continue end
            local holder = rawget(effect, "Holder")
            if typeof(holder) == "Instance" and holder:IsA("GuiObject") then
                if VisualEffectOriginals[holder] == nil then
                    VisualEffectOriginals[holder] = holder.Visible
                end
                pcall(function() holder.Visible = false end)
            end
        end
    end
end

Fns.ApplyVisualDisableEffects = function(on)
    PinksState.VisualDisableEffects = on == true
    if PinksState.VisualDisableEffects then
        pcall(Fns.ApplyVisualDisableEffectsStep)
    else
        VisualRestoreEffectHolders()
    end
end

local function VisualRestoreBackgroundHooks()
    for background, originals in pairs(VisualBackgroundHooks) do
        pcall(function()
            if type(originals.Step) == "function" then rawset(background, "Step", originals.Step) end
            if type(originals.StepRender) == "function" then rawset(background, "StepRender", originals.StepRender) end
        end)
        VisualBackgroundHooks[background] = nil
    end
end

Fns.ApplyStopMovingBackgroundStep = function(objects)
    if not PinksState.VisualStopBackground then
        VisualRestoreBackgroundHooks()
        return
    end
    objects = type(objects) == "table" and objects or VisualGetGcTables()
    for _, candidate in pairs(objects) do
        if type(candidate) ~= "table" then continue end
        if typeof(rawget(candidate, "Root")) ~= "Instance"
            or typeof(rawget(candidate, "Fill")) ~= "Instance"
            or type(rawget(candidate, "Scene")) ~= "table"
            or type(candidate.Step) ~= "function"
            or type(candidate.StepRender) ~= "function" then
            continue
        end
        if VisualBackgroundHooks[candidate] then continue end
        local originalStep = candidate.Step
        local originalStepRender = candidate.StepRender
        VisualBackgroundHooks[candidate] = {
            Step = originalStep,
            StepRender = originalStepRender,
        }
        rawset(candidate, "Step", function(self, ...)
            if PinksState.VisualStopBackground then
                pcall(function()
                    if type(self.StepDarken) == "function" then self:StepDarken() end
                    local scene = rawget(self, "Scene")
                    local builder = type(scene) == "table" and rawget(scene, "Builder") or nil
                    if (builder == "Cityscape" or builder == "DarkFountain") and type(self.StepSceneFade) == "function" then
                        self:StepSceneFade()
                    end
                end)
                return
            end
            return originalStep(self, ...)
        end)
        rawset(candidate, "StepRender", function(self, ...)
            if PinksState.VisualStopBackground then return end
            return originalStepRender(self, ...)
        end)
    end
end

Fns.ApplyStopMovingBackground = function(on)
    PinksState.VisualStopBackground = on == true
    if PinksState.VisualStopBackground then
        pcall(Fns.ApplyStopMovingBackgroundStep)
    else
        VisualRestoreBackgroundHooks()
    end
end

Fns.ApplyVisualControlsStep = function()
    local objects = VisualGetGcTables()
    if PinksState.VisualDisableEffects then
        pcall(Fns.ApplyVisualDisableEffectsStep, objects)
    else
        VisualRestoreEffectHolders()
    end
    if PinksState.VisualStopBackground then
        pcall(Fns.ApplyStopMovingBackgroundStep, objects)
    else
        VisualRestoreBackgroundHooks()
    end
end

local VisualSpriteFields = {
    "Namespace", "Normal", "NormalNamespace", "NormalUnhappy", "Offset", "DrawScale",
    "Composite", "Flip",
}
local VisualSpriteStates = {
    "Idle", "AttackReady", "Attack", "ActReady", "Act", "SpellReady", "Spell",
    "ItemReady", "Item", "Defend", "Hurt", "Defeat", "Victory",
}
local VisualSpriteStateFields = {
    "", "Namespace", "Offset", "Flip", "Loop", "Fps", "Next", "Hover", "Trail",
    "Sway", "HoldFrame", "FrameStart", "FrameEnd", "JevilPose", "JevilShadow", "JevilSwing",
}
local VisualSpriteCacheFields = {
    "SpriteSet", "ArmedSprite", "ArmedNamespace", "ShownSprite", "ShownNamespace",
    "NormalSprite", "NormalNamespace", "CastSprite", "TraceLast",
}

local function VisualCopyValue(value)
    if type(value) == "table" then
        local ok, cloned = pcall(table.clone, value)
        if ok then return cloned end
    end
    return value
end

local function VisualFindLocalActors(actorKey)
    local matches = {}
    for _, renderer in pairs(VisualGetGcTables()) do
        if type(renderer) ~= "table" then continue end
        local roster = rawget(renderer, "Roster")
        local heroes = rawget(renderer, "Heroes")
        if type(roster) ~= "table" or type(heroes) ~= "table" or type(renderer.SetHeroState) ~= "function" then
            continue
        end
        for slot, hero in pairs(heroes) do
            if type(hero) ~= "table" then continue end
            local member = rawget(hero, "Member")
            if type(member) == "table"
                and rawget(member, "Key") == actorKey
                and Fns.IsLocalPartyMember(member) then
                table.insert(matches, {
                    Renderer = renderer,
                    Hero = hero,
                    Member = member,
                    Slot = tonumber(rawget(member, "Slot")) or tonumber(slot) or slot,
                })
            end
        end
    end
    return matches
end

Fns.ChangeActorSprites = function(actorKey, spriteSourceKey)
    actorKey = tostring(actorKey or "")
    spriteSourceKey = tostring(spriteSourceKey or "")
    if actorKey == "" or spriteSourceKey == "" then return false, "Choose an actor and a sprite source." end
    local ActorsModule = nil
    local ok = pcall(function() ActorsModule = require(ReplicatedStorage.Core.Combat.Actors) end)
    local sourceDefs = ok and type(ActorsModule) == "table" and rawget(ActorsModule, "Heroes") or nil
    local sourceDef = type(sourceDefs) == "table" and rawget(sourceDefs, spriteSourceKey) or nil
    if type(sourceDef) ~= "table" then
        pcall(function()
            local HeroLoader = require(ReplicatedStorage.Core.Combat.HeroLoader)
            if type(HeroLoader) == "table" and type(HeroLoader.LoadSaved) == "function" then
                HeroLoader.LoadSaved()
            end
        end)
        sourceDefs = ok and type(ActorsModule) == "table" and rawget(ActorsModule, "Heroes") or nil
        sourceDef = type(sourceDefs) == "table" and rawget(sourceDefs, spriteSourceKey) or nil
    end
    if type(sourceDef) ~= "table" then
        return false, "That sprite set is not available in the current game data."
    end
    local changed = 0
    for _, match in ipairs(VisualFindLocalActors(actorKey)) do
        local hero = match.Hero
        local currentDef = rawget(hero, "Def")
        if type(currentDef) ~= "table" then continue end
        if VisualSpriteOriginals[hero] == nil then
            local saved = { Def = currentDef }
            for _, field in ipairs(VisualSpriteCacheFields) do
                saved[field] = rawget(hero, field)
            end
            VisualSpriteOriginals[hero] = saved
        end
        local newDef = table.clone(currentDef)
        for _, field in ipairs(VisualSpriteFields) do
            rawset(newDef, field, VisualCopyValue(rawget(sourceDef, field)))
        end
        for _, state in ipairs(VisualSpriteStates) do
            for _, suffix in ipairs(VisualSpriteStateFields) do
                local field = state .. suffix
                rawset(newDef, field, VisualCopyValue(rawget(sourceDef, field)))
            end
        end
        rawset(hero, "Def", newDef)
        rawset(hero, "SpriteSet", true)
        rawset(hero, "ArmedSprite", nil)
        rawset(hero, "ArmedNamespace", nil)
        rawset(hero, "ShownSprite", nil)
        rawset(hero, "ShownNamespace", nil)
        rawset(hero, "NormalSprite", nil)
        rawset(hero, "CastSprite", nil)
        rawset(hero, "TraceLast", nil)
        pcall(function() match.Renderer:SetHeroState(match.Slot, "Idle") end)
        changed += 1
    end
    return changed > 0, changed > 0 and ("Updated " .. tostring(changed) .. " local actor sprite set(s).") or "That actor is not present in your local party."
end

Fns.ResetActorSprites = function(actorKey)
    actorKey = tostring(actorKey or "")
    if actorKey == "" then return false, "Choose an actor." end
    local restored = 0
    for _, match in ipairs(VisualFindLocalActors(actorKey)) do
        local hero = match.Hero
        local saved = VisualSpriteOriginals[hero]
        if type(saved) ~= "table" then continue end
        rawset(hero, "Def", saved.Def)
        for _, field in ipairs(VisualSpriteCacheFields) do
            rawset(hero, field, saved[field])
        end
        VisualSpriteOriginals[hero] = nil
        pcall(function() match.Renderer:SetHeroState(match.Slot, "Idle") end)
        restored += 1
    end
    return restored > 0, restored > 0 and ("Restored " .. tostring(restored) .. " local actor sprite set(s).") or "No custom sprite set is active for that actor."
end

Fns.FindAttackController = function()
    local function hasRows(controller)
        return type(controller) == "table" and type(rawget(controller, "AttackRows")) == "table"
    end
    local cached = FightAttackCache.Controller
    if hasRows(cached) and not Fns.IsTerminalBattleController(cached) then return cached end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then
        battle = Fns.FindLiveBattleController(false, false)
    end
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then return nil end
    local candidates, seen = {}, {}
    local function add(candidate)
        if type(candidate) == "table" and not seen[candidate] then
            seen[candidate] = true
            candidates[#candidates + 1] = candidate
        end
    end
    add(battle)
    for _, key in ipairs({ "Battle", "Fight", "FightState", "Ts" }) do
        local candidate = rawget(battle, key)
        add(candidate)
        if type(candidate) == "table" then add(rawget(candidate, "Battle")) end
    end
    for _, candidate in ipairs(candidates) do
        if hasRows(candidate) then
            FightAttackCache.Controller = candidate
            return candidate
        end
    end
    local now = os.clock()
    if now - (FightAttackCache.LastScan or 0) < 1 then return nil end
    FightAttackCache.LastScan = now
    if type(getgc) == "function" then
        for _, candidate in pairs(getgc(true)) do
            if hasRows(candidate) and tostring(rawget(candidate, "State") or "") == "Fight" then
                FightAttackCache.Controller = candidate
                return candidate
            end
        end
    end
    return nil
end

Fns.AntiFailAutoAttackStep = function()
    if not PinksState.AntiFailAutoAttack then return end
    local ctrl = Fns.FindAttackController()
    if type(ctrl) ~= "table" or Fns.IsTerminalBattleController(ctrl) then
        FightAttackCache.Controller = nil
        return
    end
    local rows = rawget(ctrl, "AttackRows")
    if type(rows) ~= "table" then
        local nested = rawget(ctrl, "Battle")
        rows = type(nested) == "table" and rawget(nested, "AttackRows") or nil
    end
    if type(rows) ~= "table" then return end

    local resolveRow = ctrl.ResolveRow
    local ownsMember = ctrl.OwnsMember
    if type(resolveRow) ~= "function" then return end
    for _, row in pairs(rows) do
        if type(row) == "table" and rawget(row, "Resolved") ~= true then
            local member = rawget(row, "Member")
            local allowed = true
            if type(member) == "table" and type(ownsMember) == "function" then
                local okOwn, owned = pcall(ownsMember, ctrl, member)
                if okOwn and owned == false then allowed = false end
            end
            if allowed then
                pcall(resolveRow, ctrl, row, false, 0)
            end
        end
    end
end


Fns.DisableAllMovesStep = function()
    if not PinksState.DisableAllMoves then return end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then
        battle = Fns.FindLiveBattleController(false)
    end
    if type(battle) ~= "table" then return end
    pcall(function()
        local roots = { battle, rawget(battle, "Battle"), rawget(battle, "FightState"), rawget(battle, "Fight") }
        for _, root in ipairs(roots) do
            if type(root) == "table" then
                if type(root.StopWaves) == "function" then pcall(function() root:StopWaves() end) end
                if type(root.ClearBullets) == "function" then pcall(function() root:ClearBullets() end) end
                if type(root.DestroyBullets) == "function" then pcall(function() root:DestroyBullets() end) end
                for _, key in ipairs({ "AttackTimer", "WaveTimer", "PatternTimer", "TurnTimer", "EnemyTimer", "BulletTimer" }) do
                    if rawget(root, key) ~= nil then rawset(root, key, 0) end
                end
                local waves = rawget(root, "Waves")
                if type(waves) == "table" then
                    for _, w in pairs(waves) do
                        if type(w) == "table" then
                            rawset(w, "Active", false)
                            rawset(w, "Done", true)
                        end
                    end
                end
            end
        end
        if type(battle.EndEnemyTurn) == "function" then
            local st = string.lower(tostring(rawget(battle, "State") or ""))
            if st == "enemyturn" or st == "enemy" or st == "bullet" then
                pcall(function() battle:EndEnemyTurn() end)
            end
        end
    end)
end

Fns.ApplyDisableAllMoves = function(on)
    PinksState.DisableAllMoves = on == true
    if on then
        Fns.DisableAllMovesStep()
    end
end

Fns.QueenShieldAlwaysBrokenStep = function()
    if not PinksState.QueenShieldAlwaysBroken then return end
    pcall(function()
        Fns.BreakQueenShieldNow(false)
    end)
end

Fns.ApplyQueenShieldAlwaysBroken = function(on)
    PinksState.QueenShieldAlwaysBroken = on == true
    if on then
        Fns.BreakQueenShieldNow(true)
    end
end

Fns.SkipKnightRoaringNow = function()
    local changed = false
    pcall(function()
        local battle = Fns.FindLiveBattleController(true)
        local roots = { battle }
        if type(battle) == "table" then
            table.insert(roots, rawget(battle, "Battle"))
            table.insert(roots, rawget(battle, "Fight"))
            table.insert(roots, rawget(battle, "FightState"))
            table.insert(roots, rawget(battle, "Scene"))
        end
        for _, root in ipairs(roots) do
            if type(root) ~= "table" then continue end
            for k, v in pairs(root) do
                local ks = string.lower(tostring(k))
                if string.find(ks, "roar", 1, true) then
                    if type(v) == "boolean" then rawset(root, k, false); changed = true end
                    if type(v) == "number" then rawset(root, k, 0); changed = true end
                end
                if ks == "phase" or ks == "myfight" or ks == "fightphase" or ks == "currentphase" then
                    if type(v) == "number" and v >= 3 then
                        rawset(root, k, math.max(v, 4))
                        changed = true
                    end
                end
            end
            if type(root.SkipPhase) == "function" then
                pcall(function() root:SkipPhase() end)
                changed = true
            end
            if type(root.EndPhase) == "function" then
                pcall(function() root:EndPhase() end)
                changed = true
            end
            if type(root.NextPhase) == "function" then
                pcall(function() root:NextPhase() end)
                changed = true
            end
        end
        if type(getgc) == "function" then
            for _, obj in pairs(getgc(true)) do
                if type(obj) == "table" then
                    local name = string.lower(tostring(rawget(obj, "Id") or rawget(obj, "Name") or rawget(obj, "Key") or ""))
                    if string.find(name, "roar", 1, true) or string.find(name, "knight", 1, true) then
                        if rawget(obj, "Roaring") ~= nil then rawset(obj, "Roaring", false); changed = true end
                        if rawget(obj, "Roar") ~= nil and type(rawget(obj, "Roar")) == "boolean" then rawset(obj, "Roar", false); changed = true end
                        if type(obj.Stop) == "function" and string.find(name, "roar", 1, true) then pcall(function() obj:Stop() end); changed = true end
                    end
                end
            end
        end
        if type(battle) == "table" and type(battle.RefreshUi) == "function" then
            pcall(function() battle:RefreshUi() end)
        end
    end)
    return changed
end

Fns.SkipFloweryClimbNow = function()
    local changed = false
    pcall(function()
        local battle = Fns.FindLiveBattleController(true, true)
        local roots = { battle }
        if type(battle) == "table" then
            table.insert(roots, rawget(battle, "Battle"))
            table.insert(roots, rawget(battle, "Fight"))
            table.insert(roots, rawget(battle, "FightState"))
            table.insert(roots, rawget(battle, "Scene"))
            table.insert(roots, rawget(battle, "Minigame"))
            table.insert(roots, rawget(battle, "Room"))
            local fs = rawget(battle, "FightState")
            if type(fs) == "table" then
                table.insert(roots, rawget(fs, "LiveScene"))
                table.insert(roots, rawget(fs, "Scene"))
                table.insert(roots, rawget(fs, "Room"))
                table.insert(roots, rawget(fs, "Minigame"))
            end
        end
        for _, root in ipairs(roots) do
            if type(root) ~= "table" then continue end
            for k, v in pairs(root) do
                local ks = string.lower(tostring(k))
                if type(v) == "boolean" then
                    if string.find(ks, "climb", 1, true) or string.find(ks, "minigame", 1, true) or string.find(ks, "tower", 1, true) then
                        if string.find(ks, "done", 1, true) or string.find(ks, "finish", 1, true) or string.find(ks, "complete", 1, true) then
                            rawset(root, k, true); changed = true
                        elseif string.find(ks, "active", 1, true) or string.find(ks, "ing", 1, true) then
                            rawset(root, k, false); changed = true
                        end
                    end
                elseif type(v) == "number" and (string.find(ks, "climb", 1, true) or string.find(ks, "height", 1, true) or string.find(ks, "progress", 1, true)) then
                    if string.find(ks, "height", 1, true) or string.find(ks, "progress", 1, true) then
                        rawset(root, k, v + 99999); changed = true
                    end
                end
            end
            for _, name in ipairs({ "SkipMinigame", "EndMinigame", "FinishClimb", "SkipClimb", "CompleteClimb", "EndClimb", "FinishMinigame" }) do
                if type(root[name]) == "function" then pcall(function() root[name](root) end); changed = true end
            end
        end
        if type(getgc) == "function" then
            for _, obj in pairs(getgc(true)) do
                if type(obj) == "table" then
                    local spr = tostring(rawget(obj, "Sprite") or "")
                    local id = string.lower(tostring(rawget(obj, "Id") or rawget(obj, "Name") or ""))
                    if string.find(spr, "tower_flower", 1, true) or string.find(id, "flowery", 1, true) or string.find(id, "climb", 1, true) then
                        if rawget(obj, "Finalheight") ~= nil then
                            rawset(obj, "Finalheight", (tonumber(rawget(obj, "Finalheight")) or 0) + 99999)
                            changed = true
                        end
                        if rawget(obj, "FinalRise") ~= nil then rawset(obj, "FinalRise", 0); changed = true end
                        if rawget(obj, "Done") ~= nil then rawset(obj, "Done", true); changed = true end
                        if rawget(obj, "Alive") ~= nil and string.find(spr, "tower_flower", 1, true) then
                        end
                    end
                end
            end
        end
        if type(battle) == "table" and type(battle.RefreshUi) == "function" then
            pcall(function() battle:RefreshUi() end)
        end
    end)
    return changed
end

Fns.RouxlsUnlockFullMenuStep = function()
    if not PinksState.RouxlsUnlockFullMenu then return end
    pcall(function()
        local battle = LiveBattleCache.Battle
        if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then
            battle = Fns.FindLiveBattleController(false)
        end
        if type(battle) ~= "table" then return end
        local label = string.lower(Fns.GetBattleFightLabel(battle) or "")
        local isRouxls = string.find(label, "rouxls", 1, true) ~= nil
        if not isRouxls then
            local fight = rawget(battle, "Fight")
            if type(fight) == "table" then
                local id = string.lower(tostring(rawget(fight, "Id") or rawget(fight, "Key") or ""))
                isRouxls = string.find(id, "rouxls", 1, true) ~= nil
            end
        end
        if not isRouxls then return end
        local roots = { battle, rawget(battle, "Battle"), rawget(battle, "Fight"), rawget(battle, "FightState"), rawget(battle, "Ts") }
        for _, root in ipairs(roots) do
            if type(root) ~= "table" then continue end
            for _, key in ipairs({
                "CanAttack", "CanAct", "CanItem", "CanMercy", "CanSpare", "CanDefend", "CanMagic",
                "AllowAttack", "AllowAct", "AllowItem", "AllowMercy", "AttackEnabled", "ActEnabled",
                "ItemEnabled", "MercyEnabled", "MenuUnlocked", "FullMenu", "RulesCard", "LancerCard"
            }) do
                if rawget(root, key) ~= nil then
                    local v = rawget(root, key)
                    if type(v) == "boolean" then
                        rawset(root, key, true)
                    elseif type(v) == "number" then
                        rawset(root, key, 1)
                    end
                end
            end
            if rawget(root, "Card") ~= nil and type(rawget(root, "Card")) == "string" then
                rawset(root, "Card", "LANCER")
            end
            if rawget(root, "LancerCard") == false then rawset(root, "LancerCard", true) end
            if rawget(root, "RulesLock") == true then rawset(root, "RulesLock", false) end
            if rawget(root, "MenuRestrict") == true then rawset(root, "MenuRestrict", false) end
            local menu = rawget(root, "Menu") or rawget(root, "CommandMenu") or rawget(root, "UI")
            if type(menu) == "table" then
                for _, key in ipairs({ "Attack", "Act", "Item", "Mercy", "Spare", "Defend", "Magic" }) do
                    if rawget(menu, key) == false then rawset(menu, key, true) end
                end
                if type(menu.SetEnabled) == "function" then
                    pcall(function() menu:SetEnabled("Attack", true) end)
                    pcall(function() menu:SetEnabled("Act", true) end)
                    pcall(function() menu:SetEnabled("Item", true) end)
                    pcall(function() menu:SetEnabled("Mercy", true) end)
                end
            end
            local roster = rawget(root, "Roster")
            local members = type(roster) == "table" and rawget(roster, "Members") or rawget(root, "Members")
            if type(members) == "table" then
                for _, member in pairs(members) do
                    if type(member) == "table" and Fns.IsLocalPartyMember(member) then
                        for _, key in ipairs({ "CanAttack", "CanAct", "CanItem", "CanMercy", "CanSpare", "CanDefend" }) do
                            if rawget(member, key) == false then rawset(member, key, true) end
                        end
                    end
                end
            end
        end
    end)
end

Fns.ApplyRouxlsUnlockFullMenu = function(on)
    PinksState.RouxlsUnlockFullMenu = on == true
    if on then
        Fns.RouxlsUnlockFullMenuStep()
        pcall(function()
            local battle = Fns.FindLiveBattleController(true, false)
            if type(battle) ~= "table" then return end
            local function unlock(obj, depth)
                if type(obj) ~= "table" or depth > 4 then return end
                for k, v in pairs(obj) do
                    local ks = string.lower(tostring(k))
                    if type(v) == "boolean" and (string.find(ks, "can", 1, true) or string.find(ks, "allow", 1, true) or string.find(ks, "enable", 1, true) or string.find(ks, "menu", 1, true) or string.find(ks, "attack", 1, true) or string.find(ks, "mercy", 1, true) or string.find(ks, "act", 1, true) or string.find(ks, "item", 1, true)) then
                        if v == false then rawset(obj, k, true) end
                    end
                end
            end
            unlock(battle, 0)
            unlock(rawget(battle, "Battle"), 0)
            unlock(rawget(battle, "Fight"), 0)
            unlock(rawget(battle, "FightState"), 0)
            unlock(rawget(battle, "Ts"), 0)
        end)
    end
end

Fns.ApplyAntiFailAutoAttack = function(on)
    PinksState.AntiFailAutoAttack = on == true
    FightAttackCache.Controller = nil
    FightAttackCache.LastScan = 0
    if on then
        local battle = Fns.FindLiveBattleController(true, true)
        if type(battle) == "table" then
            LiveBattleCache.Battle = battle
        end
        pcall(function()
            if type(Fns.AntiFailAutoAttackStep) == "function" then
                Fns.AntiFailAutoAttackStep()
            end
        end)
    end
end

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

Fns.GetHeroKeyOptions = function()
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

Fns.GetItemNameOptions = function()
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

Fns.FindLiveRosters = function()
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

Fns.FindLiveInventories = function()
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

Fns.GetArmorOptions = function()
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

Fns.ResolveArmorId = function(name)
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

Fns.AssignArmorToActor = function(actorKey, armor1Name, armor2Name)
    actorKey = tostring(actorKey or "")
    if actorKey == "" then
        return false
    end
    local id1 = Fns.ResolveArmorId(armor1Name)
    local id2 = Fns.ResolveArmorId(armor2Name)
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
                if type(member) == "table" and rawget(member, "Key") == actorKey and Fns.IsLocalPartyMember(member) then
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

Fns.ChangePartyActor = function(fromKey, toKey)
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
                or not Fns.IsLocalPartyMember(member)
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

Fns.ApplyInfiniteInventory = function(on)
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

Fns.SpawnItemByName = function(itemName)
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

    local invs = Fns.FindLiveInventories()
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

Fns.GetEnemyKeyOptions = function()
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

Fns.GetWeaponOptions = function()
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

Fns.ResolveWeaponId = function(name)
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

Fns.AssignWeaponToActor = function(actorKey, weaponName)
    actorKey = tostring(actorKey or "")
    if actorKey == "" then
        return false
    end
    local wid = Fns.ResolveWeaponId(weaponName)
    local changed = 0
    pcall(function()
        for _, actors in pairs(getgc(true)) do
            if type(actors) ~= "table" then
            else
                local roster = rawget(actors, "Roster")
                if type(roster) == "table" and type(rawget(roster, "Members")) == "table" then
                    for _, member in ipairs(rawget(roster, "Members")) do
                        if type(member) == "table" and rawget(member, "Key") == actorKey and Fns.IsLocalPartyMember(member) then
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

Fns.ForceBattlePartyDefend = function(battle)
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
            and Fns.IsLocalPartyMember(member)
            and rawget(member, "Down") ~= true
            and rawget(member, "Swooned") ~= true then

            rawset(member, "Defending", true)
            changed = true
        end
    end

    return changed
end

local AutoDefendHooksInstalled = false

Fns.InstallAutoDefendOnBattle = function(battle)
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
            Fns.ForceBattlePartyDefend(self)
        end

        return result
    end)
end

Fns.InstallAutoDefendHooks = function()
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
            Fns.InstallAutoDefendOnBattle(battle)
            return battle
        end

        AutoDefendHooksInstalled = true
    end

    local battle = Fns.FindLiveBattleController(true)
    if battle then
        Fns.InstallAutoDefendOnBattle(battle)
    end
end

Fns.IsEnemyBulletPhase = function(battle)
    if type(battle) ~= "table" then
        return false
    end
    local state = tostring(rawget(battle, "State") or "")
    if state == "Enemy" or state == "EnemyWave" or state == "EnemyText" or state == "BulletDelay" or state == "SoulIn" or state == "Cutscene" then
        return true
    end
    local b = rawget(battle, "Battle")
    if type(b) == "table" and rawget(b, "SoulActive") == true then
        return true
    end
    return false
end

Fns.AutoDefendPartyStep = function()
    if not PinksState.AutoDefendParty then
        return
    end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        return
    end
    if not Fns.IsEnemyBulletPhase(battle) then
        return
    end
    pcall(function()
        local roster = rawget(battle, "Roster")
        local members = type(roster) == "table" and rawget(roster, "Members") or nil
        if type(members) == "table" then
            for _, m in pairs(members) do
                if type(m) == "table" and Fns.IsLocalPartyMember(m) then
                    rawset(m, "Defending", true)
                end
            end
        end
        if type(battle.SyncDefend) == "function" then
            pcall(function() battle:SyncDefend() end)
        end
    end)
end

Fns.ApplyAutoDefendParty = function(on)
    PinksState.AutoDefendParty = on == true
    if PinksState.AutoDefendParty then
        Fns.InstallAutoDefendHooks()
    end
end

Fns.ApplyShowEnemyHP = function(on)
    on = on == true
    PinksState.ShowEnemyHP = on

    if not on then
        for fight, saved in pairs(EnemyHPOriginals) do
            if type(fight) == "table" then
                if saved.HadValue then
                    rawset(fight, "HideEnemyHP", saved.Value)
                else
                    rawset(fight, "HideEnemyHP", nil)
                end
            end
            EnemyHPOriginals[fight] = nil
        end
    end

    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        battle = Fns.FindLiveBattleController(false)
    end
    if type(battle) ~= "table" then
        return false
    end

    local fight = rawget(battle, "Fight")
    if type(fight) ~= "table" then
        return false
    end

    if on then
        if EnemyHPOriginals[fight] == nil then
            EnemyHPOriginals[fight] = {
                HadValue = rawget(fight, "HideEnemyHP") ~= nil,
                Value = rawget(fight, "HideEnemyHP"),
            }
        end
        rawset(fight, "HideEnemyHP", false)
    end

    local refresh = rawget(battle, "RefreshUi")
    if type(refresh) == "function" then pcall(function() battle:RefreshUi() end) end
    return true
end

local GersonStealHooked = false
local OriginalGersonStealBegin = nil

Fns.ApplyAntiStealItems = function(on)
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

Fns.GetMusicTrackOptions = function()
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

Fns.IsInFightNow = function()
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

Fns.SwapMusicTrack = function(trackName)
    if not Fns.IsInFightNow() then
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

Fns.GoDefaultMusicTrack = function()
    if not Fns.IsInFightNow() then
        return false
    end
    local name = PinksState.DefaultMusicTrack
    if type(name) ~= "string" or name == "" then
        return false
    end
    return Fns.SwapMusicTrack(name)
end

Fns.ChangeActorStat = function(actorKey, statName, amount)
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
    local function patchMember(member)
        if type(member) ~= "table" or rawget(member, "Key") ~= actorKey or not Fns.IsLocalPartyMember(member) then
            return
        end
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
        changed = changed + 1
    end

    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        battle = Fns.FindLiveBattleController(true)
    end
    if type(battle) == "table" then
        local roster = rawget(battle, "Roster")
        local members = type(roster) == "table" and rawget(roster, "Members") or nil
        if type(members) == "table" then
            for _, member in pairs(members) do
                patchMember(member)
            end
        end
        if type(battle.RefreshUi) == "function" then
            pcall(function() battle:RefreshUi() end)
        end
    end

    return changed > 0, changed > 0 and ("Updated " .. actorKey) or "Actor not found in current fight."
end

local TurnSystemModule = nil
local KrisMagicHooksInstalled = false

pcall(function()
    TurnSystemModule = require(ReplicatedStorage.Core.Combat.TurnSystem)
end)

Fns.ForceKrisMagicButton = function(turnSystem)
    local roster = turnSystem and rawget(turnSystem, "Roster")
    local members = roster and rawget(roster, "Members")
    if type(members) ~= "table" then
        return
    end

    for _, member in pairs(members) do
        if type(member) == "table" and rawget(member, "Key") == "Kris" and Fns.IsLocalPartyMember(member) then
            rawset(member, "MagicButton", true)
        end
    end
end

Fns.InstallKrisMagicHooks = function()
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
            Fns.ForceKrisMagicButton(self)
            return originalStepMenu(self, ...)
        end
    end

    if originalRefreshUi then
        TurnSystemModule.RefreshUi = function(self, ...)
            Fns.ForceKrisMagicButton(self)
            return originalRefreshUi(self, ...)
        end
    end

    if originalEnterSpell then
        TurnSystemModule.EnterSpell = function(self, ...)
            Fns.ForceKrisMagicButton(self)
            return originalEnterSpell(self, ...)
        end
    end

    KrisMagicHooksInstalled = true
end

Fns.InstallKrisMagicHooks()

Fns.GersonShieldStep = function()
    local scene = Fns.GetGersonSpearScene(false)
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

Fns.GersonRudeBusterStep = function(perfect)
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

Fns.GersonAutoTimingRudeBusterStep = function()
    Fns.GersonRudeBusterStep(false)
end

Fns.TennaMaxScoreNow = function()
    local changed = 0

    pcall(function()
        Fns.RescanBossCache(true)
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

local GenericAccumulator = 0
local LifecycleAccumulator = 0
local UndertaleProtectionAccumulator = 0
local TPInfiniteAccumulator = 0
local HPInfiniteAccumulator = 0
local ClearAccumulator = 0
local StatsAccumulator = 0
local HPHookAccumulator = 0
local DateAccumulator = 0
local AttackAccumulator = 0
local DateAnswerAccumulator = 0
local AutoAttackAccumulator = 0
local AutoDateAccumulator = 0
local AntiFailAccumulator = 0
local YellowAccumulator = 0
local YellowSpamPhase = -1
local YellowSpamScanAt = 0
local YellowSpamNext = 0
local YellowSpamPulseUntil = 0

local YellowSoulStep
local SuperChargeSusieStep
local AutoDateAnswersStep
local FreeSpellsTensionHold
local GiveCustomDoki

BattleLifecycle = {
    ActiveController = nil,
    ActiveSignature = nil,
    LastScan = 0,
    LastFrame = 0,
}

Fns.ApplyWindUIInputPriority = function()
end

Fns.ResetBattleRuntimeCaches = function(clearBattle)
    if clearBattle then
        LiveBattleCache.Battle = nil
        LiveBattleCache.LastScan = 0
    end

    Cache.TensionBars = {}
    Cache.TensionTables = {}
    Cache.SoulTables = {}
    Cache.HPTables = {}
    Cache.BattleTables = {}
    Cache.LastScan = 0

    FightAttackCache.Controller = nil
    FightAttackCache.LastScan = 0
    PinkDateCache.State = nil
    PinkDateCache.LastScan = 0
    PinkDateCache.LastQuestion = nil
    PinkDateCache.AnsweredForQ = nil
    DumbAttackCache.LastGcScan = 0
    GersonSceneCache.Scene = nil
    GersonSceneCache.LastFallbackScan = 0
    BossCache.Tenna = {}
    BossCache.Last = 0
    YellowSpamPhase = -1
    YellowSpamNext = 0
    YellowSpamPulseUntil = 0
    if clearBattle then
        QueenShieldCache.Controller = nil
        QueenShieldCache.Enemy = nil
        QueenShieldCache.Shield = nil
        QueenShieldCache.LastScan = 0
    end
end

Fns.RestoreBattleFeatureHooks = function(battle)
    if type(battle) ~= "table" then return end
    if PinksState.TPInfinite then
        local maxTP = Fns.GetTensionMax()
        local maxValue = tonumber(rawget(battle, "TensionMax")) or maxTP
        if type(rawget(battle, "Tension")) == "number" then rawset(battle, "Tension", math.min(maxTP, maxValue)) end
    end
    if PinksState.HPInfinite then pcall(Fns.ApplyHPInfinite, true, battle) end
    if PinksState.GodMode then pcall(Fns.ApplyGodMode, true, battle) end
    if PinksState.FreeSoulToggle then pcall(Fns.ApplyFreeSoul, true) end
    if PinksState.DumbAttack then pcall(Fns.ApplyDumbAttack, true) end
    if PinksState.DateFreezeTime then pcall(Fns.ApplyDateFreezeTime, true) end
    if PinksState.AutoDateAnswers then PinkDateCache.State = nil; pcall(AutoDateAnswersStep) end
    if PinksState.AutoSpamShots or PinksState.NoChargeShots then
        pcall(Fns.EnsureYellowInputHook, battle)
        pcall(YellowSoulStep)
    end
    if PinksState.SuperChargeSusieAct then pcall(SuperChargeSusieStep) end
    if PinksState.FreeSpells then pcall(ApplyFreeSpells, true) end
    if PinksState.FreeActs then pcall(ApplyFreeActs, true) end
    if PinksState.AntiStealItems then pcall(Fns.ApplyAntiStealItems, true) end
    if PinksState.GersonShield then pcall(Fns.GetGersonSpearScene, true) end
    if PinksState.EramNoclip then pcall(Fns.EramNoclipStep) end
    if PinksState.EramNoAttackCD then pcall(Fns.EramNoAttackCDStep) end
    if PinksState.DeleteStinky then
        pcall(Fns.InstallDeleteAttackHooks, battle)
        pcall(Fns.ClearBulletsNow)
    end
    if PinksState.ShowEnemyHP then pcall(Fns.ApplyShowEnemyHP, true) end
    if PinksState.AutoDefendParty then pcall(Fns.ApplyAutoDefendParty, true) end
    if PinksState.DisableAllMoves then pcall(Fns.ApplyDisableAllMoves, true) end
    if PinksState.QueenShieldAlwaysBroken then pcall(Fns.ApplyQueenShieldAlwaysBroken, true) end
    if PinksState.RouxlsUnlockFullMenu then pcall(Fns.ApplyRouxlsUnlockFullMenu, true) end
    if PinksState.AntiFailAutoAttack then pcall(Fns.ApplyAntiFailAutoAttack, true) end
end

Fns.GetBattleSignature = function(battle)
    if type(battle) ~= "table" then return "" end
    local fight = rawget(battle, "Fight")
    local nestedBattle = rawget(battle, "Battle")
    local roster = rawget(battle, "Roster")
    local members = type(roster) == "table" and rawget(roster, "Members") or nil
    local fightState = rawget(battle, "FightState")
    local scene = rawget(battle, "Scene")
    local label = Fns.GetBattleFightLabel(battle)
    local stableId = rawget(battle, "EncounterId") or rawget(battle, "FightId") or rawget(battle, "FightName")
    if stableId == nil and type(fight) == "table" then
        stableId = rawget(fight, "Id") or rawget(fight, "Wall") or rawget(fight, "Name")
    end
    return table.concat({
        tostring(fight), tostring(nestedBattle), tostring(fightState), tostring(scene),
        tostring(roster), tostring(members), tostring(stableId), tostring(label)
    }, "|")
end

Fns.AdoptBattleController = function(battle)
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then return false end
    if type(rawget(battle, "Roster")) ~= "table" then return false end
    local signature = Fns.GetBattleSignature(battle)
    local changed = LiveBattleCache.Battle ~= battle
        or BattleLifecycle.ActiveController ~= battle
        or BattleLifecycle.ActiveSignature ~= signature
    if changed then Fns.ResetBattleRuntimeCaches(false) end
    LiveBattleCache.Battle = battle
    BattleLifecycle.ActiveController = battle
    BattleLifecycle.ActiveSignature = signature
    BattleLifecycle.LastTerminalController = nil
    if changed and type(Fns.RestoreBattleFeatureHooks) == "function" then
        pcall(Fns.RestoreBattleFeatureHooks, battle)
    end
    return true
end

Fns.RefreshBattleLifecycle = function()
    local now = os.clock()
    if now - BattleLifecycle.LastFrame < 0.25 then
        return
    end
    BattleLifecycle.LastFrame = now
    local cached = LiveBattleCache.Battle

    if type(cached) == "table" and Fns.IsTerminalBattleController(cached) then
        if BattleLifecycle.ActiveController ~= nil or cached ~= BattleLifecycle.LastTerminalController then
            Fns.ResetBattleRuntimeCaches(true)
            BattleLifecycle.ActiveController = nil
            BattleLifecycle.ActiveSignature = nil
            BattleLifecycle.LastTerminalController = cached
        end
        BattleLifecycle.LastScan = now - 2.6
        Fns.ApplyWindUIInputPriority()
        return
    end

    local active = BattleLifecycle.ActiveController
    if type(active) == "table" then
        if Fns.IsTerminalBattleController(active) then
            Fns.ResetBattleRuntimeCaches(true)
            BattleLifecycle.ActiveController = nil
            BattleLifecycle.ActiveSignature = nil
            BattleLifecycle.LastTerminalController = active
            BattleLifecycle.LastScan = now - 2.6
            Fns.ApplyWindUIInputPriority()
            return
        end
        if type(rawget(active, "Roster")) == "table" then
            local signature = Fns.GetBattleSignature(active)
            if LiveBattleCache.Battle ~= active or signature ~= BattleLifecycle.ActiveSignature then
                Fns.ResetBattleRuntimeCaches(false)
                LiveBattleCache.Battle = active
                BattleLifecycle.ActiveController = active
                BattleLifecycle.ActiveSignature = signature
                Fns.RestoreBattleFeatureHooks(active)
                if PinksState.ShowEnemyHP then pcall(Fns.ApplyShowEnemyHP, true) end
            end
            local scanEvery = 3.5
            if not (PinksState.TPInfinite or PinksState.HPInfinite or PinksState.GodMode) then
                scanEvery = 5
            end
            if now - (BattleLifecycle.LastScan or 0) >= scanEvery then
                BattleLifecycle.LastScan = now
                local scanned = Fns.FindLiveBattleController(true, true)
                if type(scanned) == "table" and not Fns.IsTerminalBattleController(scanned) then
                    if scanned ~= active then
                        pcall(Fns.AdoptBattleController, scanned)
                        active = scanned
                    end
                else
                    LiveBattleCache.Battle = active
                end
            end
            Fns.ApplyWindUIInputPriority()
            return
        end
        Fns.ResetBattleRuntimeCaches(true)
        BattleLifecycle.ActiveController = nil
        BattleLifecycle.ActiveSignature = nil
    end

    if now - BattleLifecycle.LastScan < 2.5 then
        Fns.ApplyWindUIInputPriority()
        return
    end
    BattleLifecycle.LastScan = now

    local battle = Fns.FindLiveBattleController(false)
    if type(battle) == "table" and not Fns.IsTerminalBattleController(battle) then
        local signature = Fns.GetBattleSignature(battle)
        if BattleLifecycle.ActiveController ~= battle or BattleLifecycle.ActiveSignature ~= signature then
            Fns.ResetBattleRuntimeCaches(false)
            LiveBattleCache.Battle = battle
            BattleLifecycle.ActiveController = battle
            BattleLifecycle.ActiveSignature = signature
            Fns.RestoreBattleFeatureHooks(battle)
            if PinksState.ShowEnemyHP then pcall(Fns.ApplyShowEnemyHP, true) end
        end
        BattleLifecycle.LastTerminalController = nil
        Fns.ApplyWindUIInputPriority()
    else
        if BattleLifecycle.ActiveController ~= nil then
            Fns.ResetBattleRuntimeCaches(true)
            BattleLifecycle.ActiveController = nil
            BattleLifecycle.ActiveSignature = nil
        end
        Fns.ApplyWindUIInputPriority()
    end
end

local VisualUpdateAccumulator = 0
RunService.Heartbeat:Connect(function(dt)
    VisualUpdateAccumulator += dt
    if VisualUpdateAccumulator >= 0.75 then
        VisualUpdateAccumulator = 0
        if PinksState.VisualDisableEffects or PinksState.VisualStopBackground then
            pcall(Fns.ApplyVisualControlsStep)
        end
    end
    local needTP = PinksState.TPInfinite
    local needHP = PinksState.HPInfinite
    local needGod = PinksState.GodMode
    local needClear = PinksState.DeleteStinky
    local needDefend = PinksState.AutoDefendParty == true
    local needDumb = PinksState.DumbAttack
    local needAntiFail = PinksState.AntiFailAutoAttack
    local needDate = PinksState.DateFreezeTime
    local needYellow = PinksState.AutoSpamShots or PinksState.NoChargeShots
    local needSusie = PinksState.SuperChargeSusieAct
    local needAutoDate = PinksState.AutoDateAnswers
    local needFreeSpellTP = PinksState.FreeSpells
    local needFreeSoul = PinksState.FreeSoulToggle == true
    local needShowEnemyHP = PinksState.ShowEnemyHP == true
    local needDisableMoves = PinksState.DisableAllMoves == true
    local needQueenBroken = PinksState.QueenShieldAlwaysBroken == true
    local needRouxlsMenu = PinksState.RouxlsUnlockFullMenu == true
    local needEramNoclip    = PinksState.EramNoclip == true
    local needEramNoAtkCD   = PinksState.EramNoAttackCD == true
    local needFreeActs = PinksState.FreeActs == true
    local needGerson = PinksState.GersonShield == true or PinksState.GersonRudeTiming == true or PinksState.GersonAutoTiming == true
    local needAntiSteal = PinksState.AntiStealItems == true
    local needsLifecycle = needTP or needHP or needGod or needFreeSoul or needClear or needDefend or needDumb or needAntiFail or needDate or needYellow or needSusie or needAutoDate or needFreeSpellTP or needShowEnemyHP or needDisableMoves or needQueenBroken or needRouxlsMenu or needEramNoclip or needEramNoAtkCD or needFreeActs or needGerson or needAntiSteal

    if not needsLifecycle then
        GenericAccumulator = 0
        LifecycleAccumulator = 0
        UndertaleProtectionAccumulator = 0
        ClearAccumulator = 0
        StatsAccumulator = 0
        HPHookAccumulator = 0
        DateAccumulator = 0
        AttackAccumulator = 0
        AntiFailAccumulator = 0
        YellowAccumulator = 0
        TPInfiniteAccumulator = 0
        HPInfiniteAccumulator = 0
        local cached = LiveBattleCache.Battle
        if type(cached) == "table" and Fns.IsTerminalBattleController(cached) then
            SoftRecoverAfterBattle()
        end
        return
    end

    local cachedBattle = LiveBattleCache.Battle
    if type(cachedBattle) == "table" and Fns.IsTerminalBattleController(cachedBattle) then
        SoftRecoverAfterBattle()
        return
    end

    local missingBattle = type(LiveBattleCache.Battle) ~= "table"
    LifecycleAccumulator = (LifecycleAccumulator or 0) + dt
    if missingBattle or LifecycleAccumulator >= 0.75 then
        LifecycleAccumulator = 0
        pcall(Fns.RefreshBattleLifecycle)
    end

    GenericAccumulator = (GenericAccumulator or 0) + dt
    ClearAccumulator = ClearAccumulator + dt
    StatsAccumulator = StatsAccumulator + dt
    local updateStats = StatsAccumulator >= 0.1
    if updateStats then StatsAccumulator = 0 end

    local battle = LiveBattleCache.Battle
    if needHP then
        HPHookAccumulator = HPHookAccumulator + dt
        if HPHookAccumulator >= 1 then
            HPHookAccumulator = 0
            pcall(Fns.InstallHPInfiniteHook)
        end
    else
        HPHookAccumulator = 0
    end
    if type(battle) == "table" and not Fns.IsTerminalBattleController(battle) then
        if needClear and ClearAccumulator >= 0.15 then
            ClearAccumulator = 0
            pcall(function()
                local b = rawget(battle, "Battle") or battle
                if type(b) == "table" then
                    if type(b.ClearBullets) == "function" then b:ClearBullets() end
                    local bullets = rawget(b, "Bullets")
                    if type(bullets) == "table" then
                        for k, bullet in pairs(bullets) do
                            if type(bullet) == "table" then
                                rawset(bullet, "Harmful", false)
                                rawset(bullet, "Damage", 0)
                                rawset(bullet, "Alive", false)
                                if type(bullet.Destroy) == "function" then pcall(function() bullet:Destroy() end) end
                            end
                            bullets[k] = nil
                        end
                    end
                end
            end)
        end

        if needTP then
            TPInfiniteAccumulator = (TPInfiniteAccumulator or 0) + dt
            if TPInfiniteAccumulator >= 0.15 then
                TPInfiniteAccumulator = 0
                local max = Fns.GetTensionMax()
                local function bump(ctrl)
                    if type(ctrl) ~= "table" then return end
                    if type(rawget(ctrl, "Tension")) ~= "number" and type(rawget(ctrl, "TensionMax")) ~= "number" then
                        return
                    end
                    local tmax = tonumber(rawget(ctrl, "TensionMax")) or max
                    if tmax < 1 then tmax = max end
                    local setTo = math.max(max, tmax)
                    rawset(ctrl, "TensionMax", setTo)
                    rawset(ctrl, "Tension", setTo)
                    local bar = rawget(ctrl, "TensionBar")
                    if type(bar) == "table" then
                        if type(bar.Snap) == "function" then
                            pcall(function() bar:Snap(setTo) end)
                        else
                            rawset(bar, "Apparent", setTo)
                            rawset(bar, "Current", setTo)
                        end
                    end
                    if type(ctrl.StepTensionBar) == "function" then
                        pcall(function() ctrl:StepTensionBar() end)
                    end
                end
                bump(battle)
                bump(type(battle) == "table" and rawget(battle, "Battle") or nil)
                bump(type(battle) == "table" and rawget(battle, "Ts") or nil)
                for _, v in pairs(Cache.TensionTables) do
                    bump(v)
                end
                for _, v in pairs(Cache.TensionBars) do
                    if type(v) == "table" then
                        if type(rawget(v, "Snap")) == "function" then
                            pcall(function() v:Snap(max) end)
                        else
                            rawset(v, "Apparent", max)
                            rawset(v, "Current", max)
                        end
                    end
                end
            end
        else
            TPInfiniteAccumulator = 0
        end

        if needGod or needHP or needDefend then
            HPInfiniteAccumulator = (HPInfiniteAccumulator or 0) + dt
            local doHpTick = needHP and HPInfiniteAccumulator >= 0.25
            local doGodTick = needGod and (updateStats or doHpTick)
            local doDefendTick = needDefend and updateStats
            if doHpTick then HPInfiniteAccumulator = 0 end
            if doGodTick then
                pcall(function()
                    Fns.ForEachLiveSoul(battle, function(soul)
                        if type(soul) == "table" then
                            rawset(soul, "Invuln", 999999)
                            local maxhp = tonumber(rawget(soul, "MaxHP"))
                            if maxhp and maxhp > 0 then rawset(soul, "HP", maxhp) end
                        end
                    end)
                end)
            end
            if doHpTick or doGodTick or doDefendTick then
                local roster = rawget(battle, "Roster")
                local members = type(roster) == "table" and rawget(roster, "Members") or nil
                if type(members) == "table" then
                    local enemyPhase = needDefend and Fns.IsEnemyBulletPhase(battle)
                    for _, member in pairs(members) do
                        if type(member) == "table" and (type(Fns.IsLocalPartyMember) ~= "function" or Fns.IsLocalPartyMember(member)) then
                            if doGodTick or doHpTick then
                                local maxhp = tonumber(rawget(member, "MaxHP"))
                                if maxhp and maxhp > 0 then
                                    rawset(member, "HP", maxhp)
                                    rawset(member, "Down", false)
                                    rawset(member, "Swooned", false)
                                end
                            end
                            if enemyPhase and doDefendTick then rawset(member, "Defending", true) end
                        end
                    end
                end
            end
            if doDefendTick then pcall(Fns.AutoDefendPartyStep) end
        else
            HPInfiniteAccumulator = 0
        end
    end

    if GenericAccumulator >= 0.25 then GenericAccumulator = 0 end
    if not needClear then ClearAccumulator = 0 end

    if needDate then
        DateAccumulator = (DateAccumulator or 0) + dt
        if DateAccumulator >= 1.0 then
            DateAccumulator = 0
            pcall(Fns.DateFreezeTimeStep)
        end
    else
        DateAccumulator = 0
    end

    if needDumb then
        AttackAccumulator = (AttackAccumulator or 0) + dt
        if AttackAccumulator >= 0.6 then
            AttackAccumulator = 0
            pcall(Fns.DumbAttackStep)
        end
    else
        AttackAccumulator = 0
    end

    if needAntiFail then
        AntiFailAccumulator = AntiFailAccumulator + dt
        if AntiFailAccumulator >= 0.12 then
            AntiFailAccumulator = 0
            pcall(Fns.AntiFailAutoAttackStep)
        end
    else
        AntiFailAccumulator = 0
    end

    if needYellow then
        YellowAccumulator = YellowAccumulator + dt
        if YellowAccumulator >= 0.1 then
            YellowAccumulator = 0
            pcall(YellowSoulStep)
        end
    else
        YellowAccumulator = 0
    end
    if needSusie and updateStats then pcall(SuperChargeSusieStep) end

    if needAutoDate then
        AutoDateAccumulator = (AutoDateAccumulator or 0) + dt
        if AutoDateAccumulator >= 0.8 then
            AutoDateAccumulator = 0
            pcall(AutoDateAnswersStep)
        end
    else
        AutoDateAccumulator = 0
    end

    if needFreeSpellTP and updateStats then pcall(FreeSpellsTensionHold) end

    if needFreeSoul and updateStats then
        local battle = LiveBattleCache.Battle
        if type(battle) == "table" then
            pcall(function()
                Fns.ForEachLiveSoul(battle, Fns.PatchFreeSoulInstance)
            end)
        end
        pcall(Fns.UpdateSoulClampOverride)
    end

    if needHP or needGod or needFreeSoul then
        UndertaleProtectionAccumulator = (UndertaleProtectionAccumulator or 0) + dt
        if UndertaleProtectionAccumulator >= 0.15 then
            UndertaleProtectionAccumulator = 0
            pcall(Fns.ApplyUndertaleProtectionStep)
            local activeBattle = LiveBattleCache.Battle
            if type(activeBattle) == "table" then
                pcall(function()
                    Fns.ForEachLiveSoul(activeBattle, Fns.PatchGodModeSoul)
                end)
            end
        end
    else
        UndertaleProtectionAccumulator = 0
    end

    if needEramNoclip and updateStats then
        pcall(Fns.EramNoclipStep)
    end

    if needEramNoAtkCD then
        pcall(Fns.EramNoAttackCDStep)
    end

    if needDisableMoves then
        DisableMovesAccumulator = (DisableMovesAccumulator or 0) + dt
        if DisableMovesAccumulator >= 0.25 then
            DisableMovesAccumulator = 0
            pcall(Fns.DisableAllMovesStep)
        end
    else
        DisableMovesAccumulator = 0
    end

    if needQueenBroken then
        QueenBrokenAccumulator = (QueenBrokenAccumulator or 0) + dt
        if QueenBrokenAccumulator >= 0.45 then
            QueenBrokenAccumulator = 0
            pcall(Fns.QueenShieldAlwaysBrokenStep)
        end
    else
        QueenBrokenAccumulator = 0
    end

    if needRouxlsMenu then
        RouxlsMenuAccumulator = (RouxlsMenuAccumulator or 0) + dt
        if RouxlsMenuAccumulator >= 0.5 then
            RouxlsMenuAccumulator = 0
            pcall(Fns.RouxlsUnlockFullMenuStep)
        end
    else
        RouxlsMenuAccumulator = 0
    end

end)

RunService.Stepped:Connect(function()
    if PinksState.GersonShield then
        pcall(Fns.GersonShieldStep)
    end

    if PinksState.GersonRudeTiming then
        pcall(function()
            Fns.GersonRudeBusterStep(true)
        end)
    elseif PinksState.GersonAutoTiming then
        pcall(Fns.GersonAutoTimingRudeBusterStep)
    end
end)

Fns.IsSpamtonNeoBattle = function(battle)
    if type(battle) ~= "table" then return false end
    local roots, seen = {}, {}
    local function add(root)
        if type(root) == "table" and not seen[root] then
            seen[root] = true
            roots[#roots + 1] = root
        end
    end
    add(battle)
    for _, key in ipairs({ "Fight", "FightState", "Battle", "Controller" }) do
        add(rawget(battle, key))
    end
    for _, root in ipairs(roots) do
        for _, key in ipairs({ "Id", "FightId", "Name", "Key", "Wall" }) do
            local value = rawget(root, key)
            if type(value) == "string" and string.lower(value:gsub("%s+", "")) == "spamtonneo" then
                return true
            end
        end
    end
    return false
end

Fns.GetSpamtonNeoYellowControllers = function(battle)
    if type(battle) ~= "table" or not Fns.IsSpamtonNeoBattle(battle) then
        return nil, nil, nil
    end
    local fightState = rawget(battle, "FightState") or rawget(battle, "Fight") or battle
    local scene = type(fightState) == "table" and (rawget(fightState, "LiveScene") or rawget(fightState, "Scene") or rawget(fightState, "Room")) or nil
    if type(scene) ~= "table" then scene = rawget(battle, "Scene") or rawget(battle, "LiveScene") end
    local controllers, seen = {}, {}
    Fns.ForEachLiveSoul(battle, function(soul)
        if type(soul) ~= "table" then return end
        local modeHolds = rawget(soul, "ModeHolds")
        local list = type(modeHolds) == "table" and rawget(modeHolds, "List") or nil
        if type(list) ~= "table" then return end
        for _, entry in pairs(list) do
            if type(entry) == "table" and rawget(entry, "Mode") == "Yellow" then
                local controller = rawget(entry, "Owner")
                if type(controller) == "table" and rawget(controller, "Soul") == soul and not seen[controller] then
                    seen[controller] = true
                    controllers[#controllers + 1] = controller
                end
            end
        end
    end)
    return fightState, scene, controllers
end

Fns.GetYellowControllerForOwner = function(controllers, owner)
    if type(controllers) ~= "table" then return nil end
    for _, controller in pairs(controllers) do
        if type(controller) == "table" then
            local soul = rawget(controller, "Soul")
            if type(soul) == "table" and rawget(soul, "Owner") == owner then
                return controller
            end
        end
    end
    return nil
end

Fns.PrimeYellowBigShot = function(controller)
    if type(controller) ~= "table" then return end
    rawset(controller, "Hold", 999)
    rawset(controller, "HoldFrames", 60)
    rawset(controller, "Charged", true)
    rawset(controller, "Delay", 0)
    local soul = rawget(controller, "Soul")
    if type(soul) ~= "table" or type(soul.EffectUsers) ~= "function" then return end
    local ok, users = pcall(soul.EffectUsers, soul, "YellowHeart")
    if not ok or type(users) ~= "table" then return end
    for _, user in pairs(users) do
        if type(user) == "table" then
            local link = rawget(user, "YellowLink")
            if type(link) == "table" then
                local count = tonumber(rawget(link, "BigShotCount")) or 0
                if count < 1 then rawset(link, "BigShotCount", 1) end
            end
        end
    end
end

Fns.MakeBigShotInput = function(input)
    local output, pressed, released = {}, {}, {}
    if type(input) == "table" then
        for key, value in pairs(input) do output[key] = value end
        if type(input.Pressed) == "table" then
            for key, value in pairs(input.Pressed) do pressed[key] = value end
        end
        if type(input.Released) == "table" then
            for key, value in pairs(input.Released) do released[key] = value end
        end
    end
    output.Pressed = pressed
    output.Released = released
    output.Confirm = false
    output.Pressed.Confirm = false
    output.Released.Confirm = true
    return output
end

local YellowSpamNextByController = setmetatable({}, { __mode = "k" })

Fns.EnsureYellowInputHook = function(battle)
    if type(battle) ~= "table" or not Fns.IsSpamtonNeoBattle(battle) then return end
    local target = rawget(battle, "Battle")
    if type(target) ~= "table" or type(target.ControllerInput) ~= "function" then
        target = battle
    end
    if type(target) ~= "table" or rawget(target, "_SWYellowInputHook") == true then return end
    local originalInput = target.ControllerInput
    if type(originalInput) ~= "function" then return end

    rawset(target, "_SWYellowInputHook", true)
    rawset(target, "ControllerInput", function(self, owner, ...)
        local input = originalInput(self, owner, ...)
        if type(input) ~= "table" or not (PinksState.AutoSpamShots or PinksState.NoChargeShots) then
            return input
        end
        local currentBattle = LiveBattleCache.Battle
        if type(currentBattle) ~= "table" or not Fns.IsSpamtonNeoBattle(currentBattle) then
            return input
        end
        local _, _, controllers = Fns.GetSpamtonNeoYellowControllers(currentBattle)
        local controller = Fns.GetYellowControllerForOwner(controllers, owner)
        if type(controller) ~= "table" then return input end

        if PinksState.AutoSpamShots then
            local now = os.clock()
            local nextShot = YellowSpamNextByController[controller] or 0
            if now >= nextShot then
                YellowSpamNextByController[controller] = now + 0.2
                Fns.PrimeYellowBigShot(controller)
                return Fns.MakeBigShotInput(input)
            end
            return input
        end

        local pressed = type(input.Pressed) == "table" and input.Pressed.Confirm == true
        if pressed then
            Fns.PrimeYellowBigShot(controller)
            return Fns.MakeBigShotInput(input)
        end
        return input
    end)
end

YellowSoulStep = function()
    if not (PinksState.AutoSpamShots or PinksState.NoChargeShots) then return end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then
        battle = Fns.FindLiveBattleController(false, false)
    end
    if type(battle) ~= "table" or not Fns.IsSpamtonNeoBattle(battle) then return end
    pcall(Fns.EnsureYellowInputHook, battle)
    local _, _, controllers = Fns.GetSpamtonNeoYellowControllers(battle)
    if type(controllers) == "table" then
        for _, controller in ipairs(controllers) do
            Fns.PrimeYellowBigShot(controller)
        end
    end
end

SuperChargeSusieStep = function()
    if not PinksState.SuperChargeSusieAct then return end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then battle = Fns.FindLiveBattleController(false, false) end
    if type(battle) ~= "table" or not Fns.IsSpamtonNeoBattle(battle) then return end
    local fightState = rawget(battle, "FightState")
    if type(fightState) ~= "table" then fightState = rawget(battle, "Fight") end
    if type(fightState) == "table" then rawset(fightState, "BigShotCount", 20) end
end

Fns.FindBestDateChoice = function(state)
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

    local state = Fns.GetPinkDateStateSafe(false)

    if not state then
        state = Fns.GetPinkDateStateSafe(true)
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

    local best = Fns.FindBestDateChoice(state)
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
    local setAny = false

    local function trySet(tbl)
        if type(tbl) ~= "table" then
            return
        end
        if rawget(tbl, "Doki") ~= nil or rawget(tbl, "DokiMax") ~= nil or rawget(tbl, "DokiMeter") ~= nil then
            local maxDoki = tonumber(rawget(tbl, "DokiMax")) or tonumber(rawget(tbl, "MaxDoki")) or 100
            if rawget(tbl, "Doki") ~= nil then
                rawset(tbl, "Doki", math.clamp(amount, 0, maxDoki))
                setAny = true
            end
            if rawget(tbl, "DokiMeter") ~= nil then
                rawset(tbl, "DokiMeter", math.clamp(amount, 0, maxDoki))
                setAny = true
            end
        end
    end

    local battle = LiveBattleCache.Battle or Fns.FindLiveBattleController(true)
    if type(battle) == "table" then
        trySet(rawget(battle, "FightState"))
        trySet(rawget(battle, "Fight"))
        trySet(battle)
        local fs = rawget(battle, "FightState")
        if type(fs) == "table" then
            for _, v in pairs(fs) do
                trySet(v)
            end
        end
    end

    if not setAny then
        pcall(function()
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" then
                    local d = rawget(v, "Doki")
                    if type(d) == "number" then
                        local maxDoki = tonumber(rawget(v, "DokiMax")) or 100
                        rawset(v, "Doki", math.clamp(amount, 0, maxDoki))
                        setAny = true
                    end
                end
            end
        end)
    end

    return setAny
end

Fns.GiveCustomMercy = function(amount)
    amount = tonumber(amount) or 0
    local battle = LiveBattleCache.Battle or Fns.FindLiveBattleController(false)
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then return false end
    local changed = false
    pcall(function()
        for _, enemy in ipairs(Fns.GetBattleEnemies(battle)) do
            local def = rawget(enemy, "Def")
            local maxm = 100
            if type(def) == "table" and type(rawget(def, "MercyMax")) == "number" then maxm = rawget(def, "MercyMax") end
            if type(rawget(enemy, "MercyMax")) == "number" then maxm = rawget(enemy, "MercyMax") end
            if type(rawget(enemy, "Maxmercy")) == "number" then maxm = rawget(enemy, "Maxmercy") end
            local desired = math.clamp(amount, 0, maxm)
            local added = false
            if type(rawget(battle, "AddMercy")) == "function" then
                local current = tonumber(rawget(enemy, "Mercy")) or 0
                added = pcall(function() battle:AddMercy(enemy, desired - current) end)
            end
            if not added then rawset(enemy, "Mercy", desired) end
            changed = true
        end
        if changed and type(rawget(battle, "RefreshUi")) == "function" then pcall(function() battle:RefreshUi() end) end
    end)
    return changed
end

FreeSpellsTensionHold = function()
    if not PinksState.FreeSpells then
        return
    end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        return
    end
    local max = Fns.GetTensionMax()
    local tmax = tonumber(rawget(battle, "TensionMax")) or max
    if type(rawget(battle, "Tension")) == "number" then
        local cur = tonumber(rawget(battle, "Tension")) or 0
        if cur < tmax then
            rawset(battle, "Tension", tmax)
        end
    end
end

Fns.SetupUIAndKeybinds = function()
local FloatingActionGuis = {}
local FloatingToggleGuis = {}
Fns.NextFloatingOffset = function()
    local camera = workspace.CurrentCamera
    local viewport = camera and camera.ViewportSize or Vector2.new(1280, 720)
    local buttonSize = IsMobile and 64 or 82
    local margin = IsMobile and 10 or 16
    local gap = IsMobile and 8 or 10
    local activeCount = 0
    for _ in pairs(FloatingActionGuis) do activeCount += 1 end
    for _ in pairs(FloatingToggleGuis) do activeCount += 1 end
    local i = activeCount + 1
    local columns = math.max(1, math.floor((viewport.X - margin * 2 + gap) / (buttonSize + gap)))
    local col = (i - 1) % columns
    local row = math.floor((i - 1) / columns)
    local x = viewport.X - margin - buttonSize - col * (buttonSize + gap)
    local y = margin + row * (buttonSize + gap)
    local maxX = math.max(margin, viewport.X - buttonSize - margin)
    local maxY = math.max(margin, viewport.Y - buttonSize - margin)
    return UDim2.fromOffset(math.clamp(x, margin, maxX), math.clamp(y, margin, maxY)), buttonSize
end

Fns.DestroyFloatingGui = function(store, id)
    local entry = store[id]
    if entry then
        pcall(function()
            if type(entry.Connections) == "table" then
                for _, connection in ipairs(entry.Connections) do
                    if connection and connection.Connected then connection:Disconnect() end
                end
            end
            if entry.InputChangedConnection then
                entry.InputChangedConnection:Disconnect()
            end
            if entry.InputEndedConnection then
                entry.InputEndedConnection:Disconnect()
            end
            if entry.ScreenGui then
                entry.ScreenGui:Destroy()
            end
        end)
        store[id] = nil
    end
end

Fns.CreateFloatingActionButton = function(id, labelText, onPress)
    Fns.DestroyFloatingGui(FloatingActionGuis, id)

    local player = LocalPlayer
    if not player then
        return
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SW_FloatBtn_" .. tostring(id)
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 100
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = player:WaitForChild("PlayerGui")

    local Holder = Instance.new("Frame")
    local floatingPosition, floatingSize = Fns.NextFloatingOffset()
    Holder.Size = UDim2.fromOffset(floatingSize, floatingSize)
    Holder.Position = floatingPosition
    Holder.BackgroundTransparency = 1
    Holder.Parent = ScreenGui

    local Shadow = Instance.new("ImageLabel")
    Shadow.Size = UDim2.new(1, 26, 1, 26)
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 6)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxassetid://1316045217"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.55
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    Shadow.ZIndex = 0
    Shadow.Parent = Holder

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.AnchorPoint = Vector2.new(0.5, 0.5)
    Button.Position = UDim2.new(0.5, 0, 0.5, 0)
    Button.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    Button.AutoButtonColor = false
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.ClipsDescendants = true
    Button.ZIndex = 1
    Button.Parent = Holder

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 22)
    Corner.Parent = Button

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 180, 180)),
    })
    Gradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.88),
        NumberSequenceKeypoint.new(1, 1),
    })
    Gradient.Rotation = 90
    Gradient.Parent = Button

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(95, 95, 105)
    Stroke.Thickness = 1.4
    Stroke.Transparency = 0.2
    Stroke.Parent = Button

    local Glow = Instance.new("ImageLabel")
    Glow.Size = UDim2.new(1, 80, 1, 80)
    Glow.AnchorPoint = Vector2.new(0.5, 0.5)
    Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://5028857084"
    Glow.ImageColor3 = Color3.fromRGB(124, 97, 255)
    Glow.ImageTransparency = 1
    Glow.ScaleType = Enum.ScaleType.Slice
    Glow.SliceCenter = Rect.new(24, 24, 276, 276)
    Glow.ZIndex = 0
    Glow.Parent = Button

    local Ripple = Instance.new("Frame")
    Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    Ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
    Ripple.Size = UDim2.new(0, 0, 0, 0)
    Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ripple.BackgroundTransparency = 1
    Ripple.BorderSizePixel = 0
    Ripple.ZIndex = 1
    Ripple.Parent = Button

    local RippleCorner = Instance.new("UICorner")
    RippleCorner.CornerRadius = UDim.new(1, 0)
    RippleCorner.Parent = Ripple

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -8, 1, -8)
    Label.AnchorPoint = Vector2.new(0.5, 0.5)
    Label.Position = UDim2.new(0.5, 0, 0.5, 0)
    Label.BackgroundTransparency = 1
    Label.Text = tostring(labelText or "Btn")
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 14
    Label.TextWrapped = true
    Label.TextColor3 = Color3.fromRGB(195, 195, 200)
    Label.ZIndex = 2
    Label.Parent = Button

    local ColorBase = Color3.fromRGB(28, 28, 34)
    local ColorPress = Color3.fromRGB(108, 83, 240)
    local StrokeBase = Color3.fromRGB(95, 95, 105)
    local StrokePress = Color3.fromRGB(190, 175, 255)
    local TextBase = Color3.fromRGB(195, 195, 200)
    local TextPress = Color3.fromRGB(255, 255, 255)
    local SUAVE = TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local pressing = false

    local function doRipple()
        Ripple.Size = UDim2.new(0, 0, 0, 0)
        Ripple.BackgroundTransparency = 0.6
        TweenService:Create(Ripple, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 190, 0, 190),
            BackgroundTransparency = 1,
        }):Play()
    end

    local function execute()
        doRipple()
        TweenService:Create(Label, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            TextTransparency = 1,
            TextSize = 18,
        }):Play()
        task.delay(0.1, function()
            Label.TextColor3 = TextPress
            TweenService:Create(Label, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                TextTransparency = 0,
                TextSize = 14,
            }):Play()
        end)
        TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            Size = UDim2.new(0.82, 0, 0.82, 0),
        }):Play()
        task.delay(0.1, function()
            TweenService:Create(Button, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 1, 0),
            }):Play()
        end)
        TweenService:Create(Button, SUAVE, { BackgroundColor3 = ColorPress }):Play()
        TweenService:Create(Stroke, SUAVE, { Color = StrokePress, Transparency = 0, Thickness = 1.8 }):Play()
        TweenService:Create(Glow, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { ImageTransparency = 0.35 }):Play()
        if type(onPress) == "function" then
            task.spawn(onPress)
        end
        task.delay(0.35, function()
            TweenService:Create(Button, SUAVE, { BackgroundColor3 = ColorBase }):Play()
            TweenService:Create(Stroke, SUAVE, { Color = StrokeBase, Transparency = 0.2, Thickness = 1.4 }):Play()
            TweenService:Create(Glow, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), { ImageTransparency = 1 }):Play()
            TweenService:Create(Label, SUAVE, { TextColor3 = TextBase }):Play()
        end)
    end

    do
        Holder.Size = UDim2.fromOffset(floatingSize, floatingSize)
        Button.Size = UDim2.new(0, 0, 0, 0)
        Button.BackgroundTransparency = 0
        Stroke.Transparency = 1
        Label.TextTransparency = 1
        Shadow.ImageTransparency = 1
        TweenService:Create(Button, TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 1, 0),
        }):Play()
        TweenService:Create(Stroke, TweenInfo.new(0.5), { Transparency = 0.2 }):Play()
        TweenService:Create(Shadow, TweenInfo.new(0.5), { ImageTransparency = 0.55 }):Play()
        task.delay(0.28, function()
            TweenService:Create(Label, TweenInfo.new(0.4), { TextTransparency = 0 }):Play()
        end)
    end

    local dragging, dragStart, startPos, moved, dragKind = false, nil, nil, false, nil

    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            moved = false
            dragKind = input.UserInputType
            dragStart = input.Position
            startPos = Holder.Position
        end
    end)

    local function moveHolder(position)
        local delta = position - dragStart
        if delta.Magnitude > 5 then moved = true end
        local camera = workspace.CurrentCamera
        local viewport = camera and camera.ViewportSize or Vector2.new(1280, 720)
        local width = Holder.AbsoluteSize.X
        local height = Holder.AbsoluteSize.Y
        local x = math.clamp(startPos.X.Offset + delta.X, 8, math.max(8, viewport.X - width - 8))
        local y = math.clamp(startPos.Y.Offset + delta.Y, 8, math.max(8, viewport.Y - height - 8))
        Holder.Position = UDim2.fromOffset(x, y)
    end

    local inputChangedConnection = UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end
        if dragKind == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement then
            moveHolder(input.Position)
        elseif dragKind == Enum.UserInputType.Touch and input.UserInputType == Enum.UserInputType.Touch then
            moveHolder(input.Position)
        end
    end)

    local inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
        if dragging and ((dragKind == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseButton1)
            or (dragKind == Enum.UserInputType.Touch and input.UserInputType == Enum.UserInputType.Touch)) then
            dragging = false
            dragKind = nil
        end
    end)

    Button.Activated:Connect(function()
        if moved or pressing then
            moved = false
            return
        end
        pressing = true
        execute()
        task.delay(0.5, function()
            pressing = false
        end)
    end)

    Button.MouseEnter:Connect(function()
        if not UserInputService.TouchEnabled then
            TweenService:Create(Stroke, SUAVE, { Thickness = 2 }):Play()
        end
    end)

    Button.MouseLeave:Connect(function()
        if not UserInputService.TouchEnabled then
            TweenService:Create(Stroke, SUAVE, { Thickness = 1.4 }):Play()
        end
    end)

    FloatingActionGuis[id] = { ScreenGui = ScreenGui, Holder = Holder, Connections = { inputChangedConnection, inputEndedConnection } }
    return FloatingActionGuis[id]
end

Fns.CreateFloatingToggleButton = function(id, labelText, getState, setState)
    Fns.DestroyFloatingGui(FloatingToggleGuis, id)

    local player = LocalPlayer
    if not player then
        return
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SW_FloatTog_" .. tostring(id)
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 100
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = player:WaitForChild("PlayerGui")

    local Holder = Instance.new("Frame")
    local floatingPosition, floatingSize = Fns.NextFloatingOffset()
    Holder.Size = UDim2.fromOffset(floatingSize, floatingSize)
    Holder.Position = floatingPosition
    Holder.BackgroundTransparency = 1
    Holder.Parent = ScreenGui

    local Shadow = Instance.new("ImageLabel")
    Shadow.Size = UDim2.new(1, 26, 1, 26)
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 6)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxassetid://1316045217"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.55
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    Shadow.ZIndex = 0
    Shadow.Parent = Holder

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.AnchorPoint = Vector2.new(0.5, 0.5)
    Button.Position = UDim2.new(0.5, 0, 0.5, 0)
    Button.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    Button.AutoButtonColor = false
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.ClipsDescendants = true
    Button.ZIndex = 1
    Button.Parent = Holder

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 22)
    Corner.Parent = Button

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 180, 180)),
    })
    Gradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.88),
        NumberSequenceKeypoint.new(1, 1),
    })
    Gradient.Rotation = 90
    Gradient.Parent = Button

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(95, 95, 105)
    Stroke.Thickness = 1.4
    Stroke.Transparency = 0.2
    Stroke.Parent = Button

    local Glow = Instance.new("ImageLabel")
    Glow.Size = UDim2.new(1, 80, 1, 80)
    Glow.AnchorPoint = Vector2.new(0.5, 0.5)
    Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://5028857084"
    Glow.ImageColor3 = Color3.fromRGB(124, 97, 255)
    Glow.ImageTransparency = 1
    Glow.ScaleType = Enum.ScaleType.Slice
    Glow.SliceCenter = Rect.new(24, 24, 276, 276)
    Glow.ZIndex = 0
    Glow.Parent = Button

    local Ripple = Instance.new("Frame")
    Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    Ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
    Ripple.Size = UDim2.new(0, 0, 0, 0)
    Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ripple.BackgroundTransparency = 1
    Ripple.BorderSizePixel = 0
    Ripple.ZIndex = 1
    Ripple.Parent = Button

    local RippleCorner = Instance.new("UICorner")
    RippleCorner.CornerRadius = UDim.new(1, 0)
    RippleCorner.Parent = Ripple

    local IndicatorBar = Instance.new("Frame")
    IndicatorBar.Size = UDim2.new(0, 28, 0, 3)
    IndicatorBar.AnchorPoint = Vector2.new(0.5, 1)
    IndicatorBar.Position = UDim2.new(0.5, 0, 1, -12)
    IndicatorBar.BackgroundColor3 = Color3.fromRGB(95, 95, 105)
    IndicatorBar.BorderSizePixel = 0
    IndicatorBar.ZIndex = 2
    IndicatorBar.Parent = Button

    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = IndicatorBar

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -8, 1, -20)
    Label.AnchorPoint = Vector2.new(0.5, 0.5)
    Label.Position = UDim2.new(0.5, 0, 0.45, 0)
    Label.BackgroundTransparency = 1
    Label.Text = tostring(labelText or "Tog")
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 14
    Label.TextWrapped = true
    Label.TextColor3 = Color3.fromRGB(195, 195, 200)
    Label.ZIndex = 2
    Label.Parent = Button

    local ColorOff = Color3.fromRGB(28, 28, 34)
    local ColorOn = Color3.fromRGB(108, 83, 240)
    local StrokeOff = Color3.fromRGB(95, 95, 105)
    local StrokeOn = Color3.fromRGB(190, 175, 255)
    local TextOff = Color3.fromRGB(195, 195, 200)
    local TextOn = Color3.fromRGB(255, 255, 255)
    local BarOff = Color3.fromRGB(95, 95, 105)
    local BarOn = Color3.fromRGB(255, 255, 255)
    local SUAVE = TweenInfo.new(0.32, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local SUAVE_LONG = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local enabled = false
    local animating = false

    local function doRipple()
        Ripple.Size = UDim2.new(0, 0, 0, 0)
        Ripple.BackgroundTransparency = 0.6
        TweenService:Create(Ripple, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 190, 0, 190),
            BackgroundTransparency = 1,
        }):Play()
    end

    local function animateText(on)
        TweenService:Create(Label, TweenInfo.new(0.14, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            TextTransparency = 1,
            TextSize = on and 18 or 12,
        }):Play()
        task.delay(0.14, function()
            Label.TextColor3 = on and TextOn or TextOff
            TweenService:Create(Label, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                TextTransparency = 0,
                TextSize = 14,
            }):Play()
        end)
    end

    local function applyButtonAppearance(on, animate)
        enabled = on
        if animate == false then
            Button.BackgroundColor3 = on and ColorOn or ColorOff
            Stroke.Color = on and StrokeOn or StrokeOff
            Glow.ImageTransparency = on and 0.4 or 1
            IndicatorBar.BackgroundColor3 = on and BarOn or BarOff
            Label.TextColor3 = on and TextOn or TextOff
            return
        end
        doRipple()
        animateText(on)
        TweenService:Create(Button, TweenInfo.new(0.14, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            Size = UDim2.new(0.84, 0, 0.84, 0),
        }):Play()
        task.delay(0.14, function()
            TweenService:Create(Button, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 1, 0),
            }):Play()
        end)
        TweenService:Create(Button, SUAVE, { BackgroundColor3 = on and ColorOn or ColorOff }):Play()
        TweenService:Create(Stroke, SUAVE, {
            Color = on and StrokeOn or StrokeOff,
            Transparency = on and 0 or 0.2,
            Thickness = on and 1.8 or 1.4,
        }):Play()
        TweenService:Create(Glow, SUAVE_LONG, { ImageTransparency = on and 0.4 or 1 }):Play()
        TweenService:Create(IndicatorBar, SUAVE, {
            BackgroundColor3 = on and BarOn or BarOff,
            Size = on and UDim2.new(0, 36, 0, 3) or UDim2.new(0, 28, 0, 3),
        }):Play()
        if on then
            local pulse = TweenService:Create(Glow, TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
                ImageTransparency = 0.65,
            })
            pulse:Play()
            Glow:SetAttribute("PulseActive", true)
        else
            Glow:SetAttribute("PulseActive", false)
        end
    end

    do
        Holder.Size = UDim2.fromOffset(floatingSize, floatingSize)
        Button.Size = UDim2.new(0, 0, 0, 0)
        Button.BackgroundTransparency = 0
        Stroke.Transparency = 1
        Label.TextTransparency = 1
        Shadow.ImageTransparency = 1
        IndicatorBar.BackgroundTransparency = 1
        TweenService:Create(Button, TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 1, 0),
        }):Play()
        TweenService:Create(Stroke, TweenInfo.new(0.5), { Transparency = 0.2 }):Play()
        TweenService:Create(Shadow, TweenInfo.new(0.5), { ImageTransparency = 0.55 }):Play()
        TweenService:Create(IndicatorBar, TweenInfo.new(0.5), { BackgroundTransparency = 0 }):Play()
        task.delay(0.28, function()
            TweenService:Create(Label, TweenInfo.new(0.4), { TextTransparency = 0 }):Play()
        end)
    end

    local initial = false
    if type(getState) == "function" then
        local ok, val = pcall(getState)
        if ok then
            initial = val == true
        end
    end
    applyButtonAppearance(initial, false)

    local dragging, dragStart, startPos, moved, dragKind = false, nil, nil, false, nil

    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            moved = false
            dragKind = input.UserInputType
            dragStart = input.Position
            startPos = Holder.Position
        end
    end)

    local function moveHolder(position)
        local delta = position - dragStart
        if delta.Magnitude > 5 then moved = true end
        local camera = workspace.CurrentCamera
        local viewport = camera and camera.ViewportSize or Vector2.new(1280, 720)
        local width = Holder.AbsoluteSize.X
        local height = Holder.AbsoluteSize.Y
        local x = math.clamp(startPos.X.Offset + delta.X, 8, math.max(8, viewport.X - width - 8))
        local y = math.clamp(startPos.Y.Offset + delta.Y, 8, math.max(8, viewport.Y - height - 8))
        Holder.Position = UDim2.fromOffset(x, y)
    end

    local inputChangedConnection = UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end
        if dragKind == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement then
            moveHolder(input.Position)
        elseif dragKind == Enum.UserInputType.Touch and input.UserInputType == Enum.UserInputType.Touch then
            moveHolder(input.Position)
        end
    end)

    local inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
        if dragging and ((dragKind == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseButton1)
            or (dragKind == Enum.UserInputType.Touch and input.UserInputType == Enum.UserInputType.Touch)) then
            dragging = false
            dragKind = nil
        end
    end)

    Button.Activated:Connect(function()
        if moved or animating then
            moved = false
            return
        end
        animating = true
        local newState = not enabled
        applyButtonAppearance(newState, true)
        if type(setState) == "function" then
            task.spawn(function()
                pcall(setState, newState)
            end)
        end
        task.delay(0.55, function()
            animating = false
        end)
    end)

    Button.MouseEnter:Connect(function()
        if not UserInputService.TouchEnabled then
            TweenService:Create(Stroke, SUAVE, { Thickness = (enabled and 1.8 or 1.4) + 0.6 }):Play()
        end
    end)

    Button.MouseLeave:Connect(function()
        if not UserInputService.TouchEnabled then
            TweenService:Create(Stroke, SUAVE, { Thickness = enabled and 1.8 or 1.4 }):Play()
        end
    end)

    FloatingToggleGuis[id] = {
        ScreenGui = ScreenGui,
        Holder = Holder,
        Connections = { inputChangedConnection, inputEndedConnection },
        Set = function(on)
            applyButtonAppearance(on == true, true)
        end,
        Get = function()
            return enabled
        end,
    }
    return FloatingToggleGuis[id]
end

Fns.SyncLibraryToggle = function(flag, value)
    pcall(function()
        if Toggles and Toggles[flag] and type(Toggles[flag].SetValue) == "function" then
            Toggles[flag]:SetValue(value == true)
        end
    end)
end

local Window
do
    local iconValue = "swords"
    pcall(function()
        if Library.ImageManager and type(Library.ImageManager.AddAsset) == "function" then
            Library.ImageManager.AddAsset(
                "DeltaruneSWIcon",
                0,
                "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/Icon.png",
                true
            )
            local id = Library.ImageManager.GetAsset("DeltaruneSWIcon")
            if type(id) == "string" and id ~= "" then
                iconValue = id
            end
        end
    end)

    local okWin, winOrErr = pcall(function()
        return Library:CreateWindow({
            Title = "Deltarune Fight | SW",
            Footer = "v3.0.2 | Obsidian",
            Icon = iconValue,
            NotifySide = "Right",
            ShowCustomCursor = true,
            Center = true,
            AutoShow = true,
            Resizable = true,
            ToggleKeybind = Enum.KeyCode.LeftShift,
            MobileButtonsSide = "Left",
        })
    end)

    if not okWin or type(winOrErr) ~= "table" then
        okWin, winOrErr = pcall(function()
            return Library:CreateWindow({
                Title = "Deltarune Fight | SW",
                Footer = "v3.0.2 | Obsidian",
                Icon = "swords",
                NotifySide = "Right",
                ShowCustomCursor = true,
                Center = true,
                AutoShow = true,
                Resizable = true,
                ToggleKeybind = Enum.KeyCode.LeftShift,
                MobileButtonsSide = "Left",
            })
        end)
    end

    if not okWin or type(winOrErr) ~= "table" then

        return
    end
    Window = winOrErr
end

pcall(function()
    if type(Library.Notify) == "function" then
        Library:Notify({
            Title = "Deltarune | SW",
            Description = "Loaded successfully. Loading may take a moment.",
            Time = 5,
        })
    end
end)
Fns.ResolveEnemyDisplayName = function(enemy)
    if type(enemy) ~= "table" then return "" end
    local def = rawget(enemy, "Def")
    local candidates = {
        rawget(enemy, "Name"),
        rawget(enemy, "ShowName"),
        rawget(enemy, "DisplayName"),
        rawget(enemy, "Key"),
        rawget(enemy, "Id"),
        rawget(enemy, "ActorKey"),
        rawget(enemy, "Myself"),
    }
    if type(def) == "table" then
        table.insert(candidates, rawget(def, "Name"))
        table.insert(candidates, rawget(def, "ShowName"))
        table.insert(candidates, rawget(def, "DisplayName"))
        table.insert(candidates, rawget(def, "Key"))
        table.insert(candidates, rawget(def, "Id"))
        table.insert(candidates, rawget(def, "Actor"))
        table.insert(candidates, rawget(def, 1))
        local nested = rawget(def, "Enemy") or rawget(def, "Actor")
        if type(nested) == "table" then
            table.insert(candidates, rawget(nested, "Name"))
            table.insert(candidates, rawget(nested, "Key"))
        end
    end
    for _, c in ipairs(candidates) do
        if type(c) == "string" then
            local n = string.gsub(c, "^%s*(.-)%s*$", "%1")
            if n ~= "" and n ~= "(none)" and n ~= "table" then
                return n
            end
        elseif type(c) == "number" then
            return tostring(c)
        end
    end
    return ""
end

GetCurrentEnemyNames = function(forceRefresh)
    local names = {}
    local seen = {}
    local counts = {}
    local function addName(value)
        value = tostring(value or "")
        value = string.gsub(value, "^%s*(.-)%s*$", "%1")
        if value == "" or value == "(none)" or value == "(no active enemies)" then return end
        local base = value
        counts[base] = (counts[base] or 0) + 1
        if counts[base] > 1 then
            value = base .. " #" .. tostring(counts[base])
        end
        if seen[value] then return end
        seen[value] = true
        names[#names + 1] = value
    end
    local battle = LiveBattleCache.Battle
    if forceRefresh or type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then
        battle = Fns.FindLiveBattleController(forceRefresh == true, false)
    end
    if type(battle) == "table" and not Fns.IsTerminalBattleController(battle) then
        if type(Fns.AdoptBattleController) == "function" then Fns.AdoptBattleController(battle) end
        local enemies = Fns.GetBattleEnemies(battle)
        for _, enemy in ipairs(enemies) do
            if type(enemy) == "table" and rawget(enemy, "Alive") ~= false and rawget(enemy, "Gone") ~= true then
                addName(Fns.ResolveEnemyDisplayName(enemy))
            end
        end
        if #names == 0 then
            local okList, list = pcall(function()
                if type(battle.EnemyList) == "function" then return battle:EnemyList() end
            end)
            if okList and type(list) == "table" then
                for _, enemy in pairs(list) do
                    if type(enemy) == "table" and rawget(enemy, "Alive") ~= false then
                        addName(Fns.ResolveEnemyDisplayName(enemy))
                    end
                end
            end
        end
    end
    table.sort(names)
    return names
end

GiveMercyToNamedBoss = function(bossName, amount)
    amount = tonumber(amount) or 0
    bossName = tostring(bossName or "")
    bossName = string.gsub(bossName, "^%s*(.-)%s*$", "%1")
    if bossName == "" or bossName == "(no active enemies)" or bossName == "(none)" then return false end
    local baseWanted = string.gsub(bossName, "%s*#%d+$", "")
    local wantedIndex = tonumber(string.match(bossName, "#(%d+)$")) or 0
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then
        battle = Fns.FindLiveBattleController(true, false)
    end
    if type(battle) ~= "table" or Fns.IsTerminalBattleController(battle) then return false end
    local changed = false
    local matchedIndex = 0
    local owners = { battle, rawget(battle, "Battle"), rawget(battle, "Ts"), rawget(battle, "Fight") }
    local targets = Fns.CollectMercyTargets(battle)
    for _, enemy in ipairs(targets) do
        local enemyName = Fns.ResolveEnemyDisplayName(enemy)
        local base = string.gsub(tostring(enemyName), "%s*#%d+$", "")
        local hit = string.lower(tostring(enemyName)) == string.lower(bossName)
            or string.lower(base) == string.lower(baseWanted)
        if hit then
            matchedIndex = matchedIndex + 1
            if wantedIndex == 0 or matchedIndex == wantedIndex or tostring(enemyName) == bossName then
                for _, owner in ipairs(owners) do
                    Fns.ApplyMercyToEnemy(owner, enemy, amount)
                end
                Fns.ApplyMercyToEnemy(nil, enemy, amount)
                changed = true
                if wantedIndex > 0 then break end
            end
        end
    end
    if changed then
        for _, owner in ipairs(owners) do
            if type(owner) == "table" and type(rawget(owner, "RefreshUi")) == "function" then
                pcall(function() owner:RefreshUi() end)
            end
        end
    end
    return changed
end

SoftRecoverAfterBattle = function()
    LiveBattleCache.Battle = nil
    LiveBattleCache.LastScan = 0
    pcall(function()
        if type(BattleLifecycle) == "table" then
            BattleLifecycle.ActiveController = nil
            BattleLifecycle.ActiveSignature = nil
            BattleLifecycle.LastScan = 0
            BattleLifecycle.LastFrame = 0
        end
        if type(Fns.ResetBattleRuntimeCaches) == "function" then
            Fns.ResetBattleRuntimeCaches(true)
        end
        if GersonSceneCache then GersonSceneCache.Scene = nil end
        if PinkDateCache then PinkDateCache.State = nil end
        if FightAttackCache then
            FightAttackCache.Controller = nil
            FightAttackCache.LastScan = 0
        end
        if QueenShieldCache then
            QueenShieldCache.Controller = nil
            QueenShieldCache.Enemy = nil
            QueenShieldCache.Shield = nil
        end
        Cache.TensionBars = {}
        Cache.TensionTables = {}
        Cache.SoulTables = {}
        Cache.HPTables = {}
        Cache.BattleTables = {}
        Cache.LastScan = 0
    end)
    if PinksState.HPInfinite then pcall(Fns.InstallHPInfiniteHook) end
end

local JevilChaosCache = { Module = nil, Original = nil, Wrapper = nil, Pending = nil }

Fns.QueueJevilChaosOutcome = function(choice)
    local indexes = {
        ["Damage Enemy (Spade)"] = 1,
        ["Heal Party (Heart)"] = 2,
        ["Heal Enemy (Diamond)"] = 3,
        ["Damage Party (Club)"] = 4,
    }
    local index = indexes[tostring(choice or "")] or 1
    local ok, module = pcall(function()
        return require(ReplicatedStorage.Core.Combat.SpellFx.Jevil)
    end)
    if not ok or type(module) ~= "table" or type(module.Chaos) ~= "function" then return false end
    JevilChaosCache.Module = module
    if not JevilChaosCache.Wrapper or module.Chaos ~= JevilChaosCache.Wrapper then
        local original = module.Chaos
        JevilChaosCache.Original = original
        JevilChaosCache.Wrapper = function(self, ...)
            local selected = JevilChaosCache.Pending
            if not selected then return original(self, ...) end
            JevilChaosCache.Pending = nil
            local rawRandom = rawget(self, "Random")
            local originalRandom = self.Random
            rawset(self, "Random", function(context, minValue, maxValue, ...)
                if tonumber(minValue) == 1 and tonumber(maxValue) == 5 then return selected end
                if type(originalRandom) == "function" then return originalRandom(context, minValue, maxValue, ...) end
                return selected
            end)
            local packed = table.pack(pcall(original, self, ...))
            rawset(self, "Random", rawRandom)
            if not packed[1] then error(packed[2]) end
            return table.unpack(packed, 2, packed.n)
        end
        module.Chaos = JevilChaosCache.Wrapper
    end
    JevilChaosCache.Pending = index
    return true
end

Fns.GetJevilChaosNow = function()
    local choice = Fns.ReadOptionValue("JevilChaosChoice", PinksState.JevilChaosChoice)
    PinksState.JevilChaosChoice = tostring(choice or "Damage Enemy (Spade)")
    local ok = Fns.QueueJevilChaosOutcome(PinksState.JevilChaosChoice)
    pcall(function()
        Library:Notify({
            Title = "Jevil Chaos",
            Description = ok and ("Next Chaos result: " .. PinksState.JevilChaosChoice) or "Jevil Chaos module is unavailable.",
            Time = 3,
        })
    end)
    return ok
end

local Tabs = {
    Home      = Window:AddTab("Home", "info"),
    Visual    = Window:AddTab("Visual", "eye"),
    Automatic = Window:AddTab("Automatic", "refresh-cw"),
    Boss      = Window:AddTab("Boss / Mini-Boss", "swords"),
    Keybinds  = Window:AddTab("Keybinds", "keyboard"),
    Settings  = Window:AddTab("Settings", "settings"),
}

do
    local Info = Tabs.Home:AddGroupbox({
        Side = "Left",
        Name = "Information",
        IconName = "info",
    })

    Info:AddLabel({
        Text = "Support Executors\n\nMobile:\n[OK] Delta (deltaexploits.dev) - Recommended\n[OK] Codex (codex.lol)\n\nmacOS:\n[OK] Opiumware (opiumware.today)\n[OK] Hydrogen (hydrogen.lat)\n[OK] Macsploit (raptor.fun)\n\nWindows:\n[OK] Volt (voltbz.net)\n[OK] Madium (getmadium.net)\n[OK] Real (realest.gg)\n[OK] Velocity (getvelocity.llc)\n[OK] Potassium (potassium.pro)\n[~] Solara (getsolara.dev)\n[X] Xeno (xeno.onl) - Unstable",
        DoesWrap = true,
    })

    Info:AddDivider()

    Info:AddLabel({
        Text = "Supported Games\n[OK] Funhouse\n[OK] Deltarune Fight",
        DoesWrap = true,
    })

    Info:AddDivider()

    Info:AddLabel({
        Text = "Developers\nHs (Https), Gh (GourdyHalloway), Nc (Nexocat).",
        DoesWrap = true,
    })

    local Server = Tabs.Home:AddGroupbox({
        Side = "Right",
        Name = "Server",
        IconName = "message-circle",
    })

    Server:AddButton({
        Text = "Copy Discord Link",
        Func = function()
            if type(setclipboard) == "function" then
                setclipboard("https://discord.gg/y3cHAw6Bb4")
                Library:Notify({ Title = "Copied!", Description = "Discord link copied to clipboard.", Time = 3 })
            end
        end,
    })
end

do
    local VisualGeneral = Tabs.Visual:AddGroupbox({
        Side = "Left",
        Name = "General",
        IconName = "eye",
    })

    VisualGeneral:AddToggle("VisualDisableEffects", {
        Text = "Disable all Effect's",
        Default = false,
        Callback = function(value)
            Fns.ApplyVisualDisableEffects(value == true)
        end,
    })

    VisualGeneral:AddToggle("VisualStopBackground", {
        Text = "Stop Moving background",
        Default = false,
        Callback = function(value)
            Fns.ApplyStopMovingBackground(value == true)
        end,
    })

    VisualGeneral:AddToggle("ViewHitbox", {
        Text = "View all Hitboxes",
        Default = false,
        Callback = function(value)
            Fns.SetViewHitbox(value == true)
        end,
    })

    local VisualSprites = Tabs.Visual:AddGroupbox({
        Side = "Right",
        Name = "Sprites",
        IconName = "users",
    })

    VisualSprites:AddDropdown("VisualActor", {
        Values = Fns.GetHeroKeyOptions(),
        Default = "Kris",
        Text = "Actor",
        Searchable = true,
        Callback = function(option)
            PinksState.VisualActor = tostring(option or "Kris")
        end,
    })

    VisualSprites:AddDropdown("VisualSpriteSource", {
        Values = Fns.GetHeroKeyOptions(),
        Default = "Frisk",
        Text = "Sprite's",
        Searchable = true,
        Callback = function(option)
            PinksState.VisualSpriteSource = tostring(option or "Frisk")
        end,
    })

    VisualSprites:AddButton({
        Text = "Reset Sprites",
        Func = function()
            local actor = Fns.ReadOptionValue("VisualActor", PinksState.VisualActor or "Kris")
            local ok, message = Fns.ResetActorSprites(actor)
            Library:Notify({ Title = "Sprites", Description = message, Time = 3 })
        end,
    })

    VisualSprites:AddButton({
        Text = "Change Actor Sprites",
        Func = function()
            local actor = Fns.ReadOptionValue("VisualActor", PinksState.VisualActor or "Kris")
            local source = Fns.ReadOptionValue("VisualSpriteSource", PinksState.VisualSpriteSource or "Frisk")
            local ok, message = Fns.ChangeActorSprites(actor, source)
            Library:Notify({ Title = "Sprites", Description = message, Time = 3 })
        end,
    })
end

do
    local TP = Tabs.Automatic:AddGroupbox({
        Side = "Left",
        Name = "TP",
        IconName = "zap",
    })

    TP:AddToggle("TPInfinite", {
        Text = "TP Infinite",
        Default = false,
        Callback = function(value)
            PinksState.TPInfinite = value == true
            if PinksState.TPInfinite then
                Fns.RescanCache("hard")
                Fns.FindLiveBattleController(true, false)
                Fns.ForceTP(Fns.GetTensionMax())
                Fns.UnlockTPNow()
            end
        end,
    })

    TP:AddButton({ Text = "TP Max", Func = function() Fns.ForceTP(Fns.GetTensionMax()) end })
    TP:AddInput("TPGiver", {
        Text = "TP Giver",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "Amount...",
        Callback = function(value) PinksState._TPAmount = tonumber(value) or 0 end,
    })
    TP:AddButton({
        Text = "Give TP",
        Func = function()
            local amount = Fns.ReadOptionNumber("TPGiver", PinksState._TPAmount or 10)
            PinksState._TPAmount = amount
            Fns.ForceTP(amount)
        end,
    })
    TP:AddButton({ Text = "Unlock TP", Func = function() Fns.UnlockTPNow() end })

    local HP = Tabs.Automatic:AddGroupbox({
        Side = "Right",
        Name = "HP",
        IconName = "heart",
    })

    HP:AddToggle("HPInfinite", {
        Text = "HP Infinite",
        Default = false,
        Callback = function(value)
            Fns.ApplyHPInfinite(value == true)
        end,
    })
    HP:AddInput("HPGiver", {
        Text = "HP Giver",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "Amount...",
        Callback = function(value) PinksState._HPAmount = tonumber(value) or 0 end,
    })
    HP:AddDropdown("HPTargetActor", {
        Values = (function()
            local list = { "All" }
            for _, name in ipairs(Fns.GetHeroKeyOptions()) do list[#list + 1] = name end
            return list
        end)(),
        Default = "All",
        Text = "HP Target",
        Searchable = true,
        Callback = function(option) PinksState.HPTargetActor = option or "All" end,
    })
    HP:AddButton({
        Text = "Give HP",
        Func = function()
            local amount = Fns.ReadOptionNumber("HPGiver", PinksState._HPAmount or 0)
            PinksState._HPAmount = amount
            if amount == 0 then return end
            local target = Fns.ReadOptionValue("HPTargetActor", PinksState.HPTargetActor or "All")
            PinksState.HPTargetActor = target
            Fns.GivePartyHP(amount, target)
        end,
    })
    HP:AddButton({
        Text = "Heal Party",
        Func = function()
            Fns.RescanCache("hard")
            Fns.ForcePartyHPFull()
        end,
    })
    local Mercy = Tabs.Automatic:AddGroupbox({
        Side = "Left",
        Name = "Mercy",
        IconName = "heart-handshake",
    })
    Mercy:AddDropdown("MercyBoss", {
        Values = { "(none)" },
        Default = 1,
        Text = "Boss",
        Searchable = true,
        Callback = function(option) PinksState.MercyBossName = option end,
    })
    Mercy:AddInput("CustomMercy", {
        Text = "Mercy Amount",
        Default = "100",
        Numeric = true,
        Finished = false,
        Placeholder = "Amount...",
        Callback = function(value) PinksState.CustomMercyAmount = tonumber(value) or 0 end,
    })
    Mercy:AddButton({
        Text = "Refresh Boss",
        Func = function()
            local names = GetCurrentEnemyNames(true)
            if type(names) ~= "table" or #names == 0 then
                local okKeys, keys = pcall(function()
                    if type(Fns.GetEnemyKeyOptions) == "function" then return Fns.GetEnemyKeyOptions() end
                end)
                if okKeys and type(keys) == "table" and #keys > 0 then
                    names = {}
                    for _, key in ipairs(keys) do
                        if type(key) == "string" and key ~= "" and key ~= "(none)" then
                            names[#names + 1] = key
                        end
                    end
                end
            end
            local activeCount = type(names) == "table" and #names or 0
            if activeCount == 0 then names = { "(no active enemies)" } end
            local option = Options.MercyBoss
            if type(option) == "table" then
                pcall(function()
                    if type(option.SetValues) == "function" then option:SetValues(names)
                    elseif type(option.Refresh) == "function" then option:Refresh(names)
                    else rawset(option, "Values", names); if type(option.Display) == "function" then option:Display() end end
                end)
                pcall(function()
                    if type(option.SetValue) == "function" then option:SetValue(names[1])
                    else rawset(option, "Value", names[1]) end
                end)
            end
            PinksState.MercyBossName = names[1]
            pcall(function()
                local description = activeCount > 0 and (tostring(activeCount) .. " active enemy option(s) loaded.") or "No active enemies found in the current fight."
                Library:Notify({ Title = "Boss List", Description = description, Time = 3 })
            end)
        end,
    })
    Mercy:AddButton({
        Text = "Give Mercy to Boss",
        Func = function()
            local amount = Fns.ReadOptionNumber("CustomMercy", PinksState.CustomMercyAmount or 100)
            local boss = Fns.ReadOptionValue("MercyBoss", PinksState.MercyBossName)
            GiveMercyToNamedBoss(boss, amount)
        end,
    })
    Mercy:AddButton({ Text = "Max Mercy (All Enemies)", Func = function() Fns.MaxMercyNow() end })

    local Soul = Tabs.Automatic:AddGroupbox({
        Side = "Right",
        Name = "Soul",
        IconName = "orbit",
    })
    Soul:AddToggle("FreeSoul", {
        Text = "Free-Soul",
        Default = false,
        Callback = function(value)
            PinksState.FreeSoulToggle = value == true
            Fns.ApplyFreeSoul(PinksState.FreeSoulToggle)
        end,
    })

    Soul:AddToggle("GodMode", {
        Text = "God-Mode",
        Default = false,
        Callback = function(value)
            PinksState.GodMode = value == true
            Fns.ApplyGodMode(PinksState.GodMode)
            if PinksState.GodMode then Fns.ApplyGodModeLive() end
        end,
    })

    local Fight = Tabs.Automatic:AddGroupbox({
        Side = "Right",
        Name = "Fight",
        IconName = "swords",
    })


    Fight:AddToggle("AntiFailAutoAttack", {
        Text = "Anti-Fail Attack",
        Default = false,
        Callback = function(value)
            Fns.ApplyAntiFailAutoAttack(value == true)
        end,
    })

    Fight:AddButton({
        Text = "Instant Complete Fight",
        Func = function()
            Fns.InstantWinNow()
        end,
    })

    Fight:AddButton({
        Text = "Skip Enemy's Turn",
        Func = function()
            Fns.SkipEnemyTurnNow()
        end,
    })

    Fight:AddToggle("AutoDefendParty", {
        Text = "Auto Defend Party",
        Tooltip = "Your party automatically guards against incoming enemy attacks.",
        Default = false,
        Callback = function(value)
            Fns.ApplyAutoDefendParty(value == true)
        end,
    })

    local Spells = Tabs.Automatic:AddGroupbox({
        Side = "Left",
        Name = "Spells / Acts",
        IconName = "sparkles",
    })

    Spells:AddToggle("FreeSpells", {
        Text = "Free Spells",
        Default = false,
        Callback = function(value)
            PinksState.FreeSpells = value == true
            ApplyFreeSpells(PinksState.FreeSpells)
        end,
    })

    Spells:AddToggle("FreeActs", {
        Text = "Free Acts",
        Default = false,
        Callback = function(value)
            PinksState.FreeActs = value == true
            ApplyFreeActs(PinksState.FreeActs)
        end,
    })

    Spells:AddDivider()

    Spells:AddDropdown("AssignActor", {
        Values = Fns.GetRealActorOptions(),
        Default = PinksState.AssignActor or "Kris",
        Text = "Actor",
        Searchable = true,
        Callback = function(option)
            PinksState.AssignActor = option
        end,
    })

    Spells:AddDropdown("AssignSpell", {
        Values = Fns.GetRealSpellOptions(),
        Default = PinksState.AssignSpell or "RudeBuster",
        Text = "Spell",
        Searchable = true,
        Callback = function(option)
            PinksState.AssignSpell = option
        end,
    })

    Spells:AddButton({
        Text = "Assign Spell to Actor",
        Func = function()
            Fns.AddSpellToActor(PinksState.AssignActor or "Kris", PinksState.AssignSpell or "RudeBuster")
        end,
    })

    Spells:AddDivider()

    Spells:AddDropdown("AssignAct", {
        Values = Fns.ScanActRegistry(false),
        Default = PinksState.AssignAct or "Check",
        Text = "Act",
        Searchable = true,
        Callback = function(option)
            PinksState.AssignAct = option
        end,
    })

    Spells:AddButton({
        Text = "Add Act to Actor",
        Func = function()
            Fns.AddActToActor(PinksState.AssignActor or "Kris", PinksState.AssignAct or "Check")
        end,
    })

    local Inventory = Tabs.Automatic:AddGroupbox({
        Side = "Right",
        Name = "Inventory",
        IconName = "package",
    })

    Inventory:AddDropdown("SpawnItemName", {
        Values = Fns.GetItemNameOptions(),
        Default = PinksState.SpawnItemName or "Dark Candy",
        Text = "Spawn Item",
        Searchable = true,
        Callback = function(option)
            PinksState.SpawnItemName = option
        end,
    })

    Inventory:AddToggle("InfiniteInventory", {
        Text = "Infinite Inventory",
        Default = false,
        Callback = function(value)
            Fns.ApplyInfiniteInventory(value == true)
        end,
    })

    Inventory:AddButton({
        Text = "Spawn Item",
        Func = function()
            local ok, msg = Fns.SpawnItemByName(PinksState.SpawnItemName)
            if not ok and msg == "full" then
                Library:Notify({ Title = "Full inventory!!", Description = "Your inventory is full.", Time = 3 })
            end
        end,
    })

    local Actors = Tabs.Automatic:AddGroupbox({
        Side = "Left",
        Name = "Actors",
        IconName = "users",
    })

    Actors:AddDropdown("PartyActorFrom", {
        Values = Fns.GetHeroKeyOptions(),
        Default = PinksState.PartyActorFrom or "Kris",
        Text = "Actors",
        Searchable = true,
        Callback = function(option)
            PinksState.PartyActorFrom = option
        end,
    })

    Actors:AddDropdown("PartyActorTo", {
        Values = Fns.GetHeroKeyOptions(),
        Default = PinksState.PartyActorTo or "Susie",
        Text = "Actor to Change",
        Searchable = true,
        Callback = function(option)
            PinksState.PartyActorTo = option
        end,
    })

    Actors:AddButton({
        Text = "Change Actor",
        Func = function()
            Fns.ChangePartyActor(PinksState.PartyActorFrom, PinksState.PartyActorTo)
        end,
    })

    local Stats = Tabs.Automatic:AddGroupbox({
        Side = "Right",
        Name = "Stats",
        IconName = "chart-bar",
    })

    Stats:AddDropdown("StatActor", {
        Values = Fns.GetHeroKeyOptions(),
        Default = PinksState.StatActor or "Kris",
        Text = "Actors",
        Searchable = true,
        Callback = function(option)
            PinksState.StatActor = option
        end,
    })

    Stats:AddDropdown("StatName", {
        Values = STAT_KEYS,
        Default = PinksState.StatName or "Attack",
        Text = "Stats",
        Callback = function(option)
            PinksState.StatName = option
        end,
    })

    Stats:AddInput("StatAmount", {
        Text = "Amount",
        Default = tostring(PinksState.StatAmount or 999),
        Numeric = true,
        Finished = false,
        Placeholder = "Amount...",
        Callback = function(value)
            PinksState.StatAmount = tonumber(value) or 0
        end,
    })

    Stats:AddButton({
        Text = "Change Stat",
        Func = function()
            local amount = Fns.ReadOptionNumber("StatAmount", PinksState.StatAmount or 999)
            PinksState.StatAmount = amount
            Fns.ChangeActorStat(PinksState.StatActor, PinksState.StatName, amount)
        end,
    })

    local Equipment = Tabs.Automatic:AddGroupbox({
        Side = "Left",
        Name = "Equipment",
        IconName = "shield",
    })

    Equipment:AddDropdown("ArmorActor", {
        Values = Fns.GetHeroKeyOptions(),
        Default = PinksState.ArmorActor or "Kris",
        Text = "Actor",
        Searchable = true,
        Callback = function(option)
            PinksState.ArmorActor = option
        end,
    })

    Equipment:AddDropdown("Armor1", {
        Values = Fns.GetArmorOptions(),
        Default = "None",
        Text = "Armor 1",
        Searchable = true,
        Callback = function(option)
            PinksState.Armor1 = option
        end,
    })

    Equipment:AddDropdown("Armor2", {
        Values = Fns.GetArmorOptions(),
        Default = "None",
        Text = "Armor 2",
        Searchable = true,
        Callback = function(option)
            PinksState.Armor2 = option
        end,
    })

    Equipment:AddButton({
        Text = "Assign Armor To Actor",
        Func = function()
            Fns.AssignArmorToActor(PinksState.ArmorActor, PinksState.Armor1, PinksState.Armor2)
        end,
    })

    Equipment:AddDivider()

    Equipment:AddDropdown("WeaponActor", {
        Values = Fns.GetHeroKeyOptions(),
        Default = PinksState.WeaponActor or "Kris",
        Text = "Weapon Actor",
        Searchable = true,
        Callback = function(option)
            PinksState.WeaponActor = option
        end,
    })

    Equipment:AddDropdown("WeaponName", {
        Values = Fns.GetWeaponOptions(),
        Default = "None",
        Text = "Weapon",
        Searchable = true,
        Callback = function(option)
            PinksState.WeaponName = option
        end,
    })

    Equipment:AddButton({
        Text = "Assign Weapon",
        Func = function()
            Fns.AssignWeaponToActor(PinksState.WeaponActor, PinksState.WeaponName)
        end,
    })
end

do
    local GeneralBoss = Tabs.Boss:AddGroupbox({
        Side = "Left",
        Name = "General",
        IconName = "swords",
    })

    GeneralBoss:AddToggle("DeleteStinky", {
        Text = "Delete Attacks",
        Tooltip = "Clear active enemy projectiles from the battle.",
        Default = false,
        Callback = function(value)
            PinksState.DeleteStinky = value == true
            if PinksState.DeleteStinky then
                local battle = Fns.FindLiveBattleController(true)
                if battle then
                    Fns.InstallDeleteAttackHooks(battle)
                end
                Fns.ClearBulletsNow()
            end
        end,
    })

    GeneralBoss:AddToggle("DumbAttack", {
        Text = "Dumb Attacks",
        Tooltip = "Redirect incoming enemy patterns away from the SOUL.",
        Default = false,
        Callback = function(value)
            Fns.ApplyDumbAttack(value == true)
        end,
    })

    GeneralBoss:AddToggle("ShowEnemyHP", {
        Text = "Show Enemy HP",
        Default = false,
        Callback = function(value)
            Fns.ApplyShowEnemyHP(value == true)
        end,
    })

    GeneralBoss:AddToggle("DisableAllMoves", {
        Text = "Disable All Moves",
        Default = false,
        Callback = function(value)
            Fns.ApplyDisableAllMoves(value == true)
        end,
    })

    GeneralBoss:AddDivider()

    GeneralBoss:AddDropdown("MusicTrack", {
        Values = Fns.GetMusicTrackOptions(),
        Default = Fns.GetMusicTrackOptions()[1] or "MenuTheme",
        Text = "Tracks",
        Searchable = true,
        Callback = function(option)
            PinksState.MusicTrack = option
        end,
    })

    GeneralBoss:AddButton({
        Text = "Swap Track",
        Func = function()
            Fns.SwapMusicTrack(PinksState.MusicTrack)
        end,
    })

    GeneralBoss:AddButton({
        Text = "Go to Default Track",
        Func = function()
            Fns.GoDefaultMusicTrack()
        end,
    })

    local Eram = Tabs.Boss:AddGroupbox({
        Side = "Right",
        Name = "Eram",
        IconName = "ghost",
    })

    Eram:AddToggle("EramNoclip", {
        Text = "Noclip (Eram)",
        Tooltip = "Move freely beyond the arena boundaries during Eram fights.",
        Default = false,
        Callback = function(value)
            Fns.ApplyEramNoclip(value == true)
        end,
    })

    Eram:AddToggle("EramNoAttackCD", {
        Text = "No Attack CD (Eram)",
        Tooltip = "Let the selected party members attack again without waiting during Eram fights.",
        Default = false,
        Callback = function(value)
            Fns.ApplyEramNoAttackCD(value == true)
        end,
    })

    Eram:AddDropdown("EramNoAttackCDActor", {
        Values = (function()
            local values = { "All" }
            for _, name in ipairs(Fns.GetHeroKeyOptions()) do
                values[#values + 1] = name
            end
            return values
        end)(),
        Default = "All",
        Text = "Actor Target",
        Tooltip = "Choose which party members receive the faster attack rhythm.",
        Callback = function(option)
            PinksState.EramNoAttackCDActor = option
        end,
    })

    local Jevil = Tabs.Boss:AddGroupbox({
        Side = "Left",
        Name = "Jevil",
        IconName = "dice-5",
    })


    Jevil:AddDropdown("JevilChaosChoice", {
        Values = { "Damage Enemy (Spade)", "Heal Party (Heart)", "Heal Enemy (Diamond)", "Damage Party (Club)" },
        Default = 1,
        Text = "Get Chaos",
        Searchable = false,
        Callback = function(option)
            PinksState.JevilChaosChoice = tostring(option or "Damage Enemy (Spade)")
        end,
    })

    Jevil:AddButton({
        Text = "Get",
        Func = function()
            Fns.GetJevilChaosNow()
        end,
    })

    local SpamtonNeo = Tabs.Boss:AddGroupbox({
        Side = "Right",
        Name = "Spamton Neo",
        IconName = "zap",
    })


    SpamtonNeo:AddToggle("AutoSpamShots", {
        Text = "Auto Spam Big Shots",
        Tooltip = "Release Big Shots automatically whenever Spamton NEO's Yellow Soul is ready.",
        Default = false,
        Callback = function(value)
            PinksState.AutoSpamShots = value == true
            YellowSpamNext = 0
            YellowSpamPulseUntil = 0
            if PinksState.AutoSpamShots then
                local battle = Fns.FindLiveBattleController(true, true)
                if type(battle) == "table" then
                    LiveBattleCache.Battle = battle
                    pcall(Fns.EnsureYellowInputHook, battle)
                    pcall(YellowSoulStep)
                end
            end
        end,
    })

    SpamtonNeo:AddToggle("NoChargeShots", {
        Text = "No Charge Big Shots",
        Tooltip = "Release a fully charged Big Shot with a single confirm press.",
        Default = false,
        Callback = function(value)
            PinksState.NoChargeShots = value == true
            YellowSpamNext = 0
            YellowSpamPulseUntil = 0
            if PinksState.NoChargeShots then
                local battle = Fns.FindLiveBattleController(true, true)
                if type(battle) == "table" then
                    LiveBattleCache.Battle = battle
                    pcall(Fns.EnsureYellowInputHook, battle)
                    pcall(YellowSoulStep)
                end
            end
        end,
    })

    SpamtonNeo:AddToggle("SuperChargeSusieAct", {
        Text = "Super Charge Susie's Act",
        Tooltip = "Keep Susie's Supercharge ready for repeated full-power Big Shots.",
        Default = false,
        Callback = function(value)
            PinksState.SuperChargeSusieAct = value == true
            if PinksState.SuperChargeSusieAct then
                Fns.FindLiveBattleController(true, true)
            end
        end,
    })

    local Gerson = Tabs.Boss:AddGroupbox({
        Side = "Left",
        Name = "Gerson",
        IconName = "shield",
    })


    Gerson:AddToggle("AntiStealItems", {
        Text = "Anti-Steal Items",
        Default = false,
        Callback = function(value)
            Fns.ApplyAntiStealItems(value == true)
        end,
    })

    Gerson:AddToggle("GersonShield", {
        Text = "Auto Parry",
        Default = false,
        Callback = function(value)
            PinksState.GersonShield = value == true
            GersonSceneCache.Scene = nil
            if PinksState.GersonShield then
                Fns.GetGersonSpearScene(true)
            end
        end,
    })

    Gerson:AddToggle("GersonRudeTiming", {
        Text = "Perfect Timing",
        Default = false,
        Callback = function(value)
            PinksState.GersonRudeTiming = value == true
        end,
    })

    Gerson:AddToggle("GersonAutoTiming", {
        Text = "Auto Timing Rude Buster",
        Default = false,
        Callback = function(value)
            PinksState.GersonAutoTiming = value == true
        end,
    })

    local Tenna = Tabs.Boss:AddGroupbox({
        Side = "Right",
        Name = "Tenna",
        IconName = "tv",
    })


    Tenna:AddButton({
        Text = "Max Score",
        Func = function()
            Fns.TennaMaxScoreNow()
        end,
    })

    local Pink = Tabs.Boss:AddGroupbox({
        Side = "Left",
        Name = "Pink",
        IconName = "heart",
    })

    Pink:AddToggle("AutoDateAnswers", {
        Text = "Auto Date Answers",
        Default = false,
        Callback = function(value)
            PinksState.AutoDateAnswers = value == true
            if value then
                PinkDateCache.State = nil
            end
        end,
    })

    Pink:AddButton({
        Text = "Max Doki Meter",
        Func = function()
            Fns.MaxDokiMeterNow()
        end,
    })

    Pink:AddInput("CustomDoki", {
        Text = "Custom Doki",
        Default = "100",
        Numeric = true,
        Finished = false,
        Placeholder = "Amount...",
        Callback = function(value)
            PinksState.CustomDokiAmount = tonumber(value) or 0
        end,
    })

    Pink:AddButton({
        Text = "Give Doki",
        Func = function()
            local amount = Fns.ReadOptionNumber("CustomDoki", PinksState.CustomDokiAmount or 100)
            PinksState.CustomDokiAmount = amount
            GiveCustomDoki(amount)
        end,
    })

    Pink:AddToggle("DateFreezeTime", {
        Text = "Date Freeze Time",
        Default = false,
        Callback = function(value)
            Fns.ApplyDateFreezeTime(value == true)
        end,
    })
    local Queen = Tabs.Boss:AddGroupbox({
        Side = "Right",
        Name = "Queen",
        IconName = "crown",
    })


    Queen:AddButton({
        Text = "Break Shield",
        Func = function()
            Fns.BreakQueenShieldNow(true)
        end,
    })

    Queen:AddToggle("QueenShieldAlwaysBroken", {
        Text = "Shield Never Up",
        Default = false,
        Callback = function(value)
            Fns.ApplyQueenShieldAlwaysBroken(value == true)
        end,
    })

    local FloweryBox = Tabs.Boss:AddGroupbox({
        Side = "Left",
        Name = "FLOWERY",
        IconName = "flower-2",
    })

    FloweryBox:AddButton({
        Text = "Skip Climber",
        Func = function()
            local ok = Fns.SkipFloweryClimbNow()
            pcall(function()
                Library:Notify({
                    Title = "Flowery",
                    Description = ok and "Climber section skipped." or "Climber section is not active.",
                    Time = 3,
                })
            end)
        end,
    })
end

do
    local Saves = Tabs.Settings:AddGroupbox({
        Side = "Left",
        Name = "Saves",
        IconName = "save",
    })

    Saves:AddInput("ConfigName", {
        Text = "Name",
        Default = "Default",
        Numeric = false,
        Finished = false,
        Placeholder = "Config name...",
        Callback = function(value)
            ConfigNameValue = tostring(value or "Default")
        end,
    })

    Saves:AddDropdown("ConfigFile", {
        Values = Fns.RefreshConfigList(),
        Default = "Default",
        Text = "File",
        Callback = function(option)
            ConfigNameValue = option
        end,
    })

    Saves:AddButton({
        Text = "Save",
        Func = function()
            local name = ConfigNameValue
            if not name or name == "" then name = "Default" end
            Fns.SaveConfig(name)
            Library:Notify({ Title = "Saved", Description = "Config '" .. name .. "' saved.", Time = 3 })
        end,
    })

    Saves:AddButton({
        Text = "Load",
        Func = function()
            local name = ConfigNameValue
            if not name or name == "" then name = "Default" end
            Fns.LoadConfig(name)
            Library:Notify({ Title = "Loaded", Description = "Config '" .. name .. "' loaded.", Time = 3 })
        end,
    })

    Saves:AddButton({
        Text = "Delete",
        Func = function()
            local name = ConfigNameValue
            if not name or name == "" or name == "Default" then return end
            Fns.DeleteConfig(name)
            Library:Notify({ Title = "Deleted", Description = "Config '" .. name .. "' deleted.", Time = 3 })
        end,
    })

    if ThemeManager then
        ThemeManager:SetLibrary(Library)
        ThemeManager:SetFolder("DeltaruneSW")
        ThemeManager:ApplyToTab(Tabs.Settings)
    end

    if SaveManager then
        SaveManager:SetLibrary(Library)
        SaveManager:IgnoreThemeSettings()
        SaveManager:SetFolder("DeltaruneSW")
        SaveManager:BuildConfigSection(Tabs.Settings)
        SaveManager:LoadAutoloadConfig()
    end
end

do
    local ButtonsBox = Tabs.Keybinds:AddGroupbox({
        Side = "Left",
        Name = "Buttons",
        IconName = "square",
    })

    local function AddKeybindButton(flag, text, shortLabel, action)
        ButtonsBox:AddToggle(flag, {
            Text = text,
            Default = false,
            Callback = function(value)
                if value == true then
                    Fns.CreateFloatingActionButton(flag, shortLabel, action)
                else
                    Fns.DestroyFloatingGui(FloatingActionGuis, flag)
                end
            end,
        })
    end

    AddKeybindButton("KB_TPMax", "TP Max", "TP Max", function()
        Fns.ForceTP(Fns.GetTensionMax())
    end)

    AddKeybindButton("KB_GiveTP", "Give TP", "Give TP", function()
        Fns.ForceTP(PinksState._TPAmount or 10)
    end)

    AddKeybindButton("KB_UnlockTP", "Unlock TP", "Unlock TP", function()
        Fns.UnlockTPNow()
    end)

    AddKeybindButton("KB_GiveHP", "Give HP", "Give HP", function()
        local amount = PinksState._HPAmount or 0
        if amount > 0 then
            Fns.GivePartyHP(amount)
        end
    end)

    AddKeybindButton("KB_HealParty", "Heal Party", "Heal", function()
        Fns.RescanCache("hard")
        Fns.ForcePartyHPFull()
    end)

    AddKeybindButton("KB_MaxMercy", "Max Mercy", "Max Mercy", function()
        Fns.MaxMercyNow()
    end)

    AddKeybindButton("KB_GiveMercy", "Give Mercy", "Give Mercy", function()
        Fns.GiveCustomMercy(PinksState.CustomMercyAmount or 100)
    end)

    AddKeybindButton("KB_InstantWin", "Instant Complete Fight", "Win", function()
        Fns.InstantWinNow()
    end)

    AddKeybindButton("KB_SkipTurn", "Skip Enemy's Turn", "Skip", function()
        Fns.SkipEnemyTurnNow()
    end)

    AddKeybindButton("KB_AssignSpell", "Assign Spell to Actor", "Spell", function()
        Fns.AddSpellToActor(PinksState.AssignActor or "Kris", PinksState.AssignSpell or "RudeBuster")
    end)

    AddKeybindButton("KB_AddAct", "Add Act to Actor", "Act", function()
        Fns.AddActToActor(PinksState.AssignActor or "Kris", PinksState.AssignAct or "Check")
    end)

    AddKeybindButton("KB_SpawnItem", "Spawn Item", "Spawn", function()
        local ok, msg = Fns.SpawnItemByName(PinksState.SpawnItemName)
        if not ok and msg == "full" then
            Library:Notify({ Title = "Full inventory!!", Description = "Your inventory is full.", Time = 3 })
        end
    end)

    AddKeybindButton("KB_ChangeActor", "Change Actor", "Change", function()
        Fns.ChangePartyActor(PinksState.PartyActorFrom, PinksState.PartyActorTo)
    end)

    AddKeybindButton("KB_ChangeStat", "Change Stat", "Stat", function()
        Fns.ChangeActorStat(PinksState.StatActor, PinksState.StatName, PinksState.StatAmount)
    end)

    AddKeybindButton("KB_AssignArmor", "Assign Armor To Actor", "Armor", function()
        Fns.AssignArmorToActor(PinksState.ArmorActor, PinksState.Armor1, PinksState.Armor2)
    end)

    AddKeybindButton("KB_AssignWeapon", "Assign Weapon", "Weapon", function()
        Fns.AssignWeaponToActor(PinksState.WeaponActor, PinksState.WeaponName)
    end)

    AddKeybindButton("KB_SwapTrack", "Swap Track", "Track", function()
        Fns.SwapMusicTrack(PinksState.MusicTrack)
    end)

    AddKeybindButton("KB_DefaultTrack", "Go to Default Track", "Default", function()
        Fns.GoDefaultMusicTrack()
    end)

    AddKeybindButton("KB_MaxScore", "Max Score", "Score", function()
        Fns.TennaMaxScoreNow()
    end)

    AddKeybindButton("KB_MaxDoki", "Max Doki Meter", "Max Doki", function()
        Fns.MaxDokiMeterNow()
    end)

    AddKeybindButton("KB_GiveDoki", "Give Doki", "Give Doki", function()
        GiveCustomDoki(PinksState.CustomDokiAmount or 100)
    end)

    AddKeybindButton("KB_GetJevilChaos", "Get Jevil Chaos", "Get Chaos", function()
        Fns.GetJevilChaosNow()
    end)

    AddKeybindButton("KB_BreakShield", "Break Queen Shield", "Break Shield", function()
        Fns.BreakQueenShieldNow(true)
    end)

    local TogglesBox = Tabs.Keybinds:AddGroupbox({
        Side = "Right",
        Name = "Toggles",
        IconName = "toggle-left",
    })

    local function AddKeybindToggle(flag, text, shortLabel, getState, setState)
        TogglesBox:AddToggle(flag, {
            Text = text,
            Default = false,
            Callback = function(value)
                if value == true then
                    Fns.CreateFloatingToggleButton(flag, shortLabel, getState, setState)
                else
                    Fns.DestroyFloatingGui(FloatingToggleGuis, flag)
                end
            end,
        })
    end

    AddKeybindToggle("KB_TPInfinite", "TP Infinite", "TP Inf", function()
        return PinksState.TPInfinite == true
    end, function(on)
        PinksState.TPInfinite = on == true
        Fns.SyncLibraryToggle("TPInfinite", on)
        if on then
            Fns.FindLiveBattleController(false)
            local battle = LiveBattleCache.Battle
            if type(battle) == "table" and type(rawget(battle, "Tension")) == "number" then
                rawset(battle, "Tension", Fns.GetTensionMax())
            end
        end
    end)

    AddKeybindToggle("KB_HPInfinite", "HP Infinite", "HP Inf", function()
        return PinksState.HPInfinite == true
    end, function(on)
        Fns.ApplyHPInfinite(on == true)
        Fns.SyncLibraryToggle("HPInfinite", on)
    end)

    AddKeybindToggle("KB_GodMode", "God-Mode", "God", function()
        return PinksState.GodMode == true
    end, function(on)
        PinksState.GodMode = on == true
        Fns.SyncLibraryToggle("GodMode", on)
        Fns.ApplyGodMode(PinksState.GodMode)
    end)

    AddKeybindToggle("KB_FreeSoul", "Free Soul", "Soul", function()
        return PinksState.FreeSoulToggle == true
    end, function(on)
        PinksState.FreeSoulToggle = on == true
        Fns.SyncLibraryToggle("FreeSoul", on)
        Fns.ApplyFreeSoul(PinksState.FreeSoulToggle)
    end)

    AddKeybindToggle("KB_AntiFail", "Anti-Fail Attack", "Anti-Fail", function()
        return PinksState.AntiFailAutoAttack == true
    end, function(on)
        Fns.ApplyAntiFailAutoAttack(on == true)
        Fns.SyncLibraryToggle("AntiFailAutoAttack", on)
    end)

    AddKeybindToggle("KB_DeleteAtk", "Delete Attacks", "Delete", function()
        return PinksState.DeleteStinky == true
    end, function(on)
        PinksState.DeleteStinky = on == true
        Fns.SyncLibraryToggle("DeleteStinky", on)
        if on then
            local battle = Fns.FindLiveBattleController(true)
            if battle then
                Fns.InstallDeleteAttackHooks(battle)
            end
            Fns.ClearBulletsNow()
        end
    end)

    AddKeybindToggle("KB_AutoDefend", "Auto Defend Party", "Defend", function()
        return PinksState.AutoDefendParty == true
    end, function(on)
        Fns.ApplyAutoDefendParty(on == true)
        Fns.SyncLibraryToggle("AutoDefendParty", on)
    end)

    AddKeybindToggle("KB_FreeSpells", "Free Spells", "Spells", function()
        return PinksState.FreeSpells == true
    end, function(on)
        PinksState.FreeSpells = on == true
        Fns.SyncLibraryToggle("FreeSpells", on)
        ApplyFreeSpells(PinksState.FreeSpells)
    end)

    AddKeybindToggle("KB_FreeActs", "Free Acts", "Acts", function()
        return PinksState.FreeActs == true
    end, function(on)
        PinksState.FreeActs = on == true
        Fns.SyncLibraryToggle("FreeActs", on)
        ApplyFreeActs(PinksState.FreeActs)
    end)

    AddKeybindToggle("KB_InfInv", "Infinite Inventory", "Inf Inv", function()
        return PinksState.InfiniteInventory == true
    end, function(on)
        Fns.ApplyInfiniteInventory(on == true)
        Fns.SyncLibraryToggle("InfiniteInventory", on)
    end)

    AddKeybindToggle("KB_DumbAtk", "Dumb Attacks", "Dumb", function()
        return PinksState.DumbAttack == true
    end, function(on)
        Fns.ApplyDumbAttack(on == true)
        Fns.SyncLibraryToggle("DumbAttack", on)
    end)

    AddKeybindToggle("KB_ShowEnemyHP", "Show Enemy HP", "Enemy HP", function()
        return PinksState.ShowEnemyHP == true
    end, function(on)
        Fns.ApplyShowEnemyHP(on == true)
        Fns.SyncLibraryToggle("ShowEnemyHP", on)
    end)

    AddKeybindToggle("KB_AutoSpam", "Auto Spam Big Shots", "Spam", function()
        return PinksState.AutoSpamShots == true
    end, function(on)
        PinksState.AutoSpamShots = on == true
        Fns.SyncLibraryToggle("AutoSpamShots", on)
        if on then
            YellowSpamNext = 0
            YellowSpamPulseUntil = 0
        end
    end)

    AddKeybindToggle("KB_NoCharge", "No Charge Big Shots", "No Charge", function()
        return PinksState.NoChargeShots == true
    end, function(on)
        PinksState.NoChargeShots = on == true
        Fns.SyncLibraryToggle("NoChargeShots", on)
        if on then
            YellowSpamNext = 0
            YellowSpamPulseUntil = 0
        end
    end)

    AddKeybindToggle("KB_SusieAct", "Super Charge Susie's Act", "Susie", function()
        return PinksState.SuperChargeSusieAct == true
    end, function(on)
        PinksState.SuperChargeSusieAct = on == true
        Fns.SyncLibraryToggle("SuperChargeSusieAct", on)
    end)

    AddKeybindToggle("KB_AntiSteal", "Anti-Steal Items", "Anti Steal", function()
        return PinksState.AntiStealItems == true
    end, function(on)
        Fns.ApplyAntiStealItems(on == true)
        Fns.SyncLibraryToggle("AntiStealItems", on)
    end)

    AddKeybindToggle("KB_GersonParry", "Auto Parry", "Parry", function()
        return PinksState.GersonShield == true
    end, function(on)
        PinksState.GersonShield = on == true
        Fns.SyncLibraryToggle("GersonShield", on)
        GersonSceneCache.Scene = nil
        if on then
            Fns.GetGersonSpearScene(true)
        end
    end)

    AddKeybindToggle("KB_PerfectTiming", "Perfect Timing", "Perfect", function()
        return PinksState.GersonRudeTiming == true
    end, function(on)
        PinksState.GersonRudeTiming = on == true
        Fns.SyncLibraryToggle("GersonRudeTiming", on)
    end)

    AddKeybindToggle("KB_AutoRude", "Auto Timing Rude Buster", "Auto Rude", function()
        return PinksState.GersonAutoTiming == true
    end, function(on)
        PinksState.GersonAutoTiming = on == true
        Fns.SyncLibraryToggle("GersonAutoTiming", on)
    end)

    AddKeybindToggle("KB_AutoDate", "Auto Date Answers", "Date", function()
        return PinksState.AutoDateAnswers == true
    end, function(on)
        PinksState.AutoDateAnswers = on == true
        Fns.SyncLibraryToggle("AutoDateAnswers", on)
        if on then
            PinkDateCache.State = nil
        end
    end)

    AddKeybindToggle("KB_FreezeDate", "Date Freeze Time", "Freeze", function()
        return PinksState.DateFreezeTime == true
    end, function(on)
        Fns.ApplyDateFreezeTime(on == true)
        Fns.SyncLibraryToggle("DateFreezeTime", on)
    end)

end
end
Fns.SetupUIAndKeybinds()
