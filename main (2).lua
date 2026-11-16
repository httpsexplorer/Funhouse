local B = _G.VSWbypass or shared.VSWbypass
if type(B) ~= "table" or type(B.get) ~= "function" or type(B.set) ~= "function" then
    error("VSWbypass must load first")
end
local Pl = game:GetService("Players")
local Ui = game:GetService("UserInputService")
local Rs = game:GetService("RunService")
local Tr = game:GetService("ReplicatedStorage")
local Lp = Pl.LocalPlayer
local Co = Tr:FindFirstChild("Core")
local Da = Co and Co:FindFirstChild("Data")
local St = {
    tpInf = false, hpInf = false, god = false, freeSoul = false, delAtk = false,
    mercyBoss = "(none)", jevilChoice = "Damage Enemy (Spade)",
    gShield = false, gRude = false, gAuto = false, freeActs = false, snow = false,
    freeSpells = false, dateFrz = false, dumb = false, antiFail = false,
    autoSpam = false, noCharge = false, susieAct = false, autoDate = false,
    dokiAmt = 100, mercyAmt = 100, actor = "Kris", spell = "RudeBuster", act = "Check",
    tpAmt = 10, hpAmt = 0, armActor = "Kris", arm1 = "", arm2 = "",
    autoDef = false, showHP = false, antiSteal = false, wepActor = "Kris", wep = "",
    track = "", defTrack = nil, uiCol = "Dark", fromActor = "Kris", toActor = "Susie",
    item = "Dark Candy", infInv = false, stActor = "Kris", stName = "Attack", stAmt = 999,
}
local Ca = { TB = {}, TT = {}, ST = {}, HT = {}, BT = {}, TS = 0 }
local LBC = { Battle = nil, LastScan = 0 }
local BL = { Active = nil, Sig = nil, LastTerm = nil, LastScan = 0, LastFrame = 0 }
local QS = { Ctrl = nil, En = nil, Sh = nil, LS = 0 }
local GS = { Sc = nil, LF = 0 }
local PD = { St = nil, LS = 0 }
local FA = { Ctrl = nil, LS = 0 }
local YN = 0
local YP = 0
local Acc = { g = 0, cl = 0, st = 0, hp2 = 0, dt = 0, atk = 0, af = 0, yl = 0, tp2 = 0, hp3 = 0, ad = 0, as = 0 }
local InvSnap = nil
local h = {}
local function _resetCaches(term)
    Ca.TB = {}
    Ca.TT = {}
    Ca.ST = {}
    Ca.HT = {}
    Ca.BT = {}
    Ca.TS = 0
    if term then
        LBC.Battle = nil
        LBC.LastScan = 0
    end
end
h.TpMax = function()
    local m = 100
    pcall(function()
        if not Da then return end
        local ok, cfg = pcall(require, Da.Config)
        if ok and type(cfg) == "table" and type(cfg.Tension) == "table" and type(cfg.Tension.Max) == "number" then
            m = cfg.Tension.Max
        end
    end)
    return m
end
h.IsTermState = function(s)
    s = string.lower(tostring(s or ""))
    return s == "victory" or s == "gameover" or s == "game over" or s == "game_over" or s == "game-over"
        or s == "defeat" or s == "defeated" or s == "loss" or s == "lost" or s == "dead" or s == "ended" or s == "finished"
end
h.IsTermCtrl = function(c)
    if type(c) ~= "table" then return true end
    local function ft(v) return v == true or v == 1 or v == "1" end
    if h.IsTermState(rawget(c, "State")) or h.IsTermState(rawget(c, "Status")) then return true end
    if ft(rawget(c, "Victory")) or ft(rawget(c, "Finished")) or ft(rawget(c, "Done")) or ft(rawget(c, "GameOver")) or ft(rawget(c, "Left")) then return true end
    if tonumber(rawget(c, "Myfight")) == 7 then return true end
    for _, k in ipairs({ "Battle", "Fight", "FightState", "Ts", "Controller" }) do
        local n = rawget(c, k)
        if type(n) == "table" then
            if h.IsTermState(rawget(n, "State")) or h.IsTermState(rawget(n, "Status")) then return true end
            if ft(rawget(n, "Victory")) or ft(rawget(n, "Finished")) or ft(rawget(n, "Done")) or ft(rawget(n, "GameOver")) or ft(rawget(n, "Left")) then return true end
            if tonumber(rawget(n, "Myfight")) == 7 then return true end
        end
    end
    return false
end
h.BtlSig = function(b)
    if type(b) ~= "table" then return "" end
    local f = rawget(b, "Fight")
    local nb = rawget(b, "Battle")
    local r = rawget(b, "Roster")
    local m = type(r) == "table" and rawget(r, "Members") or nil
    local fs = rawget(b, "FightState")
    local sc = rawget(b, "Scene")
    local lb = ""
    pcall(function()
        local cands = { f, fs, nb, b }
        for _, c in pairs(cands) do
            if type(c) == "table" then
                local l = rawget(c, "Wall") or rawget(c, "Id") or rawget(c, "FightName") or rawget(c, "Name")
                if type(l) == "string" and l ~= "" then lb = l break end
            end
        end
    end)
    local sid = rawget(b, "EncounterId") or rawget(b, "FightId") or rawget(b, "FightName")
    if sid == nil and type(f) == "table" then sid = rawget(f, "Id") or rawget(f, "Wall") or rawget(f, "Name") end
    return table.concat({
        tostring(f), tostring(nb), tostring(fs), tostring(sc), tostring(r), tostring(m),
        tostring(sid), tostring(lb), tostring(rawget(b, "StartEnemyTurn")), tostring(rawget(b, "State"))
    }, "|")
end
h.IsTBar = function(v)
    return type(v) == "table" and type(rawget(v, "Apparent")) == "number" and type(rawget(v, "Current")) == "number"
        and (type(rawget(v, "Snap")) == "function" or type(rawget(v, "Chase")) == "function" or rawget(v, "Root") ~= nil)
end
h.IsTCtrl = function(v)
    if type(v) ~= "table" then return false end
    if type(rawget(v, "Tension")) ~= "number" or type(rawget(v, "TensionMax")) ~= "number" then return false end
    if rawget(v, "TensionBar") ~= nil then return true end
    if type(rawget(v, "AddTension")) == "function" or type(rawget(v, "ApplyTension")) == "function" then return true end
    if type(rawget(v, "StepTensionBar")) == "function" then return true end
    return false
end
h.IsPHP = function(v)
    if type(v) ~= "table" then return false end
    if type(rawget(v, "HP")) ~= "number" or type(rawget(v, "MaxHP")) ~= "number" then return false end
    if rawget(v, "Down") ~= nil or rawget(v, "Swooned") ~= nil then return true end
    if rawget(v, "Key") ~= nil or rawget(v, "Slot") ~= nil then return true end
    if type(rawget(v, "Heal")) == "function" then return true end
    return false
end
h.Scan = function(force)
    local now = os.clock()
    local th = 10
    local has = #Ca.TT > 0 or #Ca.HT > 0 or #Ca.ST > 0 or #Ca.BT > 0
    if force == "hard" then Ca.TS = 0
    elseif force and has and (now - Ca.TS < 4) then return
    elseif not force and now - Ca.TS < th then return end
    Ca.TS = now
    local tb, tt, st, ht, bt = {}, {}, {}, {}, {}
    pcall(function()
        if not B.hasGC then return end
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                if h.IsTBar(v) then table.insert(tb, v) end
                if h.IsTCtrl(v) then table.insert(tt, v)
                elseif type(rawget(v, "Tension")) == "number" and type(rawget(v, "TensionMax")) == "number" then table.insert(tt, v) end
                if rawget(v, "Invuln") ~= nil and type(rawget(v, "HP")) == "number" and type(rawget(v, "MaxHP")) == "number" then table.insert(st, v) end
                if h.IsPHP(v) then table.insert(ht, v) end
                if type(rawget(v, "ClearBullets")) == "function" or type(rawget(v, "Bullets")) == "table" then table.insert(bt, v) end
            end
        end
    end)
    Ca.TB = tb
    Ca.TT = tt
    Ca.ST = st
    Ca.HT = ht
    Ca.BT = bt
end
h.FindBattle = function(force, forceRescan)
    local now = os.clock()
    local cached = LBC.Battle
    local cachedOk = type(cached) == "table" and not h.IsTermCtrl(cached) and type(rawget(cached, "Roster")) == "table"
    local active = BL.Active
    local activeOk = type(active) == "table" and not h.IsTermCtrl(active) and type(rawget(active, "Roster")) == "table"
        and BL.Sig == h.BtlSig(active)
    if activeOk and LBC.Battle == active and not forceRescan then
        LBC.LastScan = now
        return active
    end
    if cachedOk and not force and (now - (LBC.LastScan or 0)) < 3 then return cached end
    local found, best = nil, -1
    local okScan = false
    local callOk = pcall(function()
        if not B.hasGC then return end
        local objs = getgc(true)
        if type(objs) ~= "table" then return end
        okScan = true
        for _, c in pairs(objs) do
            if type(c) == "table" and not h.IsTermCtrl(c) then
                local r = rawget(c, "Roster")
                local m = type(r) == "table" and rawget(r, "Members") or nil
                if type(r) == "table" and type(m) == "table" and #m > 0 then
                    local sc = 4
                    if type(rawget(c, "Tension")) == "number" then sc = sc + 2 end
                    if type(rawget(c, "TensionMax")) == "number" then sc = sc + 1 end
                    if type(rawget(c, "TensionBar")) == "table" then sc = sc + 1 end
                    if type(rawget(c, "StartEnemyTurn")) == "function" then sc = sc + 3 end
                    if type(c.EnemyList) == "function" then
                        sc = sc + 6
                        local okE, el = pcall(function() return c:EnemyList() end)
                        if okE and type(el) == "table" then
                            local live = 0
                            for _, e in pairs(el) do
                                if type(e) == "table" and rawget(e, "Alive") ~= false and rawget(e, "Gone") ~= true and rawget(e, "Absent") ~= true then live = live + 1 end
                            end
                            if live > 0 then sc = sc + 9 else sc = sc - 3 end
                        end
                    end
                    if type(rawget(c, "EnterVictory")) == "function" then sc = sc + 2 end
                    if type(rawget(c, "RefreshUi")) == "function" then sc = sc + 2 end
                    if type(rawget(c, "Step")) == "function" then sc = sc + 1 end
                    local sn = string.lower(tostring(rawget(c, "State") or ""))
                    if sn ~= "" then sc = sc + 2 end
                    if sn == "fight" then sc = sc + 5 end
                    if sn == "act" or sn == "action" or sn == "spell" or sn == "playerturn" or sn == "enemyturn" then sc = sc + 2 end
                    if type(rawget(c, "AttackRows")) == "table" and sn == "fight" then sc = sc + 3 end
                    if type(rawget(c, "CommitLocal")) == "function" then sc = sc + 2 end
                    local nb = rawget(c, "Battle")
                    if type(nb) == "table" then
                        sc = sc + 2
                        if type(rawget(nb, "ClearBullets")) == "function" then sc = sc + 2 end
                        if type(rawget(nb, "Bullets")) == "table" then sc = sc + 1 end
                        if rawget(nb, "Soul") ~= nil or type(rawget(nb, "Souls")) == "table" then sc = sc + 2 end
                        if rawget(nb, "SoulActive") ~= nil then sc = sc + 1 end
                    end
                    if c == cached and cachedOk and not force then sc = sc + 1 end
                    if sc > best then best = sc; found = c end
                end
            end
        end
    end)
    if type(found) == "table" then LBC.Battle = found
    elseif force and okScan and callOk then LBC.Battle = nil
    elseif not cachedOk then LBC.Battle = nil end
    LBC.LastScan = now
    return LBC.Battle
end
h.AdoptBattle = function(b)
    if type(b) ~= "table" or h.IsTermCtrl(b) then return false end
    if type(rawget(b, "Roster")) ~= "table" then return false end
    local sig = h.BtlSig(b)
    local ch = LBC.Battle ~= b or BL.Active ~= b or BL.Sig ~= sig
    if ch then _resetCaches(false) end
    LBC.Battle = b
    BL.Active = b
    BL.Sig = sig
    BL.LastTerm = nil
    if ch then pcall(h.RestoreHooks, b) end
    return true
end
h.RestoreHooks = function(b)
    if type(b) ~= "table" then return end
    h.Scan("hard")
    local maxTP = h.TpMax()
    if St.tpInf and type(rawget(b, "Tension")) == "number" then
        local tm = tonumber(rawget(b, "TensionMax")) or maxTP
        rawset(b, "Tension", math.min(maxTP, tm))
    end
    if St.god then pcall(h.ApplyGod, true, b) end
    if St.freeSoul then pcall(h.ApplyFreeSoul, true) end
    if St.delAtk then
        pcall(h.InstDelHook, b)
        pcall(h.NukeBullets)
    end
    if St.showHP then pcall(h.ApplyShowHP, true) end
    if St.autoDef then pcall(h.ApplyAutoDef, true) end
end
h.SoftRecover = function()
    LBC.Battle = nil
    LBC.LastScan = 0
    BL.Active = nil
    BL.Sig = nil
    BL.LastScan = 0
    BL.LastFrame = 0
    _resetCaches(true)
    GS.Sc = nil
    PD.St = nil
    FA.Ctrl = nil
    FA.LS = 0
    QS.Ctrl = nil
    QS.En = nil
    QS.Sh = nil
end
h.LifecycleTick = function()
    local now = os.clock()
    if now - BL.LastFrame < 0.25 then return end
    BL.LastFrame = now
    local cached = LBC.Battle
    if type(cached) == "table" and h.IsTermCtrl(cached) then
        if BL.Active ~= nil or cached ~= BL.LastTerm then
            h.SoftRecover()
            BL.LastTerm = cached
        end
        BL.LastScan = now - 2.6
        return
    end
    local active = BL.Active
    if type(active) == "table" then
        if h.IsTermCtrl(active) then
            h.SoftRecover()
            BL.LastTerm = active
            BL.LastScan = now - 2.6
            return
        end
        if type(rawget(active, "Roster")) == "table" then
            local sig = h.BtlSig(active)
            if LBC.Battle ~= active or sig ~= BL.Sig then
                _resetCaches(false)
                LBC.Battle = active
                BL.Active = active
                BL.Sig = sig
                h.RestoreHooks(active)
            end
            local every = (St.tpInf or St.hpInf) and 1.5 or 5
            if now - (BL.LastScan or 0) >= every then
                BL.LastScan = now
                local sc = h.FindBattle(true, true)
                if type(sc) == "table" and not h.IsTermCtrl(sc) then
                    if sc ~= active then pcall(h.AdoptBattle, sc) end
                else
                    LBC.Battle = active
                end
            end
            return
        end
        h.SoftRecover()
    end
    if now - BL.LastScan < 2.5 then return end
    BL.LastScan = now
    local b = h.FindBattle(true, true)
    if type(b) == "table" and not h.IsTermCtrl(b) then
        local sig = h.BtlSig(b)
        if BL.Active ~= b or BL.Sig ~= sig then
            _resetCaches(false)
            LBC.Battle = b
            BL.Active = b
            BL.Sig = sig
            h.RestoreHooks(b)
        end
        BL.LastTerm = nil
    else
        if BL.Active ~= nil then h.SoftRecover() end
    end
end
h.IsLocal = function(m)
    if type(m) ~= "table" then return false end
    local o = rawget(m, "Owner")
    if o == nil then return true end
    local lid = nil
    pcall(function()
        local Net = require(Tr.Core.System.Net)
        if type(Net) == "table" then
            if type(Net.LocalId) == "function" then lid = Net.LocalId()
            else lid = rawget(Net, "LocalId") end
            if type(Net.Solo) == "function" and Net.Solo() then lid = o end
        end
    end)
    if lid == nil then return true end
    return o == lid
end
h.ForEachSoul = function(b, fn)
    if type(b) ~= "table" or type(fn) ~= "function" then return end
    local bb = rawget(b, "Battle")
    if type(bb) == "table" then
        local s = rawget(bb, "Soul")
        if type(s) == "table" then fn(s) end
        local ss = rawget(bb, "Souls")
        if type(ss) == "table" then for _, x in pairs(ss) do if type(x) == "table" then fn(x) end end end
    end
end
h.ForceTP = function(amt)
    local max = h.TpMax()
    local v = math.clamp(tonumber(amt) or max, 0, max)
    pcall(function()
        local b = LBC.Battle
        if type(b) ~= "table" or h.IsTermCtrl(b) then b = h.FindBattle(true, true) end
        local function apply(c)
            if type(c) ~= "table" then return end
            local tm = tonumber(rawget(c, "TensionMax")) or max
            if tm < 1 then tm = max end
            local set = math.clamp(v, 0, math.max(tm, max))
            rawset(c, "Tension", set)
            local bar = rawget(c, "TensionBar")
            if type(bar) == "table" then
                if type(bar.Snap) == "function" then pcall(function() bar:Snap(set) end)
                else rawset(bar, "Apparent", set); rawset(bar, "Current", set) end
            end
            if type(c.StepTensionBar) == "function" then pcall(function() c:StepTensionBar() end) end
        end
        apply(b)
        if type(b) == "table" then apply(rawget(b, "Battle")) end
        if #Ca.TT == 0 and #Ca.TB == 0 then h.Scan(true) end
        for _, t in pairs(Ca.TT) do apply(t) end
        for _, t in pairs(Ca.TB) do
            if type(rawget(t, "Snap")) == "function" then pcall(function() t:Snap(v) end)
            else rawset(t, "Apparent", v); rawset(t, "Current", v) end
        end
    end)
end
h.ForceHPFull = function(bo)
    pcall(function()
        local b = type(bo) == "table" and bo or h.FindBattle(true, true)
        if type(b) == "table" then
            local r = rawget(b, "Roster")
            local m = type(r) == "table" and rawget(r, "Members") or nil
            if type(m) == "table" then
                for _, mem in ipairs(m) do
                    if type(mem) == "table" and h.IsLocal(mem) then
                        local mh = tonumber(rawget(mem, "MaxHP"))
                        if type(mh) == "number" and mh > 0 then
                            rawset(mem, "HP", mh)
                            rawset(mem, "Down", false)
                            rawset(mem, "Swooned", false)
                            if type(mem.Heal) == "function" then pcall(function() mem:Heal(mh) end) end
                        end
                    end
                end
            end
            h.ForEachSoul(b, function(s)
                local mh = tonumber(rawget(s, "MaxHP"))
                if type(mh) == "number" and mh > 0 then rawset(s, "HP", mh) end
            end)
            if type(rawget(b, "RefreshUi")) == "function" then pcall(function() b:RefreshUi() end) end
        end
        for _, v in pairs(Ca.HT) do
            local mh = rawget(v, "MaxHP")
            if type(mh) == "number" and mh > 0 then
                rawset(v, "HP", mh)
                rawset(v, "Down", false)
                if rawget(v, "Swooned") ~= nil then rawset(v, "Swooned", false) end
            end
        end
        for _, v in pairs(Ca.ST) do
            local mh = rawget(v, "MaxHP")
            if type(mh) == "number" and mh > 0 then rawset(v, "HP", mh) end
        end
    end)
end
h.GiveHP = function(amt)
    amt = tonumber(amt) or 0
    if amt == 0 then return end
    pcall(function()
        local b = LBC.Battle
        if type(b) ~= "table" then b = h.FindBattle(true, true) end
        if type(b) == "table" then
            local r = rawget(b, "Roster")
            local m = type(r) == "table" and rawget(r, "Members") or nil
            if type(m) == "table" then
                for _, mem in ipairs(m) do
                    if type(mem) == "table" and type(rawget(mem, "HP")) == "number" and h.IsLocal(mem) then
                        local mh = tonumber(rawget(mem, "MaxHP")) or 9999
                        local cur = tonumber(rawget(mem, "HP")) or 0
                        local nh = math.min(cur + amt, mh)
                        if amt < 0 then nh = math.max(0, cur + amt) end
                        rawset(mem, "HP", nh)
                        if nh > 0 then rawset(mem, "Down", false); rawset(mem, "Swooned", false) end
                        if type(mem.Heal) == "function" and amt > 0 then pcall(function() mem:Heal(amt) end) end
                    end
                end
            end
            if type(rawget(b, "RefreshUi")) == "function" then pcall(function() b:RefreshUi() end) end
        end
        if #Ca.HT == 0 then h.Scan("hard") end
        for _, v in pairs(Ca.HT) do
            if type(rawget(v, "HP")) == "number" and type(rawget(v, "MaxHP")) == "number" then
                local nh = math.min(v.HP + amt, v.MaxHP)
                rawset(v, "HP", nh)
                if nh > 0 then rawset(v, "Down", false); if rawget(v, "Swooned") ~= nil then rawset(v, "Swooned", false) end end
            end
        end
    end)
end
h.PatchSoulGod = function(s)
    if type(s) ~= "table" then return end
    if St.god then
        rawset(s, "Invuln", 999999)
        if type(rawget(s, "HP")) == "number" and type(rawget(s, "MaxHP")) == "number" then
            rawset(s, "HP", rawget(s, "MaxHP"))
        end
    end
end
h.PatchMemGod = function(m)
    if type(m) ~= "table" or not h.IsLocal(m) then return end
    if St.god then
        if rawget(m, "Down") == true or rawget(m, "Swooned") == true then
            rawset(m, "Down", false)
            rawset(m, "Swooned", false)
        end
        local mh = tonumber(rawget(m, "MaxHP"))
        if mh and mh > 0 then rawset(m, "HP", mh) end
    end
end
h.ApplyGod = function(on, bo)
    St.god = on == true
    if on then
        local b = type(bo) == "table" and bo or h.FindBattle(true, true)
        if type(b) == "table" then
            h.ForEachSoul(b, function(s) h.PatchSoulGod(s) end)
            local r = rawget(b, "Roster")
            local m = type(r) == "table" and rawget(r, "Members") or nil
            if type(m) == "table" then for _, mem in ipairs(m) do h.PatchMemGod(mem) end end
        end
    else
        local b = LBC.Battle
        if type(b) == "table" then
            h.ForEachSoul(b, function(s)
                if type(rawget(s, "Invuln")) == "number" and rawget(s, "Invuln") > 100 then rawset(s, "Invuln", -1) end
            end)
        end
    end
end
h.PatchFreeSoul = function(s)
    if type(s) ~= "table" then return end
    if B.get(s, "fspatched") ~= true then
        local oib = s.IsBlocked
        local oca = s.ClampToArea
        if type(oib) == "function" then
            B.set(s, "oib", oib)
            rawset(s, "IsBlocked", function(self, x, y)
                if St.freeSoul then return false end
                return oib(self, x, y)
            end)
        end
        if type(oca) == "function" then
            B.set(s, "oca", oca)
            rawset(s, "ClampToArea", function(self, ...)
                if St.freeSoul then return end
                return oca(self, ...)
            end)
        end
        B.set(s, "fspatched", true)
    end
    if St.freeSoul then
        rawset(s, "FreeRoam", true)
        rawset(s, "Locked", false)
        if rawget(s, "Frozen") ~= nil then rawset(s, "Frozen", false) end
        local sol = rawget(s, "Solids")
        if type(sol) == "table" then for k in pairs(sol) do sol[k] = nil end end
    else
        rawset(s, "FreeRoam", false)
        if rawget(s, "Locked") ~= nil then rawset(s, "Locked", false) end
        local oca = B.get(s, "oca")
        if type(oca) == "function" then pcall(function() oca(s) end)
        elseif type(s.ClampToArea) == "function" then pcall(function() s:ClampToArea() end) end
    end
end
h.ApplyFreeSoul = function(on)
    St.freeSoul = on == true
    if #Ca.ST == 0 then h.Scan("hard") end
    pcall(function()
        local cfg = nil
        if Da then local ok, c = pcall(require, Da.Config); if ok then cfg = c end end
        if type(cfg) == "table" and type(cfg.Soul) == "table" then
            if on then
                if B.get(cfg.Soul, "ocf") == nil then B.set(cfg.Soul, "ocf", cfg.Soul.ClampToBattleArea) end
                cfg.Soul.ClampToBattleArea = false
            else
                local o = B.get(cfg.Soul, "ocf")
                if o ~= nil then cfg.Soul.ClampToBattleArea = o else cfg.Soul.ClampToBattleArea = true end
            end
        end
    end)
    pcall(function()
        for _, s in pairs(Ca.ST) do h.PatchFreeSoul(s) end
    end)
    local b = LBC.Battle
    if type(b) == "table" then h.ForEachSoul(b, function(s) h.PatchFreeSoul(s) end) end
end
h.NukeBullets = function()
    local b = LBC.Battle
    if type(b) ~= "table" then b = h.FindBattle(false, false) end
    if type(b) ~= "table" then return end
    local bb = rawget(b, "Battle") or b
    pcall(function()
        if type(bb.ClearBullets) == "function" then bb:ClearBullets() end
        local bullets = rawget(bb, "Bullets")
        if type(bullets) == "table" then
            local keys = {}
            for k, bu in pairs(bullets) do
                table.insert(keys, k)
                if type(bu) == "table" then
                    rawset(bu, "Harmful", false)
                    rawset(bu, "Damage", 0)
                    rawset(bu, "Alive", false)
                    if type(bu.Destroy) == "function" then pcall(function() bu:Destroy() end) end
                end
            end
            for _, k in ipairs(keys) do bullets[k] = nil end
        end
    end)
end
h.InstDelHook = function(b)
    if type(b) ~= "table" then return end
    local bb = rawget(b, "Battle") or b
    if B.get(bb, "delhook") == true then return end
    B.set(bb, "delhook", true)
    local ost = bb.Step
    if type(ost) == "function" then
        rawset(bb, "Step", function(self, ...)
            local r = ost(self, ...)
            if St.delAtk then pcall(h.NukeBullets) end
            return r
        end)
    end
end
h.FlipBullet = function(bu)
    if type(bu) ~= "table" or rawget(bu, "Harmful") == false then return end
    local vx = rawget(bu, "VX")
    local vy = rawget(bu, "VY")
    if type(vx) == "number" then
        if B.get(bu, "ovx") == nil then B.set(bu, "ovx", vx) end
        rawset(bu, "VX", -B.get(bu, "ovx"))
    end
    if type(vy) == "number" then
        if B.get(bu, "ovy") == nil then B.set(bu, "ovy", vy) end
        rawset(bu, "VY", -B.get(bu, "ovy"))
    end
    local dir = rawget(bu, "Direction")
    if type(dir) == "number" then
        if B.get(bu, "odir") == nil then B.set(bu, "odir", dir) end
        rawset(bu, "Direction", B.get(bu, "odir") + math.pi)
    end
    local hs = rawget(bu, "Hspeed")
    if type(hs) == "number" then
        if B.get(bu, "ohs") == nil then B.set(bu, "ohs", hs) end
        rawset(bu, "Hspeed", -B.get(bu, "ohs"))
    end
    local vs = rawget(bu, "Vspeed")
    if type(vs) == "number" then
        if B.get(bu, "ovs") == nil then B.set(bu, "ovs", vs) end
        rawset(bu, "Vspeed", -B.get(bu, "ovs"))
    end
end
h.DumbStep = function()
    if not St.dumb then return end
    local b = LBC.Battle
    if type(b) ~= "table" then return end
    local bb = rawget(b, "Battle") or b
    pcall(function()
        local bullets = rawget(bb, "Bullets")
        if type(bullets) == "table" then for _, bu in pairs(bullets) do h.FlipBullet(bu) end end
    end)
end
h.GetEnemies = function(b)
    if type(b) ~= "table" or h.IsTermCtrl(b) then return {} end
    local res, seen = {}, {}
    local function add(e)
        if type(e) ~= "table" or seen[e] or rawget(e, "Alive") == false or rawget(e, "Gone") == true or rawget(e, "Absent") == true then return end
        local def = rawget(e, "Def")
        local has = rawget(e, "Myself") ~= nil or type(rawget(e, "Mercy")) == "number" or type(rawget(e, "MercyMax")) == "number"
            or type(rawget(e, "Maxmercy")) == "number" or type(rawget(e, "HP")) == "number" or type(rawget(e, "Shieldhp")) == "number"
        if has and (type(def) == "table" or rawget(e, "Myself") ~= nil or type(rawget(e, "Mercy")) == "number") then
            seen[e] = true
            res[#res + 1] = e
        end
    end
    pcall(function()
        if type(b.EnemyList) == "function" then
            local el = b:EnemyList()
            if type(el) == "table" then for _, e in pairs(el) do add(e) end end
        end
    end)
    local roots = { rawget(b, "Battle"), rawget(b, "Fight"), rawget(b, "FightState"), rawget(b, "Scene"), b }
    for _, root in pairs(roots) do
        if type(root) == "table" then
            for _, k in ipairs({ "Monsterinstance", "MonsterInstance", "EnemyList", "EnemyRoster", "Enemies", "Monsters" }) do
                local list = rawget(root, k)
                if type(list) == "table" then for _, e in pairs(list) do add(e) end end
            end
        end
    end
    return res
end
h.EnemyMercyMax = function(e)
    if type(e) ~= "table" then return 100 end
    local def = rawget(e, "Def")
    local m = 100
    if type(def) == "table" then
        if type(rawget(def, "MercyMax")) == "number" and rawget(def, "MercyMax") > 0 then m = rawget(def, "MercyMax") end
        if type(rawget(def, "Maxmercy")) == "number" and rawget(def, "Maxmercy") > 0 then m = rawget(def, "Maxmercy") end
    end
    if type(rawget(e, "MercyMax")) == "number" and rawget(e, "MercyMax") > 0 then m = rawget(e, "MercyMax") end
    if type(rawget(e, "Maxmercy")) == "number" and rawget(e, "Maxmercy") > 0 then m = rawget(e, "Maxmercy") end
    return m
end
h.ApplyMercy = function(own, e, amt)
    if type(e) ~= "table" then return false end
    local maxm = h.EnemyMercyMax(e)
    local des = amt == nil and maxm or math.clamp(tonumber(amt) or 0, 0, maxm)
    rawset(e, "Mercy", des)
    local def = rawget(e, "Def")
    if type(def) == "table" and rawget(def, "Mercy") ~= nil then rawset(def, "Mercy", des) end
    return true
end
h.MaxMercy = function()
    local b = LBC.Battle
    if type(b) ~= "table" or h.IsTermCtrl(b) then b = h.FindBattle(true, true) end
    if type(b) ~= "table" or h.IsTermCtrl(b) then return false end
    local ch = false
    for _, e in ipairs(h.GetEnemies(b)) do
        h.ApplyMercy(b, e, nil)
        ch = true
    end
    if type(rawget(b, "RefreshUi")) == "function" then pcall(function() b:RefreshUi() end) end
    return ch
end
h.GiveMercyNamed = function(name, amt)
    amt = tonumber(amt) or 0
    name = string.gsub(tostring(name or ""), "^%s*(.-)%s*$", "%1")
    if name == "" or name == "(none)" or name == "(no active enemies)" then return false end
    local base = string.gsub(name, "%s*#%d+$", "")
    local wantIdx = tonumber(string.match(name, "#(%d+)$")) or 0
    local b = LBC.Battle
    if type(b) ~= "table" or h.IsTermCtrl(b) then b = h.FindBattle(true, true) end
    if type(b) ~= "table" or h.IsTermCtrl(b) then return false end
    local ch, idx = false, 0
    for _, e in ipairs(h.GetEnemies(b)) do
        local en = ""
        pcall(function()
            local def = rawget(e, "Def")
            local cands = { rawget(e, "Name"), rawget(e, "ShowName"), rawget(e, "DisplayName"), rawget(e, "Key"), rawget(e, "Id") }
            if type(def) == "table" then
                table.insert(cands, rawget(def, "Name"))
                table.insert(cands, rawget(def, "ShowName"))
                table.insert(cands, rawget(def, "Key"))
            end
            for _, c in ipairs(cands) do
                if type(c) == "string" then
                    local n = string.gsub(c, "^%s*(.-)%s*$", "%1")
                    if n ~= "" then en = n break end
                end
            end
        end)
        local bse = string.gsub(en, "%s*#%d+$", "")
        local hit = string.lower(en) == string.lower(name) or string.lower(bse) == string.lower(base)
        if hit then
            idx = idx + 1
            if wantIdx == 0 or idx == wantIdx or en == name then
                h.ApplyMercy(b, e, amt)
                ch = true
                if wantIdx > 0 then break end
            end
        end
    end
    if ch and type(rawget(b, "RefreshUi")) == "function" then pcall(function() b:RefreshUi() end) end
    return ch
end
h.GetEnemyNames = function(force)
    local names, seen, counts = {}, {}, {}
    local function add(v)
        v = string.gsub(tostring(v or ""), "^%s*(.-)%s*$", "%1")
        if v == "" or v == "(none)" then return end
        local base = v
        counts[base] = (counts[base] or 0) + 1
        if counts[base] > 1 then v = base .. " #" .. tostring(counts[base]) end
        if seen[v] then return end
        seen[v] = true
        names[#names + 1] = v
    end
    local b = LBC.Battle
    if force or type(b) ~= "table" or h.IsTermCtrl(b) then b = h.FindBattle(force == true, false) end
    if type(b) == "table" and not h.IsTermCtrl(b) then
        for _, e in ipairs(h.GetEnemies(b)) do
            if type(e) == "table" and rawget(e, "Alive") ~= false and rawget(e, "Gone") ~= true then
                local en = ""
                pcall(function()
                    local def = rawget(e, "Def")
                    local cands = { rawget(e, "Name"), rawget(e, "ShowName"), rawget(e, "DisplayName"), rawget(e, "Key") }
                    if type(def) == "table" then table.insert(cands, rawget(def, "Name")); table.insert(cands, rawget(def, "Key")) end
                    for _, c in ipairs(cands) do
                        if type(c) == "string" then
                            local n = string.gsub(c, "^%s*(.-)%s*$", "%1")
                            if n ~= "" then en = n break end
                        end
                    end
                end)
                add(en)
            end
        end
    end
    table.sort(names)
    return names
end
h.ZeroEnemies = function(c)
    if type(c) ~= "table" then return end
    if type(rawget(c, "EnemyHP")) == "number" then rawset(c, "EnemyHP", 0) end
    local en = rawget(c, "Enemies")
    if type(en) == "table" then
        for _, e in pairs(en) do
            if type(e) == "table" and rawget(e, "HP") ~= nil then
                rawset(e, "HP", 0)
                if rawget(e, "Alive") ~= nil then rawset(e, "Alive", false) end
                if rawget(e, "Gone") ~= nil then rawset(e, "Gone", true) end
            end
        end
    end
    if type(c.EnemyList) == "function" then
        pcall(function()
            for _, e in pairs(c:EnemyList()) do
                if type(e) == "table" then
                    rawset(e, "HP", 0)
                    if type(c.SyncEnemyAlive) == "function" then pcall(function() c:SyncEnemyAlive(e) end) end
                end
            end
        end)
    end
end
h.TryWin = function(c)
    if type(c) ~= "table" then return false end
    local ok = false
    pcall(function()
        h.ZeroEnemies(c)
        local nb = rawget(c, "Battle")
        if type(nb) == "table" then
            if type(nb.StopWaves) == "function" then nb:StopWaves() end
            if type(nb.ClearBullets) == "function" then nb:ClearBullets() end
            h.ZeroEnemies(nb)
        end
        if type(c.StopWaves) == "function" then c:StopWaves() end
        if type(c.ClearBullets) == "function" then c:ClearBullets() end
        if type(c.WinCombat) == "function" then c:WinCombat(); ok = true end
        if type(c.EnterVictory) == "function" then pcall(function() c:EnterVictory() end); ok = true end
        if type(c.EndBattle) == "function" then pcall(function() c:EndBattle() end); ok = true end
        local f = rawget(c, "Fight") or rawget(c, "FightState")
        if type(f) == "table" then
            if type(f.WinCombat) == "function" then pcall(function() f:WinCombat() end); ok = true end
            if type(f.EnterVictory) == "function" then pcall(function() f:EnterVictory() end); ok = true end
        end
        if rawget(c, "Victory") ~= nil then rawset(c, "Victory", 1) end
    end)
    return ok
end
h.InstantWin = function()
    pcall(function()
        local b = LBC.Battle
        if type(b) ~= "table" then b = h.FindBattle(true, true) end
        local fired = false
        if type(b) == "table" then
            fired = h.TryWin(b) or fired
            fired = h.TryWin(rawget(b, "Battle")) or fired
            fired = h.TryWin(rawget(b, "Fight")) or fired
            fired = h.TryWin(rawget(b, "FightState")) or fired
        end
        if not fired and B.hasGC then
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" then
                    if type(rawget(v, "WinCombat")) == "function" or (type(rawget(v, "EnterVictory")) == "function" and type(rawget(v, "Roster")) == "table") then
                        if h.TryWin(v) then fired = true break end
                    end
                end
            end
        end
        h.SoftRecover()
    end)
end
h.SkipTurn = function()
    pcall(function()
        if not B.hasGC then return end
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                if type(v.StopWaves) == "function" and type(v.ClearBullets) == "function" then
                    pcall(function() v:StopWaves(); v:ClearBullets() end)
                end
                if type(v.Bullets) == "table" then
                    for i = #v.Bullets, 1, -1 do
                        local bu = v.Bullets[i]
                        if bu and type(bu.Destroy) == "function" then pcall(function() bu:Destroy() end) end
                        table.remove(v.Bullets, i)
                    end
                end
                if type(v.EndEnemyTurn) == "function" and rawget(v, "Roster") ~= nil then
                    pcall(function() v:EndEnemyTurn() end)
                end
            end
        end
    end)
end
h.FindQueen = function(force)
    local now = os.clock()
    local c = LBC.Battle
    if type(c) ~= "table" then c = h.FindBattle(false, false) end
    if QS.Ctrl ~= c then QS.Ctrl = c; QS.En = nil; QS.Sh = nil; QS.LS = 0 end
    local en, sh = QS.En, QS.Sh
    local function insp(o)
        if type(o) ~= "table" then return end
        if type(o.QueenShield) == "function" then
            local ok, fe, fs = pcall(function() return o:QueenShield() end)
            if ok then if type(fe) == "table" then en = fe end; if type(fs) == "table" then sh = fs end end
        end
        if type(rawget(o, "Shieldhp")) == "number" and type(rawget(o, "Shieldmaxhp")) == "number" then en = o end
        for _, k in ipairs({ "Battle", "Fight", "FightState", "Scene", "Enemies", "Objects", "Instances" }) do
            local n = rawget(o, k)
            if type(n) == "table" then
                if type(rawget(n, "Shieldhp")) == "number" and type(rawget(n, "Shieldmaxhp")) == "number" then en = n end
                for _, cand in pairs(n) do
                    if type(cand) == "table" then
                        if type(rawget(cand, "Shieldhp")) == "number" and type(rawget(cand, "Shieldmaxhp")) == "number" then en = cand end
                        if rawget(cand, "Shieldhurt") ~= nil and rawget(cand, "Shieldhurttimer") ~= nil then sh = cand end
                    end
                end
            end
        end
    end
    insp(c)
    if type(c) == "table" then
        insp(rawget(c, "Battle")); insp(rawget(c, "Fight")); insp(rawget(c, "FightState")); insp(rawget(c, "Scene"))
    end
    if force or (type(en) ~= "table" and now - QS.LS >= 1.5) then
        QS.LS = now
        if B.hasGC then
            pcall(function()
                for _, cand in pairs(getgc(true)) do
                    if type(cand) == "table" then
                        if type(en) ~= "table" and type(rawget(cand, "Shieldhp")) == "number" and type(rawget(cand, "Shieldmaxhp")) == "number"
                            and type(rawget(cand, "Shieldacthp")) == "number" then en = cand end
                        if type(sh) ~= "table" and rawget(cand, "Shieldhurt") ~= nil and rawget(cand, "Shieldhurttimer") ~= nil then sh = cand end
                        if type(en) == "table" and type(sh) == "table" then break end
                    end
                end
            end)
        end
    end
    QS.En = en
    QS.Sh = sh
    return en, sh
end
h.BreakQueen = function(force)
    local en, sh = h.FindQueen(force == true)
    local ch = false
    local function br(o)
        if type(o) ~= "table" then return end
        if rawget(o, "Shieldhp") ~= nil or rawget(o, "Shieldmaxhp") ~= nil or rawget(o, "Shieldacthp") ~= nil then
            rawset(o, "Shieldhp", 0)
            rawset(o, "Shieldacthp", 0)
            rawset(o, "Shieldbrokecon", 1)
            rawset(o, "Shieldjustbroke", 1)
            rawset(o, "Shieldjustwentdown", 1)
            if rawget(o, "Sprite") ~= nil then rawset(o, "Sprite", "spr_queen_drunk") end
            ch = true
        end
    end
    br(en)
    if type(sh) == "table" then
        if rawget(sh, "Shieldhurt") ~= nil then rawset(sh, "Shieldhurt", 2); ch = true end
        if rawget(sh, "Shieldhurttimer") ~= nil then rawset(sh, "Shieldhurttimer", 0); ch = true end
        if rawget(sh, "Broken") ~= nil then rawset(sh, "Broken", true); ch = true end
    end
    local c = LBC.Battle
    if type(c) == "table" then
        for _, k in ipairs({ "Battle", "Fight", "FightState", "Scene" }) do
            local n = rawget(c, k)
            if type(n) == "table" and n ~= en and n ~= sh then br(n) end
        end
        if type(rawget(c, "RefreshUi")) == "function" then pcall(function() c:RefreshUi() end) end
    end
    return ch
end
h.MaxDoki = function()
    local ch = 0
    pcall(function()
        if not B.hasGC then return end
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                local d = rawget(v, "Doki")
                local dm = rawget(v, "DokiMax")
                if type(d) == "number" and type(dm) == "number" and dm > 0 then
                    rawset(v, "Doki", dm)
                    ch = ch + 1
                end
            end
        end
    end)
    return ch > 0
end
h.GiveDoki = function(amt)
    amt = tonumber(amt) or 0
    local set = false
    local function try(t)
        if type(t) ~= "table" then return end
        if rawget(t, "Doki") ~= nil or rawget(t, "DokiMax") ~= nil or rawget(t, "DokiMeter") ~= nil then
            local mx = tonumber(rawget(t, "DokiMax")) or tonumber(rawget(t, "MaxDoki")) or 100
            if rawget(t, "Doki") ~= nil then rawset(t, "Doki", math.clamp(amt, 0, mx)); set = true end
            if rawget(t, "DokiMeter") ~= nil then rawset(t, "DokiMeter", math.clamp(amt, 0, mx)); set = true end
        end
    end
    local b = LBC.Battle or h.FindBattle(true, true)
    if type(b) == "table" then
        try(rawget(b, "FightState")); try(rawget(b, "Fight")); try(b)
        local fs = rawget(b, "FightState")
        if type(fs) == "table" then for _, v in pairs(fs) do try(v) end end
    end
    if not set and B.hasGC then
        pcall(function()
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" and type(rawget(v, "Doki")) == "number" then
                    local mx = tonumber(rawget(v, "DokiMax")) or 100
                    rawset(v, "Doki", math.clamp(amt, 0, mx))
                    set = true
                end
            end
        end)
    end
    return set
end
h.ApplyFreeSpells = function(on)
    St.freeSpells = on == true
    pcall(function()
        if not Da then return end
        local ok, Sp = pcall(require, Da.Spells)
        if not ok or type(Sp) ~= "table" or type(Sp.Definitions) ~= "table" then return end
        for _, def in pairs(Sp.Definitions) do
            if type(def) == "table" and type(def.Cost) == "number" then
                if on then
                    if B.get(def, "oc") == nil then B.set(def, "oc", def.Cost) end
                    def.Cost = 0
                else
                    local oc = B.get(def, "oc")
                    if type(oc) == "number" then def.Cost = oc end
                end
            end
        end
    end)
end
h.ApplyFreeActs = function(on)
    St.freeActs = on == true
    pcall(function()
        if not Da then return end
        local ok, Ac = pcall(require, Da.Acts)
        if not ok or type(Ac) ~= "table" then return end
        local function walk(t, d)
            if type(t) ~= "table" or d > 4 then return end
            if type(rawget(t, "Cost")) == "number" and type(rawget(t, "Key")) == "string" then
                if on then
                    if B.get(t, "oc") == nil then B.set(t, "oc", t.Cost) end
                    t.Cost = 0
                else
                    local oc = B.get(t, "oc")
                    if type(oc) == "number" then t.Cost = oc end
                end
            end
            for _, v in pairs(t) do if type(v) == "table" then walk(v, d + 1) end end
        end
        walk(Ac, 0)
        local Fights = Tr:FindFirstChild("Fights")
        if Fights then
            for _, name in ipairs({ "TennaActs", "JevilActs", "KnightActs", "KingActs", "SpamtonActs", "SpamtonNeoActs", "BerdlyActs", "PinkActs", "AquaActs" }) do
                local m = Fights:FindFirstChild(name, true)
                if m and m:IsA("ModuleScript") then
                    local ok2, res = pcall(require, m)
                    if ok2 and type(res) == "table" then walk(res, 0) end
                end
            end
        end
    end)
end
h.ApplySnow = function(on)
    St.snow = on == true
    pcall(function()
        if not Da then return end
        local ok, Sp = pcall(require, Da.Spells)
        if not ok or type(Sp) ~= "table" then return end
        local loadouts = Sp.Loadouts
        if type(loadouts) ~= "table" or type(loadouts.Noelle) ~= "table" then return end
        local list = loadouts.Noelle.Default
        if type(list) ~= "table" then
            loadouts.Noelle.Default = { "HealPrayer", "SleepMist", "IceShock" }
            list = loadouts.Noelle.Default
        end
        local has = false
        for i, id in ipairs(list) do
            if id == "SnowGrave" then
                has = true
                if not on then table.remove(list, i) end
                break
            end
        end
        if on and not has then table.insert(list, "SnowGrave") end
        if type(Sp.Definitions) == "table" and type(Sp.Definitions.SnowGrave) == "table" then
            if on then
                Sp.Definitions.SnowGrave.MenuVisible = true
                Sp.Definitions.SnowGrave.Available = true
                Sp.Definitions.SnowGrave.Cost = 250
            end
        end
    end)
end
h.GetSpellOpts = function()
    local res = {}
    pcall(function()
        if not Da then return end
        local ok, Sp = pcall(require, Da.Spells)
        if ok and type(Sp) == "table" and type(Sp.Definitions) == "table" then
            for id, def in pairs(Sp.Definitions) do
                if type(id) == "string" and type(def) == "table" then table.insert(res, id) end
            end
        end
    end)
    table.sort(res)
    if #res == 0 then res = { St.spell or "RudeBuster" } end
    return res
end
h.GetActorOpts = function()
    local res, seen = {}, {}
    local function add(n)
        if type(n) == "string" and not seen[n] then seen[n] = true; table.insert(res, n) end
    end
    pcall(function()
        if not Da then return end
        local ok, Sp = pcall(require, Da.Spells)
        if ok and type(Sp) == "table" and type(Sp.Loadouts) == "table" then
            for a in pairs(Sp.Loadouts) do add(a) end
        end
    end)
    table.sort(res)
    if #res == 0 then res = { "Kris" } end
    return res
end
h.QueueJevil = function(choice)
    local idx = ({ ["Damage Enemy (Spade)"] = 1, ["Heal Party (Heart)"] = 2, ["Heal Enemy (Diamond)"] = 3, ["Damage Party (Club)"] = 4 })[tostring(choice or "")] or 1
    local b = LBC.Battle or h.FindBattle(false, false)
    if type(b) ~= "table" then return false end
    for _, e in ipairs(h.GetEnemies(b)) do
        if type(e) == "table" and type(rawget(e, "Random")) == "function" then
            if B.get(e, "jhook") ~= true then
                local orig = e.Random
                B.set(e, "orand", orig)
                B.set(e, "jpend", nil)
                rawset(e, "Random", function(self, minv, maxv, ...)
                    local p = B.get(self, "jpend")
                    if p and tonumber(minv) == 1 and tonumber(maxv) == 5 then
                        B.set(self, "jpend", nil)
                        return p
                    end
                    return orig(self, minv, maxv, ...)
                end)
                B.set(e, "jhook", true)
            end
            B.set(e, "jpend", idx)
            return true
        end
    end
    return false
end
h.FindAtkCtrl = function()
    local function has(c) return type(c) == "table" and type(rawget(c, "AttackRows")) == "table" end
    local cached = FA.Ctrl
    if has(cached) and not h.IsTermCtrl(cached) then return cached end
    local b = LBC.Battle
    if type(b) ~= "table" or h.IsTermCtrl(b) then b = h.FindBattle(false, false) end
    if type(b) ~= "table" or h.IsTermCtrl(b) then return nil end
    for _, c in ipairs({ b, rawget(b, "Battle"), rawget(b, "Fight"), rawget(b, "FightState"), rawget(b, "Ts") }) do
        if has(c) then FA.Ctrl = c; return c end
    end
    local now = os.clock()
    if (now - (FA.LS or 0)) < 1.0 then return nil end
    FA.LS = now
    if B.hasGC then
        for _, v in pairs(getgc(true)) do
            if has(v) and tostring(rawget(v, "State") or "") == "Fight" then FA.Ctrl = v; return v end
        end
    end
    return nil
end
h.AntiFailStep = function()
    if not St.antiFail then return end
    local c = h.FindAtkCtrl()
    if type(c) ~= "table" or h.IsTermCtrl(c) then FA.Ctrl = nil; return end
    local rows = rawget(c, "AttackRows")
    if type(rows) ~= "table" then return end
    for _, row in pairs(rows) do
        if type(row) == "table" and rawget(row, "Resolved") ~= true then
            local mem = rawget(row, "Member")
            local allowed = true
            if type(mem) == "table" and type(rawget(c, "OwnsMember")) == "function" then
                local ok, owned = pcall(function() return c:OwnsMember(mem) end)
                if ok and owned == false then allowed = false end
            end
            if allowed then
                pcall(function()
                    rawset(row, "PressBuffer", 5)
                    if type(rawget(c, "SpawnBurst")) == "function" then
                        pcall(function() c:SpawnBurst(row, 0) end)
                    end
                    if type(rawget(c, "ResolveRow")) == "function" then
                        c:ResolveRow(row, false, 0)
                    end
                    if rawget(row, "Resolved") ~= true then
                        rawset(row, "Resolved", true)
                        if type(mem) == "table" then
                            local cfg = nil
                            pcall(function()
                                if Da then
                                    local ok2, c2 = pcall(require, Da.Config)
                                    if ok2 then cfg = c2 end
                                end
                            end)
                            local perfect = 150
                            if type(cfg) == "table" and type(cfg.Turn) == "table"
                                and type(cfg.Turn.PointsPerfect) == "number" then
                                perfect = cfg.Turn.PointsPerfect
                            end
                            rawset(mem, "Points", perfect)
                        end
                    end
                end)
            end
        end
    end
end
h.GetPinkDate = function(force)
    local cached = PD.St
    if type(cached) == "table" and rawget(cached, "Done") ~= true and type(rawget(cached, "DateTimeLeft")) == "number" then return cached end
    if cached then PD.St = nil end
    local now = os.clock()
    if not force and now - (PD.LS or 0) < 0.5 then return nil end
    PD.LS = now
    if not B.hasGC then return nil end
    local found = nil
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" and type(rawget(v, "DateTimeLeft")) == "number" and type(rawget(v, "DateTimeLeftMax")) == "number"
                and rawget(v, "Con") ~= nil and rawget(v, "Done") ~= true then
                if rawget(v, "ChoiceIsCorrect") ~= nil or rawget(v, "DrawBoxSelected") ~= nil or rawget(v, "BoxCount") ~= nil then
                    found = v; break
                end
                if found == nil then found = v end
            end
        end
    end)
    if found then PD.St = found end
    return found
end
h.DateFrzStep = function()
    if not St.dateFrz then return end
    local s = h.GetPinkDate(false) or h.GetPinkDate(true)
    if not s then return end
    local mx = rawget(s, "DateTimeLeftMax")
    if type(mx) == "number" then rawset(s, "DateTimeLeft", mx) end
end
h.AutoDateStep = function()
    if not St.autoDate then return end
    local s = h.GetPinkDate(false) or h.GetPinkDate(true)
    if not s then return end
    local con = rawget(s, "Con")
    local draw = rawget(s, "DrawBoxCon")
    local sel = rawget(s, "ChoiceSelected")
    if con ~= 2 then return end
    if draw ~= 0 and draw ~= nil then return end
    if type(sel) == "number" and sel >= 0 then return end
    local best = nil
    local correct = rawget(s, "ChoiceIsCorrect")
    if type(correct) == "table" then
        for idx, val in pairs(correct) do
            if val == 1 or val == true then best = tonumber(idx) or idx; break end
        end
    end
    if best == nil then best = rawget(s, "CorrectChoiceIndex") or 0 end
    pcall(function()
        rawset(s, "DrawBoxSelected", best)
        rawset(s, "DrawBoxCon", 2)
        rawset(s, "OffsetTimer", 0)
    end)
end
h.YellowStep = function()
    if not (St.autoSpam or St.noCharge) then return end
    local b = LBC.Battle
    if type(b) ~= "table" then b = h.FindBattle(false, false) end
    if type(b) ~= "table" then return end
    local function prime(node, d)
        if type(node) ~= "table" or d > 3 then return end
        if rawget(node, "Hold") ~= nil or rawget(node, "Charged") ~= nil or type(rawget(node, "BigShotCount")) == "number" then
            rawset(node, "Hold", math.huge)
            rawset(node, "Charged", true)
            if type(rawget(node, "BigShotCount")) == "number" and rawget(node, "BigShotCount") < 1 then rawset(node, "BigShotCount", 1) end
            if type(rawget(node, "Charge")) == "number" then rawset(node, "Charge", 999) end
        end
        if d < 2 then for _, v in pairs(node) do if type(v) == "table" then prime(v, d + 1) end end end
    end
    local fs = rawget(b, "FightState") or rawget(b, "Fight")
    local sc = type(fs) == "table" and (rawget(fs, "LiveScene") or rawget(fs, "Scene")) or nil
    if type(sc) == "table" then prime(sc, 0) end
    if type(fs) == "table" then prime(fs, 0) end
    if B.get(b, "yhook") ~= true then
        local bb = rawget(b, "Battle") or b
        if type(bb) == "table" and type(rawget(bb, "ControllerInput")) == "function" then
            local orig = bb.ControllerInput
            B.set(bb, "oinput", orig)
            rawset(bb, "ControllerInput", function(self, owner)
                local input = orig(self, owner)
                if type(input) ~= "table" then return input end
                if not (St.autoSpam or St.noCharge) then return input end
                local now = os.clock()
                if St.autoSpam then
                    if now >= YN then YN = now + 0.12; YP = now + 0.02 end
                    if now < YP then
                        local out = {}
                        for k, v in pairs(input) do out[k] = v end
                        local pressed, released = {}, {}
                        if type(input.Pressed) == "table" then for k, v in pairs(input.Pressed) do pressed[k] = v end end
                        if type(input.Released) == "table" then for k, v in pairs(input.Released) do released[k] = v end end
                        out.Pressed = pressed
                        out.Released = released
                        out.Confirm = false
                        out.Pressed.Confirm = false
                        out.Released.Confirm = true
                        return out
                    end
                end
                if St.noCharge then
                    local pressed = type(input.Pressed) == "table" and input.Pressed.Confirm == true
                    if pressed then
                        local out = {}
                        for k, v in pairs(input) do out[k] = v end
                        local pr, re = {}, {}
                        if type(input.Pressed) == "table" then for k, v in pairs(input.Pressed) do pr[k] = v end end
                        if type(input.Released) == "table" then for k, v in pairs(input.Released) do re[k] = v end end
                        out.Pressed = pr
                        out.Released = re
                        out.Confirm = false
                        out.Pressed.Confirm = false
                        out.Released.Confirm = true
                        return out
                    end
                end
                return input
            end)
            B.set(b, "yhook", true)
        end
    end
end
h.SusieStep = function()
    if not St.susieAct then return end
    local b = LBC.Battle
    if type(b) ~= "table" then return end
    local f = rawget(b, "Fight")
    local fs = rawget(b, "FightState")
    if type(f) ~= "table" or type(fs) ~= "table" then return end
    local fid = tostring(rawget(f, "Id") or rawget(f, "Name") or "")
    if fid ~= "SpamtonNeo" and not string.find(string.lower(fid), "spamton", 1, true) then return end
    rawset(fs, "BigShotCount", 20)
end
h.ApplyShowHP = function(on)
    St.showHP = on == true
    local b = LBC.Battle
    if type(b) ~= "table" then return end
    local f = rawget(b, "Fight") or rawget(b, "FightState") or b
    if type(f) == "table" and rawget(f, "HideEnemyHP") ~= nil then
        rawset(f, "HideEnemyHP", not on)
    end
end
h.ApplyAutoDef = function(on)
    St.autoDef = on == true
end
h.AutoDefStep = function()
    if not St.autoDef then return end
    local b = LBC.Battle
    if type(b) ~= "table" then return end
    local r = rawget(b, "Roster")
    local m = type(r) == "table" and rawget(r, "Members") or nil
    if type(m) ~= "table" then return end
    local phase = false
    pcall(function()
        local bb = rawget(b, "Battle")
        if type(bb) == "table" and type(rawget(bb, "Bullets")) == "table" and next(rawget(bb, "Bullets")) then phase = true end
    end)
    if not phase then return end
    for _, mem in pairs(m) do
        if type(mem) == "table" and h.IsLocal(mem) then rawset(mem, "Defending", true) end
    end
end
h.GersonShieldStep = function()
    if not St.gShield then return end
    local sc = GS.Sc
    if type(sc) ~= "table" or rawget(sc, "Done") == true or type(rawget(sc, "Spears")) ~= "table" then
        GS.Sc = nil
        if not B.hasGC then return end
        local now = os.clock()
        if now - (GS.LF or 0) < 0.5 then return end
        GS.LF = now
        pcall(function()
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" and type(rawget(v, "Spears")) == "table" and rawget(v, "Soul") ~= nil
                    and rawget(v, "Api") ~= nil and type(rawget(v, "SpawnShield")) == "function" and rawget(v, "Done") ~= true then
                    GS.Sc = v
                    break
                end
            end
        end)
        sc = GS.Sc
    end
    if type(sc) ~= "table" then return end
    pcall(function()
        if type(sc.SpawnShield) == "function" then sc:SpawnShield() end
    end)
end
h.GersonRudeStep = function(perfect)
    if not (St.gRude or St.gAuto) then return end
    pcall(function()
        local ok, mod = pcall(require, Tr.Fights.Gerson.GersonRudeBuster)
        if not ok or type(mod) ~= "table" then return end
        local targets = {}
        if type(rawget(mod, "Current")) == "table" then
            targets[#targets + 1] = rawget(mod, "Current")
        end
        if type(rawget(mod, "Items")) == "table" then
            for _, it in ipairs(rawget(mod, "Items")) do
                if type(it) == "table" then targets[#targets + 1] = it end
            end
        end
        for _, t in ipairs(targets) do
            if type(t) == "table" and rawget(t, "Alive") ~= false then
                local con = rawget(t, "Con")
                local hf = rawget(t, "HurtFlash") or 0
                local ex = rawget(t, "Explode") or 0
                local x = rawget(t, "X")
                local tm = rawget(t, "Timer") or 0
                if con == 0 and hf == 0 and ex == 0 and type(x) == "number" and x < 330 then
                    rawset(t, "Buffer", 2)
                elseif perfect and con == 1 and hf == 0 and ex == 0 and type(x) == "number" and x < 330 then
                    if tm < 3 then rawset(t, "Timer", 3) end
                end
            end
        end
    end)
end
h.AntiStealStep = function()
    if not St.antiSteal then InvSnap = nil; return end
    pcall(function()
        if not B.hasGC then return end
        local inv = nil
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                local it = rawget(v, "Items")
                if type(it) == "table" and #it <= 99 then
                    local allNum = true
                    for _, id in ipairs(it) do
                        if type(id) ~= "number" then allNum = false; break end
                    end
                    if allNum and (#it > 0 or type(rawget(v, "MaxSlots")) == "number") then
                        inv = it
                        break
                    end
                end
            end
        end
        if type(inv) ~= "table" then return end
        if InvSnap == nil then
            InvSnap = {}
            for i, it in ipairs(inv) do InvSnap[i] = it end
            return
        end
        if #inv < #InvSnap then
            for k in pairs(inv) do inv[k] = nil end
            for i, it in ipairs(InvSnap) do inv[i] = it end
            local b = LBC.Battle
            if type(b) == "table" and type(rawget(b, "RefreshUi")) == "function" then
                pcall(function() b:RefreshUi() end)
            end
        elseif #inv > #InvSnap then
            InvSnap = {}
            for i, it in ipairs(inv) do InvSnap[i] = it end
        end
    end)
end
h.UnlockTP = function()
    local max = h.TpMax()
    h.Scan("hard")
    pcall(function()
        local b = h.FindBattle(true, true)
        if type(b) == "table" then
            rawset(b, "TensionMax", max)
            if type(rawget(b, "SetTensionMax")) == "function" then pcall(function() b:SetTensionMax(max) end) end
        end
        for _, v in pairs(Ca.TT) do
            rawset(v, "TensionMax", max)
            if type(rawget(v, "SetTensionMax")) == "function" then pcall(function() v:SetTensionMax(max) end) end
        end
    end)
end
local CF = "DeltaruneSW/Configs"
local CN = "Default"
h.EnsureCF = function()
    if not makefolder then return end
    pcall(function() makefolder("DeltaruneSW") end)
    pcall(function() makefolder(CF) end)
end
h.CfgPath = function(n) return CF .. "/" .. tostring(n or "Default") .. ".json" end
h.EncCfg = function(d)
    local p = {}
    for k, v in pairs(d) do
        local val = type(v) == "boolean" and (v and "true" or "false") or type(v) == "number" and tostring(v) or ('"' .. tostring(v):gsub('"', "") .. '"')
        table.insert(p, '"' .. tostring(k) .. '":' .. val)
    end
    return "{" .. table.concat(p, ",") .. "}"
end
h.DecCfg = function(s)
    local r = {}
    if type(s) ~= "string" then return r end
    for k, v in string.gmatch(s, '"([^"]+)":%s*([^,}]+)') do
        v = v:gsub("%s+", "")
        if v == "true" then r[k] = true
        elseif v == "false" then r[k] = false
        elseif tonumber(v) then r[k] = tonumber(v)
        else r[k] = v:gsub('^"', ""):gsub('"$', "") end
    end
    return r
end
h.SnapCfg = function()
    return {
        tpInf = St.tpInf, hpInf = St.hpInf, god = St.god, freeSoul = St.freeSoul, delAtk = St.delAtk,
        gShield = St.gShield, gRude = St.gRude, gAuto = St.gAuto, freeActs = St.freeActs, snow = St.snow,
        freeSpells = St.freeSpells, actor = St.actor, spell = St.spell, act = St.act,
        tpAmt = St.tpAmt, hpAmt = St.hpAmt, uiCol = St.uiCol,
    }
end
h.ApplyCfg = function(d)
    if type(d) ~= "table" then return end
    St.tpInf = d.tpInf == true
    St.hpInf = d.hpInf == true
    St.god = d.god == true
    St.freeSoul = d.freeSoul == true
    St.delAtk = d.delAtk == true
    St.gShield = d.gShield == true
    St.gRude = d.gRude == true
    St.gAuto = d.gAuto == true
    St.freeActs = d.freeActs == true
    St.snow = d.snow == true
    St.freeSpells = d.freeSpells == true
    St.actor = d.actor or "Kris"
    St.spell = d.spell or "RudeBuster"
    St.act = d.act or "Check"
    St.tpAmt = tonumber(d.tpAmt) or 10
    St.hpAmt = tonumber(d.hpAmt) or 0
    St.uiCol = d.uiCol or "Dark"
    h.ApplyGod(St.god)
    h.ApplyFreeSoul(St.freeSoul)
    h.ApplyFreeSpells(St.freeSpells)
    h.ApplyFreeActs(St.freeActs)
    h.ApplySnow(St.snow)
    if St.tpInf then
        local b = LBC.Battle
        if type(b) == "table" and type(rawget(b, "Tension")) == "number" then
            rawset(b, "Tension", h.TpMax())
        end
    end
end
h.SaveCfg = function(n)
    n = tostring(n or CN or "Default")
    if n == "" then n = "Default" end
    h.EnsureCF()
    if not writefile then return false end
    local ok = pcall(function() writefile(h.CfgPath(n), h.EncCfg(h.SnapCfg())) end)
    return ok
end
h.LoadCfg = function(n)
    n = tostring(n or CN or "Default")
    local path = h.CfgPath(n)
    local raw
    local ok = pcall(function()
        if isfile and isfile(path) and readfile then raw = readfile(path)
        elseif readfile then raw = readfile(path) end
    end)
    if not ok or not raw then return false end
    h.ApplyCfg(h.DecCfg(raw))
    return true
end
h.DelCfg = function(n)
    n = tostring(n or CN or "Default")
    local path = h.CfgPath(n)
    if not delfile then return false end
    local exists = true
    if isfile then local ok, r = pcall(isfile, path); exists = ok and r == true end
    if not exists then return false end
    return pcall(function() delfile(path) end)
end
h.ListCfg = function()
    h.EnsureCF()
    local list = { "Default" }
    pcall(function()
        if listfiles then
            for _, f in pairs(listfiles(CF)) do
                local name = tostring(f):match("([^/\\]+)%.json$")
                if name and name ~= "Default" then table.insert(list, name) end
            end
        end
    end)
    return list
end
local Fns = {}
Fns.SafeHttpGet = function(url)
    local r = nil
    if type(game.HttpGet) == "function" then
        local ok, res = pcall(function() return game:HttpGet(url) end)
        if ok and type(res) == "string" and res ~= "" then return res end
    end
    if type(game.HttpGetAsync) == "function" then
        local ok, res = pcall(function() return game:HttpGetAsync(url) end)
        if ok and type(res) == "string" and res ~= "" then return res end
    end
    local req = (syn and syn.request) or (http and http.request) or http_request or request
    if type(req) == "function" then
        local ok, res = pcall(function() return req({ Url = url, Method = "GET" }) end)
        if ok and type(res) == "table" then
            local body = res.Body or res.body
            if type(body) == "string" and body ~= "" then return body end
        end
    end
    return r
end
Fns.SafeLoad = function(code)
    local loader = loadstring or load
    if type(loader) ~= "function" then return nil end
    local ok, fn = pcall(loader, code)
    if ok and type(fn) == "function" then return fn end
    return nil
end
Fns.LoadRemote = function(url)
    local src = Fns.SafeHttpGet(url)
    if type(src) ~= "string" or src == "" then return nil end
    local fn = Fns.SafeLoad(src)
    if type(fn) ~= "function" then return nil end
    local ok, result = pcall(fn)
    if ok then return result end
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
if type(Library) ~= "table" or type(Library.CreateWindow) ~= "function" then return end
pcall(function() ThemeManager = Fns.LoadRemote(repo .. "addons/ThemeManager.lua") end)
pcall(function() SaveManager = Fns.LoadRemote(repo .. "addons/SaveManager.lua") end)
local Options = Library.Options or {}
local Toggles = Library.Toggles or {}
local function RO(flag, fb)
    local opt = Options[flag]
    if type(opt) == "table" then
        local v = rawget(opt, "Value")
        if v ~= nil and v ~= "" then return v end
    end
    return fb
end
local function RN(flag, fb)
    local v = RO(flag, fb)
    local n = tonumber(v)
    if n == nil then return tonumber(fb) or 0 end
    return n
end
pcall(function() Library.ForceCheckbox = false; Library.ShowToggleFrameInKeybinds = true end)
local Ico = {
    Main = "swords",
    Attack = "swords",
    Act = "hand",
    Defend = "shield",
    Item = "package",
    Mercy = "heart",
    Sleep = "moon",
    Spell = "sparkles",
}
pcall(function()
    if Library.ImageManager and type(Library.ImageManager.AddAsset) == "function" then
        local base = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/"
        local map = {
            Main = base .. "ICON.png",
            Attack = base .. "Attack.png",
            Act = base .. "Act.png",
            Defend = base .. "Defend.png",
            Item = base .. "Item.png",
            Mercy = base .. "Mercy.png",
            Sleep = base .. "Sleep.png",
            Spell = base .. "Spell.png",
        }
        for name, url in pairs(map) do
            pcall(function()
                Library.ImageManager.AddAsset("VSW_" .. name, 0, url, true)
                local id = Library.ImageManager.GetAsset("VSW_" .. name)
                if type(id) == "string" and id ~= "" then Ico[name] = id end
            end)
        end
    end
end)
local Window
do
    local ok, win = pcall(function()
        return Library:CreateWindow({
            Title = "Deltarune Fight | VSW",
            Footer = "v5.0 | aa390b0",
            Icon = Ico.Main,
            NotifySide = "Right",
            ShowCustomCursor = true,
            Center = true,
            AutoShow = true,
            Resizable = true,
            ToggleKeybind = Enum.KeyCode.LeftShift,
            MobileButtonsSide = "Left",
        })
    end)
    if not ok or type(win) ~= "table" then
        ok, win = pcall(function()
            return Library:CreateWindow({
                Title = "Deltarune Fight | VSW",
                Footer = "v5.0 | aa390b0",
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
    if not ok or type(win) ~= "table" then return end
    Window = win
end
pcall(function()
    if type(Library.Notify) == "function" then
        Library:Notify({ Title = "Deltarune | VSW", Description = "Loaded. aa390b0", Time = 4 })
    end
end)
local Tabs = {
    Home = Window:AddTab("Home", "info"),
    Automatic = Window:AddTab("Automatic", "refresh-cw"),
    Boss = Window:AddTab("Boss / Mini-Boss", "swords"),
    Keybinds = Window:AddTab("Keybinds", "keyboard"),
    Settings = Window:AddTab("Settings", "settings"),
}
do
    local Info = Tabs.Home:AddGroupbox({ Side = "Left", Name = "Information", IconName = "info" })
    Info:AddLabel({ Text = "VSW Safe Recode v5\naa390b0\nAll watched modules left untouched.\nWeak-map state only.", DoesWrap = true })
    Info:AddDivider()
    Info:AddLabel({ Text = "Supported: Delta, Codex, Opiumware, Hydrogen, Macsploit, Volt, Madium, Real, Velocity, Potassium", DoesWrap = true })
    local Server = Tabs.Home:AddGroupbox({ Side = "Right", Name = "Server", IconName = "message-circle" })
    Server:AddButton({
        Text = "Copy Discord Link",
        Func = function()
            if type(setclipboard) == "function" then
                setclipboard("https://discord.gg/y3cHAw6Bb4")
                Library:Notify({ Title = "Copied", Description = "Discord link copied.", Time = 3 })
            end
        end,
    })
end
do
    local General = Tabs.Automatic:AddGroupbox({ Side = "Left", Name = "General", IconName = Ico.Mercy })
    General:AddToggle("TPInfinite", {
        Text = "TP Infinite", Default = false,
        Callback = function(v)
            St.tpInf = v == true
            if St.tpInf then
                h.FindBattle(false, false)
                local b = LBC.Battle
                if type(b) == "table" and type(rawget(b, "Tension")) == "number" then rawset(b, "Tension", h.TpMax()) end
            end
        end,
    })
    General:AddButton({ Text = "TP Max", Func = function() h.ForceTP(h.TpMax()) end })
    General:AddInput("TPGiver", { Text = "TP Giver", Default = "", Numeric = true, Finished = false, Placeholder = "Amount...", Callback = function(v) St.tpAmt = tonumber(v) or 0 end })
    General:AddButton({ Text = "Give TP", Func = function() local a = RN("TPGiver", St.tpAmt or 10); St.tpAmt = a; h.ForceTP(a) end })
    General:AddButton({ Text = "Unlock TP", Func = function() h.UnlockTP() end })
    General:AddDivider()
    General:AddToggle("HPInfinite", {
        Text = "HP Infinite", Default = false,
        Callback = function(v)
            St.hpInf = v == true
            if St.hpInf then h.FindBattle(false, false); h.ForceHPFull() end
        end,
    })
    General:AddInput("HPGiver", { Text = "HP Giver", Default = "", Numeric = true, Finished = false, Placeholder = "Amount...", Callback = function(v) St.hpAmt = tonumber(v) or 0 end })
    General:AddButton({ Text = "Give HP", Func = function() local a = RN("HPGiver", St.hpAmt or 0); St.hpAmt = a; if a ~= 0 then h.GiveHP(a) end end })
    General:AddButton({ Text = "Heal Party", Func = function() h.Scan("hard"); h.ForceHPFull() end })
    General:AddDivider()
    General:AddToggle("GodMode", {
        Text = "God-Mode", Tooltip = "Invincible. No TP from grazing.", Default = false,
        Callback = function(v) St.god = v == true; h.ApplyGod(St.god) end,
    })
    General:AddDropdown("MercyBoss", { Values = { "(none)" }, Default = 1, Text = "Boss", Searchable = true, Callback = function(o) St.mercyBoss = o end })
    General:AddInput("CustomMercy", { Text = "How much?", Default = "100", Numeric = true, Finished = false, Placeholder = "Amount...", Callback = function(v) St.mercyAmt = tonumber(v) or 0 end })
    General:AddButton({
        Text = "Refresh Boss",
        Func = function()
            local names = h.GetEnemyNames(true)
            if type(names) ~= "table" or #names == 0 then names = { "(no active enemies)" } end
            local opt = Options.MercyBoss
            if type(opt) == "table" then
                pcall(function()
                    if type(opt.SetValues) == "function" then opt:SetValues(names)
                    elseif type(opt.Refresh) == "function" then opt:Refresh(names)
                    else rawset(opt, "Values", names) end
                end)
                pcall(function()
                    if type(opt.SetValue) == "function" then opt:SetValue(names[1]) else rawset(opt, "Value", names[1]) end
                end)
            end
            St.mercyBoss = names[1]
            Library:Notify({ Title = "Boss List", Description = tostring(#names) .. " option(s).", Time = 3 })
        end,
    })
    General:AddButton({ Text = "Give Mercy to Boss", Func = function() local a = RN("CustomMercy", St.mercyAmt or 100); local b = RO("MercyBoss", St.mercyBoss); h.GiveMercyNamed(b, a) end })
    General:AddButton({ Text = "Max Mercy (All Enemies)", Func = function() h.MaxMercy() end })
    General:AddToggle("FreeSoul", {
        Text = "Free Soul", Tooltip = "Soul leaves battle box.", Default = false,
        Callback = function(v) St.freeSoul = v == true; h.ApplyFreeSoul(St.freeSoul) end,
    })
    local Fight = Tabs.Automatic:AddGroupbox({ Side = "Right", Name = "Fight", IconName = Ico.Attack })
    Fight:AddToggle("AntiFailAutoAttack", {
        Text = "Anti-Fail Attack", Tooltip = "Perfect hits automatically.", Default = false,
        Callback = function(v) St.antiFail = v == true end,
    })
    Fight:AddButton({ Text = "Instant Complete Fight", Func = function() h.InstantWin() end })
    Fight:AddButton({ Text = "Skip Enemy's Turn", Func = function() h.SkipTurn() end })
    Fight:AddToggle("AutoDefendParty", {
        Text = "Auto Defend Party", Tooltip = "Always block on enemy turn.", Default = false,
        Callback = function(v) h.ApplyAutoDef(v == true) end,
    })
    local Spells = Tabs.Automatic:AddGroupbox({ Side = "Left", Name = "Spells / Acts", IconName = Ico.Spell })
    Spells:AddToggle("FreeSpells", { Text = "Free Spells", Default = false, Callback = function(v) h.ApplyFreeSpells(v == true) end })
    Spells:AddToggle("FreeActs", { Text = "Free Acts", Default = false, Callback = function(v) h.ApplyFreeActs(v == true) end })
    Spells:AddToggle("ProceedSnowgrave", { Text = "Unlock Snowgrave", Default = false, Callback = function(v) h.ApplySnow(v == true) end })
    Spells:AddDivider()
    Spells:AddDropdown("AssignActor", { Values = h.GetActorOpts(), Default = St.actor or "Kris", Text = "Actor", Searchable = true, Callback = function(o) St.actor = o end })
    Spells:AddDropdown("AssignSpell", { Values = h.GetSpellOpts(), Default = St.spell or "RudeBuster", Text = "Spell", Searchable = true, Callback = function(o) St.spell = o end })
    Spells:AddButton({ Text = "Assign Spell to Actor", Func = function() end })
    Spells:AddDivider()
    Spells:AddDropdown("AssignAct", { Values = { "Check" }, Default = "Check", Text = "Act", Searchable = true, Callback = function(o) St.act = o end })
    Spells:AddButton({ Text = "Add Act to Actor", Func = function() end })
    local Actors = Tabs.Automatic:AddGroupbox({ Side = "Left", Name = "Actors", IconName = Ico.Act })
    Actors:AddDropdown("JevilChaosChoice", {
        Values = { "Damage Enemy (Spade)", "Heal Party (Heart)", "Heal Enemy (Diamond)", "Damage Party (Club)" },
        Default = 1, Text = "Get Chaos", Searchable = false,
        Callback = function(o) St.jevilChoice = tostring(o or "Damage Enemy (Spade)") end,
    })
    Actors:AddButton({ Text = "Get", Func = function() h.QueueJevil(St.jevilChoice); Library:Notify({ Title = "Jevil Chaos", Description = "Queued: " .. St.jevilChoice, Time = 3 }) end })
end
do
    local GeneralBoss = Tabs.Boss:AddGroupbox({ Side = "Left", Name = "General", IconName = Ico.Attack })
    GeneralBoss:AddToggle("DeleteStinky", {
        Text = "Delete Attacks", Tooltip = "Removes enemy attacks.", Default = false,
        Callback = function(v)
            St.delAtk = v == true
            if St.delAtk then
                local b = h.FindBattle(true, true)
                if b then h.InstDelHook(b) end
                h.NukeBullets()
            end
        end,
    })
    GeneralBoss:AddToggle("DumbAttack", {
        Text = "Dumb Attacks", Tooltip = "Flips bullet direction.", Default = false,
        Callback = function(v) St.dumb = v == true end,
    })
    GeneralBoss:AddToggle("ShowEnemyHP", {
        Text = "Show Enemy HP", Default = false,
        Callback = function(v) h.ApplyShowHP(v == true) end,
    })
    local SpamtonNeo = Tabs.Boss:AddGroupbox({ Side = "Right", Name = "Spamton Neo", IconName = Ico.Attack })
    SpamtonNeo:AddToggle("AutoSpamShots", {
        Text = "Auto Spam Big Shots", Default = false,
        Callback = function(v) St.autoSpam = v == true; YN = 0; YP = 0 end,
    })
    SpamtonNeo:AddToggle("NoChargeShots", {
        Text = "No Charge Big Shots", Default = false,
        Callback = function(v) St.noCharge = v == true; YN = 0; YP = 0 end,
    })
    SpamtonNeo:AddToggle("SuperChargeSusieAct", {
        Text = "Super Charge Susie's Act", Default = false,
        Callback = function(v) St.susieAct = v == true end,
    })
    local Gerson = Tabs.Boss:AddGroupbox({ Side = "Left", Name = "Gerson", IconName = Ico.Defend })
    Gerson:AddToggle("AntiStealItems", {
        Text = "Anti-Steal Items", Default = false,
        Callback = function(v) St.antiSteal = v == true; if not v then InvSnap = nil end end,
    })
    Gerson:AddToggle("GersonShield", {
        Text = "Auto Parry", Default = false,
        Callback = function(v) St.gShield = v == true; GS.Sc = nil end,
    })
    Gerson:AddToggle("GersonRudeTiming", {
        Text = "Perfect Timing", Default = false,
        Callback = function(v) St.gRude = v == true end,
    })
    Gerson:AddToggle("GersonAutoTiming", {
        Text = "Auto Timing Rude Buster", Default = false,
        Callback = function(v) St.gAuto = v == true end,
    })
    local Tenna = Tabs.Boss:AddGroupbox({ Side = "Right", Name = "Tenna", IconName = Ico.Item })
    Tenna:AddButton({
        Text = "Max Score",
        Func = function()
            pcall(function()
                if not B.hasGC then return end
                for _, v in pairs(getgc(true)) do
                    if type(v) == "table" and type(rawget(v, "Score")) == "number" and type(rawget(v, "MaxScore")) == "number" then
                        rawset(v, "Score", rawget(v, "MaxScore"))
                    end
                end
            end)
        end,
    })
    local Pink = Tabs.Boss:AddGroupbox({ Side = "Left", Name = "Pink", IconName = Ico.Sleep })
    Pink:AddToggle("AutoDateAnswers", {
        Text = "Auto Date Answers", Default = false,
        Callback = function(v) St.autoDate = v == true; if v then PD.St = nil end end,
    })
    Pink:AddButton({ Text = "Max Doki Meter", Func = function() h.MaxDoki() end })
    Pink:AddInput("CustomDoki", { Text = "Custom Doki", Default = "100", Numeric = true, Finished = false, Placeholder = "Amount...", Callback = function(v) St.dokiAmt = tonumber(v) or 0 end })
    Pink:AddButton({ Text = "Give Doki", Func = function() local a = RN("CustomDoki", St.dokiAmt or 100); St.dokiAmt = a; h.GiveDoki(a) end })
    Pink:AddToggle("DateFreezeTime", {
        Text = "Date Freeze Time", Default = false,
        Callback = function(v) St.dateFrz = v == true; if v then PD.St = nil; PD.LS = 0 end end,
    })
    local Queen = Tabs.Boss:AddGroupbox({ Side = "Right", Name = "Queen", IconName = Ico.Mercy })
    Queen:AddButton({ Text = "Break Shield", Func = function() h.BreakQueen(true) end })
end
do
    local Saves = Tabs.Settings:AddGroupbox({ Side = "Left", Name = "Saves", IconName = "save" })
    Saves:AddInput("ConfigName", { Text = "Name", Default = "Default", Numeric = false, Finished = false, Placeholder = "Config name...", Callback = function(v) CN = tostring(v or "Default") end })
    Saves:AddDropdown("ConfigFile", { Values = h.ListCfg(), Default = "Default", Text = "File", Callback = function(o) CN = o end })
    Saves:AddButton({ Text = "Save", Func = function() local n = CN; if not n or n == "" then n = "Default" end; h.SaveCfg(n); Library:Notify({ Title = "Saved", Description = "Config '" .. n .. "' saved.", Time = 3 }) end })
    Saves:AddButton({ Text = "Load", Func = function() local n = CN; if not n or n == "" then n = "Default" end; h.LoadCfg(n); Library:Notify({ Title = "Loaded", Description = "Config '" .. n .. "' loaded.", Time = 3 }) end })
    Saves:AddButton({ Text = "Delete", Func = function() local n = CN; if not n or n == "" or n == "Default" then return end; h.DelCfg(n); Library:Notify({ Title = "Deleted", Description = "Config '" .. n .. "' deleted.", Time = 3 }) end })
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
Rs.Heartbeat:Connect(function(dt)
    local needTP = St.tpInf
    local needHP = St.hpInf
    local needGod = St.god
    local needClear = St.delAtk
    local needDefend = St.autoDef
    local needDumb = St.dumb
    local needAntiFail = St.antiFail
    local needDate = St.dateFrz
    local needYellow = St.autoSpam or St.noCharge
    local needSusie = St.susieAct
    local needAutoDate = St.autoDate
    local needFreeSoul = St.freeSoul
    local needShowHP = St.showHP
    local needAntiSteal = St.antiSteal
    local needs = needTP or needHP or needGod or needFreeSoul or needClear or needDefend or needDumb or needAntiFail or needDate or needYellow or needSusie or needAutoDate or needShowHP or needAntiSteal
    if not needs then
        Acc.g = 0; Acc.cl = 0; Acc.st = 0; Acc.hp2 = 0; Acc.dt = 0; Acc.atk = 0; Acc.af = 0; Acc.yl = 0; Acc.tp2 = 0; Acc.hp3 = 0; Acc.ad = 0; Acc.as = 0
        local cached = LBC.Battle
        if type(cached) == "table" and h.IsTermCtrl(cached) then h.SoftRecover() end
        return
    end
    local cached = LBC.Battle
    if type(cached) == "table" and h.IsTermCtrl(cached) then h.SoftRecover(); return end
    if needClear or needYellow or needAntiFail or needDefend or needDumb or needAutoDate or needFreeSoul or needShowHP then
        pcall(h.LifecycleTick)
    elseif Acc.g == 0 or Acc.g >= 1.0 then
        pcall(h.LifecycleTick)
    end
    Acc.g = Acc.g + dt
    Acc.cl = Acc.cl + dt
    Acc.st = Acc.st + dt
    local updateStats = Acc.st >= 0.1
    if updateStats then Acc.st = 0 end
    local b = LBC.Battle
    if type(b) == "table" and not h.IsTermCtrl(b) then
        if needClear and Acc.cl >= 0.15 then
            Acc.cl = 0
            pcall(h.NukeBullets)
        end
        if needTP then
            Acc.tp2 = Acc.tp2 + dt
            if Acc.tp2 >= 0.2 then
                Acc.tp2 = 0
                local max = h.TpMax()
                local tm = tonumber(rawget(b, "TensionMax")) or max
                if tm < 1 then tm = max end
                local set = math.min(max, tm)
                if tonumber(rawget(b, "Tension")) ~= set then
                    rawset(b, "Tension", set)
                    local bar = rawget(b, "TensionBar")
                    if type(bar) == "table" then
                        if type(bar.Snap) == "function" then pcall(function() bar:Snap(set) end)
                        else rawset(bar, "Apparent", set); rawset(bar, "Current", set) end
                    end
                end
            end
        else Acc.tp2 = 0 end
        if needGod or needHP or needDefend then
            Acc.hp3 = Acc.hp3 + dt
            local doHp = needHP and Acc.hp3 >= 0.25
            local doGod = needGod and (updateStats or doHp)
            local doDef = needDefend and updateStats
            if doHp then Acc.hp3 = 0 end
            if doGod then
                pcall(function()
                    h.ForEachSoul(b, function(s) h.PatchSoulGod(s) end)
                end)
            end
            if doHp or doGod or doDef then
                local r = rawget(b, "Roster")
                local m = type(r) == "table" and rawget(r, "Members") or nil
                if type(m) == "table" then
                    for _, mem in pairs(m) do
                        if type(mem) == "table" and h.IsLocal(mem) then
                            if doGod then h.PatchMemGod(mem) end
                            if doHp then
                                local mh = tonumber(rawget(mem, "MaxHP"))
                                if mh and mh > 0 and tonumber(rawget(mem, "HP")) ~= mh then
                                    rawset(mem, "HP", mh)
                                    rawset(mem, "Down", false)
                                    rawset(mem, "Swooned", false)
                                end
                            end
                        end
                    end
                end
            end
            if doDef then pcall(h.AutoDefStep) end
        else Acc.hp3 = 0 end
        if needFreeSoul and updateStats then
            h.ForEachSoul(b, function(s) h.PatchFreeSoul(s) end)
        end
    end
    if Acc.g >= 0.25 then Acc.g = 0 end
    if not needClear then Acc.cl = 0 end
    if needDate then
        Acc.dt = Acc.dt + dt
        if Acc.dt >= 1.0 then Acc.dt = 0; pcall(h.DateFrzStep) end
    else Acc.dt = 0 end
    if needDumb then
        Acc.atk = Acc.atk + dt
        if Acc.atk >= 0.6 then Acc.atk = 0; pcall(h.DumbStep) end
    else Acc.atk = 0 end
    if needAntiFail then
        Acc.af = Acc.af + dt
        if Acc.af >= 0.12 then Acc.af = 0; pcall(h.AntiFailStep) end
    else Acc.af = 0 end
    if needYellow then
        Acc.yl = Acc.yl + dt
        if Acc.yl >= 0.1 then Acc.yl = 0; pcall(h.YellowStep) end
    else Acc.yl = 0 end
    if needSusie and updateStats then pcall(h.SusieStep) end
    if needAutoDate then
        Acc.ad = Acc.ad + dt
        if Acc.ad >= 0.8 then Acc.ad = 0; pcall(h.AutoDateStep) end
    else Acc.ad = 0 end
    if needAntiSteal then
        Acc.as = Acc.as + dt
        if Acc.as >= 1.0 then Acc.as = 0; pcall(h.AntiStealStep) end
    else Acc.as = 0 end
end)
Rs.Stepped:Connect(function()
    if St.gShield then pcall(h.GersonShieldStep) end
    if St.gRude then pcall(function() h.GersonRudeStep(true) end)
    elseif St.gAuto then pcall(function() h.GersonRudeStep(false) end) end
end)
