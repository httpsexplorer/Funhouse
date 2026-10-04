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
    DateFreezeTime = false,
    AutoDateAnswers = false,
    DumbAttack = false,
    AntiFailAutoAttack = false,
    AssignActor = "Kris",
    AssignSpell = "RudeBuster",
    AssignAct = "Check",
    _TPAmount = 10,
    _ChangeTPAmount = 100,
    _HPAmount = 0,
    ArmorActor = "Kris",
    Armor1 = "",
    Armor2 = "",
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
    local throttle = 2
    if PinksState.HPInfinite or PinksState.GodMode then
        throttle = 1
    end
    if not force and now - Cache.LastScan < throttle then
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
                if IsTensionBar(v) then
                    table.insert(tensionBars, v)
                end
                if IsTensionController(v) then
                    table.insert(tensionTables, v)
                elseif type(rawget(v, "Tension")) == "number" and type(rawget(v, "TensionMax")) == "number" then
                    table.insert(tensionTables, v)
                end
                if rawget(v, "Invuln") ~= nil and rawget(v, "HP") ~= nil and rawget(v, "MaxHP") ~= nil then
                    table.insert(soulTables, v)
                end
                if IsPartyMemberHP(v) then
                    table.insert(hpTables, v)
                elseif type(rawget(v, "HP")) == "number" and type(rawget(v, "MaxHP")) == "number" then
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
    if #Cache.TensionTables == 0 and #Cache.TensionBars == 0 then
        RescanCache(true)
    else
        RescanCache(false)
    end
    pcall(function()
        ApplyTPValue(value)
    end)
end

local function UnlockTPNow()
    local max = GetTensionMax()
    RescanCache(true)
    pcall(function()
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
                        bar:Snap(rawget(v, "Tension") or 0)
                    end)
                end
            end
        end
    end)
end

local function ChangeTPNow(amount)
    amount = tonumber(amount)
    if amount == nil or amount < 0 then
        return
    end
    RescanCache(true)
    pcall(function()
        for _, v in pairs(Cache.TensionTables) do
            rawset(v, "TensionMax", amount)
            local cur = tonumber(rawget(v, "Tension")) or 0
            if cur > amount then
                rawset(v, "Tension", amount)
            end
            local bar = rawget(v, "TensionBar")
            if type(bar) == "table" then
                if type(bar.Snap) == "function" then
                    pcall(function()
                        bar:Snap(math.min(tonumber(rawget(v, "Tension")) or 0, amount))
                    end)
                else
                    local shown = math.min(tonumber(rawget(bar, "Apparent")) or cur, amount)
                    rawset(bar, "Apparent", shown)
                    rawset(bar, "Current", shown)
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

local function ForcePartyHPFull()
    pcall(function()
        for _, v in pairs(Cache.HPTables) do
            local maxhp = rawget(v, "MaxHP")
            if type(maxhp) == "number" and maxhp > 0 then
                rawset(v, "HP", maxhp)
                if rawget(v, "Down") == true then
                    rawset(v, "Down", false)
                end
                if rawget(v, "Swooned") == true then
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
    if not Spells or not ActsModule then
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
        Spells.Menu = function(actor, chapter, fight, roster)
            local result = originalMenu(actor, chapter, fight, roster)
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
    if not forceScan or not getgc then
        return nil
    end
    local now = os.clock()
    if now - (PinkDateCache.LastScan or 0) < 2.5 then
        return nil
    end
    PinkDateCache.LastScan = now

    local found = nil
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if IsLivePinkDateStateSafe(v) then
                found = v
                break
            end
        end
    end)
    PinkDateCache.State = found
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
    RescanCache(false)
    pcall(function()
        for _, battle in pairs(Cache.BattleTables) do
            local bullets = rawget(battle, "Bullets")
            if type(bullets) == "table" then
                for _, b in pairs(bullets) do
                    FlipBulletForce(b)
                end
            end
            local waves = rawget(battle, "Waves")
            if type(waves) == "table" then
                for _, w in pairs(waves) do
                    if type(w) == "table" then
                        local wb = rawget(w, "Bullets")
                        if type(wb) == "table" then
                            for _, b in pairs(wb) do
                                FlipBulletForce(b)
                            end
                        end
                    end
                end
            end
        end
    end)
    local now = os.clock()
    if getgc and (now - (DumbAttackCache.LastGcScan or 0) >= 0.75) then
        DumbAttackCache.LastGcScan = now
        pcall(function()
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" and rawget(v, "X") ~= nil and rawget(v, "Y") ~= nil then
                    local vx = rawget(v, "VX")
                    local vy = rawget(v, "VY")
                    if (type(vx) == "number" or type(vy) == "number") and rawget(v, "Harmful") ~= false then
                        FlipBulletForce(v)
                    end
                end
            end
        end)
    end
end

local function ApplyDumbAttack(on)
    PinksState.DumbAttack = on == true
    if on then
        RescanCache(true)
        DumbAttackCache.LastGcScan = 0
    end
end

local FightAttackCache = {
    Controller = nil,
    LastScan = 0,
}

local function AntiFailAutoAttackStep()
    if not PinksState.AntiFailAutoAttack then
        return
    end
    local now = os.clock()
    if not FightAttackCache.Controller or (now - FightAttackCache.LastScan > 2) then
        FightAttackCache.LastScan = now
        pcall(function()
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" and rawget(v, "State") == "Fight" and type(rawget(v, "AttackRows")) == "table" then
                    FightAttackCache.Controller = v
                    break
                end
            end
        end)
    end
    local ctrl = FightAttackCache.Controller
    if not ctrl then
        return
    end
    if rawget(ctrl, "State") ~= "Fight" then
        FightAttackCache.Controller = nil
        return
    end
    local boltFrame = rawget(ctrl, "BoltFrame")
    local rows = rawget(ctrl, "AttackRows")
    if type(boltFrame) ~= "number" or type(rows) ~= "table" then
        return
    end
    for _, row in pairs(rows) do
        if type(row) == "table" and rawget(row, "Resolved") ~= true then
            local target = rawget(row, "TargetFrame")
            if type(target) == "number" then
                pcall(function()
                    ctrl:ResolveRow(row, false, 0)
                    if type(rawget(ctrl, "SpawnBurst")) == "function" then
                        ctrl:SpawnBurst(row, 0)
                    end
                end)
            end
        end
    end
end

local function ApplyAntiFailAutoAttack(on)
    PinksState.AntiFailAutoAttack = on == true
    if on then
        FightAttackCache.Controller = nil
        FightAttackCache.LastScan = 0
    end
end

local function IsAutoDateCandidate(state)
    if type(state) ~= "table" then
        return false
    end
    if rawget(state, "Done") == true then
        return false
    end
    if type(rawget(state, "DateTimeLeft")) ~= "number" or type(rawget(state, "DateTimeLeftMax")) ~= "number" then
        return false
    end
    if rawget(state, "Con") ~= 2 then
        return false
    end
    if type(rawget(state, "QuestionCount")) ~= "number" then
        return false
    end
    if type(rawget(state, "ChoiceText")) ~= "table" or type(rawget(state, "ChoiceIsCorrect")) ~= "table" then
        return false
    end
    if type(rawget(state, "BoxCount")) ~= "number" or type(rawget(state, "DrawBoxSelected")) ~= "number" or type(rawget(state, "DrawBoxCon")) ~= "number" then
        return false
    end
    local choices = rawget(state, "ChoiceText")
    local correct = rawget(state, "ChoiceIsCorrect")
    local hasChoice = false
    for index, value in pairs(choices) do
        if type(index) == "number" and type(value) == "string" and value ~= "" and correct[index] ~= nil then
            hasChoice = true
            break
        end
    end
    return hasChoice
end

local function FindCurrentAutoDateState()
    local cached = PinkDateCache.State
    if cached and IsAutoDateCandidate(cached) and (tonumber(rawget(cached, "DateTimeLeft")) or 0) > 0 then
        local now = os.clock()
        if now - (PinkDateCache.LastScan or 0) < 0.5 then
            return cached
        end
    end
    if not getgc then
        return nil
    end
    local bestState = nil
    local bestTime = -math.huge
    local bestQuestion = -math.huge
    pcall(function()
        for _, state in pairs(getgc(true)) do
            if IsAutoDateCandidate(state) then
                local timeLeft = tonumber(rawget(state, "DateTimeLeft")) or -math.huge
                local question = tonumber(rawget(state, "QuestionCount")) or -math.huge
                if timeLeft > 0 and (timeLeft > bestTime or (timeLeft == bestTime and question > bestQuestion)) then
                    bestState = state
                    bestTime = timeLeft
                    bestQuestion = question
                end
            end
        end
    end)
    PinkDateCache.LastScan = os.clock()
    return bestState
end

local function FindBestCorrectSlot(state)
    local choiceTable = rawget(state, "ChoiceIsCorrect")
    local choiceText = rawget(state, "ChoiceText")
    if type(choiceTable) ~= "table" or type(choiceText) ~= "table" then
        return nil
    end
    local candidates = {}
    for idx, val in pairs(choiceTable) do
        local slot = tonumber(idx)
        local textValue = choiceText[idx]
        local correct = val == true or val == 1 or (type(val) == "number" and val >= 1)
        if slot ~= nil and correct and type(textValue) == "string" and textValue ~= "" then
            table.insert(candidates, { slot, type(val) == "number" and val or 1 })
        end
    end
    table.sort(candidates, function(a, b)
        if a[2] ~= b[2] then
            return a[2] > b[2]
        end
        return a[1] < b[1]
    end)
    if candidates[1] then
        return candidates[1][1], candidates[1][2]
    end
    return nil
end

local function AutoDateAnswersStep()
    if not PinksState.AutoDateAnswers then
        return
    end
    local now = os.clock()
    local state = FindCurrentAutoDateState()
    if state ~= PinkDateCache.State then
        PinkDateCache.State = state
        PinkDateCache.LastScan = now
        PinkDateCache.LastQuestion = nil
        PinkDateCache.AnsweredForQ = nil
    end
    if not state then
        PinkDateCache.LastScan = now
        return
    end
    PinkDateCache.LastScan = now
    local q = rawget(state, "QuestionCount")
    if q ~= nil and PinkDateCache.LastQuestion ~= nil and PinkDateCache.LastQuestion ~= q then
        PinkDateCache.AnsweredForQ = nil
    end
    PinkDateCache.LastQuestion = q
    local already = rawget(state, "ChoiceSelected")
    if type(already) == "number" and already > -1 then
        PinkDateCache.AnsweredForQ = q
        return
    end
    if PinkDateCache.AnsweredForQ == q and q ~= nil then
        return
    end
    local bestIdx = FindBestCorrectSlot(state)
    if bestIdx == nil then
        return
    end
    local boxSelected = rawget(state, "DrawBoxSelected")
    local drawCon = rawget(state, "DrawBoxCon")
    if boxSelected == bestIdx and drawCon == 2 then
        return
    end
    local ok = pcall(function()
        rawset(state, "DrawBoxSelected", bestIdx)
        rawset(state, "OffsetTimer", 0)
        rawset(state, "DrawBoxCon", 2)
    end)
    if ok then
        PinkDateCache.AnsweredForQ = q
    end
end

local function ApplyAutoDateAnswers(on)
    PinksState.AutoDateAnswers = on == true
    if on then
        PinkDateCache.State = nil
        PinkDateCache.LastScan = 0
        PinkDateCache.LastQuestion = nil
        PinkDateCache.AnsweredForQ = nil
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

local GenericAccumulator = 0
local DateAccumulator = 0
local AttackAccumulator = 0
local DateAnswerAccumulator = 0
local AutoAttackAccumulator = 0

RunService.Heartbeat:Connect(function(dt)
    local needTP = PinksState.TPInfinite
    local needHP = PinksState.HPInfinite
    local needGod = PinksState.GodMode
    local needClear = PinksState.DeleteStinky
    local needFreeSoul = PinksState.FreeSoulToggle
    local needVisual = PinksState.VisualHitbox

    if needTP or needHP or needGod or needClear or needFreeSoul or needVisual then
        GenericAccumulator += dt
        local tickRate = (needTP or needHP or needGod) and 0.1 or 0.25
        if GenericAccumulator >= tickRate then
            GenericAccumulator = 0

            if needHP or needGod or needClear or needVisual or needFreeSoul then
                RescanCache(false)
            elseif needTP and #Cache.TensionTables == 0 and #Cache.TensionBars == 0 then
                RescanCache(true)
            end

            pcall(function()
                if needTP then
                    ApplyTPValue(GetTensionMax())
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
                    ForcePartyHPFull()
                elseif needHP then
                    ForcePartyHPFull()
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

                if needVisual then
                    SetVisualHitboxes(true)
                end
            end)
        end
    else
        GenericAccumulator = 0
    end

    if PinksState.DateFreezeTime then
        DateAccumulator += dt
        if DateAccumulator >= 0.15 then
            DateAccumulator = 0
            DateFreezeTimeStep()
        end
    else
        DateAccumulator = 0
    end

    if PinksState.DumbAttack then
        AttackAccumulator = (AttackAccumulator or 0) + dt
        if AttackAccumulator >= 0.1 then
            AttackAccumulator = 0
            DumbAttackStep()
        end
    else
        AttackAccumulator = 0
    end

    if PinksState.AntiFailAutoAttack then
        AutoAttackAccumulator = (AutoAttackAccumulator or 0) + dt
        if AutoAttackAccumulator >= 0.15 then
            AutoAttackAccumulator = 0
            AntiFailAutoAttackStep()
        end
    else
        AutoAttackAccumulator = 0
    end

    if PinksState.AutoDateAnswers then
        DateAnswerAccumulator = (DateAnswerAccumulator or 0) + dt
        if DateAnswerAccumulator >= 0.2 then
            DateAnswerAccumulator = 0
            AutoDateAnswersStep()
        end
    else
        DateAnswerAccumulator = 0
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

local function SafeCreate(callback, title)
    local ok, err = pcall(callback)
    if not ok then
        warn("[WindUI SafeCreate]", title, err)
    end
    return ok
end

local Window = WindUI:CreateWindow({
    NewElements = true,
    Title = "Deltarune Fight | SW",
    Icon = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/Icon.png",
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

pcall(function()
    Window:Tag({
        Title = "2.2.8",
        Icon = "wrench",
        Color = Orange,
        Border = true,
    })
end)

local MainSection = Window:Section({
    Title = "Main",
    Opened = true,
})

local FightSection = Window:Section({
    Title = "Fight",
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

    local About = Tab:Section({
        Title = "About",
        Opened = true,
    })

    About:Paragraph({
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
        Title = "Developers",
        Desc = "Hs (Https), Gh (GourdyHalloway), Nc (Nexocat).",
    })
end, "Home")

SafeCreate(function()
    local Tab = FightSection:Tab({
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
                RescanCache(true)
                pcall(function()
                    ApplyTPValue(GetTensionMax())
                end)
            end
        end,
    })

    General:Space()

    General:Button({
        Title = "TP Max",
        Icon = "zap",
        Callback = function()
            RescanCache(true)
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
            RescanCache(true)
            ForceTP(PinksState._TPAmount or 10)
        end,
    })

    General:Space()

    General:Button({
        Title = "Unlock TP",
        Desc = "Restores full TP max (e.g. Pink date locks it low)",
        Icon = "unlock",
        Callback = function()
            UnlockTPNow()
        end,
    })

    General:Space()

    General:Input({
        Title = "Change TP Amount",
        Placeholder = "e.g. 1000...",
        Value = "",
        Flag = "ChangeTPAmount",
        Callback = function(value)
            PinksState._ChangeTPAmount = tonumber(value) or 100
        end,
    })

    General:Space()

    General:Button({
        Title = "Change TP",
        Desc = "Sets TensionMax and Tension to the amount above",
        Icon = "gauge",
        Callback = function()
            ChangeTPNow(PinksState._ChangeTPAmount or 100)
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
                RescanCache(true)
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
            RescanCache(true)
            pcall(function()
                for _, v in pairs(Cache.HPTables) do
                    if type(rawget(v, "HP")) == "number" and type(rawget(v, "MaxHP")) == "number" then
                        local nhp = math.min(v.HP + amount, v.MaxHP)
                        rawset(v, "HP", nhp)
                        if nhp > 0 then
                            if rawget(v, "Down") == true then
                                rawset(v, "Down", false)
                            end
                            if rawget(v, "Swooned") == true then
                                rawset(v, "Swooned", false)
                            end
                        end
                    end
                end
            end)
        end,
    })

    General:Space()

    General:Button({
        Title = "Heal Party",
        Icon = "heart-pulse",
        Color = Green,
        Callback = function()
            RescanCache(true)
            ForcePartyHPFull()
        end,
    })

    General:Space()

    General:Toggle({
        Title = "God-Mode",
        Desc = "It gives you God-Mode and you cannot receive damage, but you do not receive TP when you Touch an attack",
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

    General:Toggle({
        Title = "Free Soul",
        Desc = "You can leave the fight box and go wherever you want, but sometimes it can glitch when you're in modes like YellowMode",
        Value = false,
        Flag = "FreeSoul_v3",
        Callback = function(value)
            PinksState.FreeSoulToggle = value == true
            ApplyFreeSoul(PinksState.FreeSoulToggle)
        end,
    })

    Tab:Divider()

    local Fight = Tab:Section({
        Title = "Fight",
        Opened = true,
    })

    Fight:Toggle({
        Title = "Anti-Fail Attack",
        Desc = "The attack will be performed automatically, perfectly and without failing anywhere",
        Value = false,
        Flag = "AntiFailAutoAttack_v1",
        Callback = function(value)
            ApplyAntiFailAutoAttack(value == true)
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
        Title = "Delete Stinky Attacks",
        Desc = "It eliminates all enemy attacks, but sometimes it may not work on some enemies",
        Value = false,
        Flag = "DeleteStinkyAttacks",
        Callback = function(value)
            PinksState.DeleteStinky = value == true
            if PinksState.DeleteStinky then
                RescanCache(true)
                ClearBulletsNow()
            end
        end,
    })

    Fight:Space()

    Fight:Button({
        Title = "Skip Enemy's Turn",
        Desc = "I think this explains itself",
        Icon = "skip-forward",
        Callback = function()
            SkipEnemyTurnNow()
        end,
    })

    Fight:Space()

    Fight:Toggle({
        Title = "Visual Hitbox",
        Desc = "View the hitboxes of enemy attacks",
        Value = false,
        Flag = "VisualHitbox",
        Callback = function(value)
            PinksState.VisualHitbox = value == true
            SetVisualHitboxes(PinksState.VisualHitbox)
        end,
    })

    local Spells = Tab:Section({
        Title = "Spells / Acts",
        Opened = true,
    })

    Spells:Toggle({
        Title = "Snowgrave",
        Desc = "It lets you use Snowgrave only with Noelle",
        Value = false,
        Flag = "ProceedSnowgrave_v2",
        Callback = function(value)
            PinksState.ProceedSnowgrave = value == true
            ApplyProceedSnowgrave(PinksState.ProceedSnowgrave)
        end,
    })

    Spells:Space()

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

    Spells:Space()

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
            local actor = PinksState.AssignActor or "Kris"
            local spell = PinksState.AssignSpell or "RudeBuster"
            AddSpellToActor(actor, spell)
        end,
    })

    Spells:Space()

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
        Title = "Refresh Acts",
        Icon = "refresh-cw",
        Callback = function()
            RefreshActDropdown(nil)
        end,
    })

    Spells:Space()

    Spells:Button({
        Title = "Add Act to Actor",
        Icon = "plus",
        Color = Green,
        Callback = function()
            local actor = PinksState.AssignActor or "Kris"
            local act = PinksState.AssignAct or "Check"
            AddActToActor(actor, act)
        end,
    })

    local Group = Tab:Section({
        Title = "Group / Inventory / Stats",
        Opened = true,
    })

    Group:Dropdown({
        Title = "Actors",
        Values = GetHeroKeyOptions(),
        Value = PinksState.PartyActorFrom or "Kris",
        SearchBarEnabled = true,
        Flag = "PartyActorFrom_v1",
        Callback = function(option)
            PinksState.PartyActorFrom = option
        end,
    })

    Group:Space()

    Group:Dropdown({
        Title = "Actor to Change",
        Values = GetHeroKeyOptions(),
        Value = PinksState.PartyActorTo or "Susie",
        SearchBarEnabled = true,
        Flag = "PartyActorTo_v1",
        Callback = function(option)
            PinksState.PartyActorTo = option
        end,
    })

    Group:Space()

    Group:Button({
        Title = "Change Actor",
        Icon = "user-round-cog",
        Color = Green,
        Callback = function()
            ChangePartyActor(PinksState.PartyActorFrom, PinksState.PartyActorTo)
        end,
    })

    Group:Space()

    Group:Dropdown({
        Title = "Spawn Item",
        Values = GetItemNameOptions(),
        Value = PinksState.SpawnItemName or "Dark Candy",
        SearchBarEnabled = true,
        Flag = "SpawnItemName_v1",
        Callback = function(option)
            PinksState.SpawnItemName = option
        end,
    })

    Group:Space()

    Group:Toggle({
        Title = "Infinite Inventory",
        Value = false,
        Flag = "InfiniteInventory_v1",
        Callback = function(value)
            ApplyInfiniteInventory(value == true)
        end,
    })

    Group:Space()

    Group:Button({
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

    Group:Space()

    Group:Dropdown({
        Title = "Actors",
        Values = GetHeroKeyOptions(),
        Value = PinksState.StatActor or "Kris",
        SearchBarEnabled = true,
        Flag = "StatActor_v1",
        Callback = function(option)
            PinksState.StatActor = option
        end,
    })

    Group:Space()

    Group:Dropdown({
        Title = "Stats",
        Values = STAT_KEYS,
        Value = PinksState.StatName or "Attack",
        Flag = "StatName_v1",
        Callback = function(option)
            PinksState.StatName = option
        end,
    })

    Group:Space()

    Group:Input({
        Title = "Amount",
        Placeholder = "Amount...",
        Value = tostring(PinksState.StatAmount or 999),
        Flag = "StatAmount_v1",
        Callback = function(value)
            PinksState.StatAmount = tonumber(value) or 0
        end,
    })

    Group:Space()

    Group:Button({
        Title = "Change Stat",
        Icon = "chart-no-axes-combined",
        Color = Green,
        Callback = function()
            ChangeActorStat(PinksState.StatActor, PinksState.StatName, PinksState.StatAmount)
        end,
    })

    Group:Space()

    Group:Dropdown({
        Title = "Actor",
        Values = GetHeroKeyOptions(),
        Value = PinksState.ArmorActor or "Kris",
        SearchBarEnabled = true,
        Flag = "ArmorActor_v1",
        Callback = function(option)
            PinksState.ArmorActor = option
        end,
    })

    Group:Space()

    Group:Dropdown({
        Title = "Armor 1",
        Values = GetArmorOptions(),
        Value = "None",
        SearchBarEnabled = true,
        Flag = "Armor1_v1",
        Callback = function(option)
            PinksState.Armor1 = option
        end,
    })

    Group:Space()

    Group:Dropdown({
        Title = "Armor 2",
        Values = GetArmorOptions(),
        Value = "None",
        SearchBarEnabled = true,
        Flag = "Armor2_v1",
        Callback = function(option)
            PinksState.Armor2 = option
        end,
    })

    Group:Space()

    Group:Button({
        Title = "Assign To Actor",
        Icon = "shield",
        Color = Green,
        Callback = function()
            AssignArmorToActor(PinksState.ArmorActor, PinksState.Armor1, PinksState.Armor2)
        end,
    })

    pcall(function()
        Tab:Select()
    end)
end, "Automatic")

SafeCreate(function()
    local Tab = FightSection:Tab({
        Title = "Boss n Mini",
        Icon = "swords",
    })

    local GeneralBoss = Tab:Section({
        Title = "General",
        Opened = true,
    })

    GeneralBoss:Toggle({
        Title = "Dumb Attacks",
        Desc = "They've really gone mad! (Maybe this won't work with some bosses!!)",
        Value = false,
        Flag = "DumbAttack_v1",
        Callback = function(value)
            ApplyDumbAttack(value == true)
        end,
    })

    local Gerson = Tab:Section({
        Title = "Gerson",
        Opened = true,
    })

    Gerson:Toggle({
        Title = "Auto Parry",
        Desc = "It helps you parry Gerson's spears, and well, it's self-explanatory like the others",
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
        Desc = "It explains itself.",
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

    Pink:Button({
        Title = "Max Doki Meter",
        Icon = "heart",
        Color = Green,
        Callback = function()
            MaxDokiMeterNow()
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

    Pink:Space()

    Pink:Toggle({
        Title = "Auto-Date Answers",
        Desc = "It will answer your questions when you're on your date with Pink, but it's not 100% accurate, so it might not answer correctly",
        Value = false,
        Flag = "AutoDateAnswers_v3",
        Callback = function(value)
            ApplyAutoDateAnswers(value == true)
        end,
    })

    pcall(function()
        Tab:Select()
    end)
end, "Boss n Mini")

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
        Title = "Change Color UI",
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

    pcall(function()
        Tab:Select()
    end)
end, "Settings")

