local VERSION = "0.0.8V"

local function SafeHttpGet(url)
    if type(game.HttpGet) == "function" then
        local ok, res = pcall(function() return game:HttpGet(url) end)
        if ok and type(res) == "string" and #res > 50 then return res end
    end
    if type(game.HttpGetAsync) == "function" then
        local ok, res = pcall(function() return game:HttpGetAsync(url) end)
        if ok and type(res) == "string" and #res > 50 then return res end
    end
    local req = (syn and syn.request) or (http and http.request) or http_request or request
    if type(req) == "function" then
        local ok, res = pcall(function() return req({ Url = url, Method = "GET" }) end)
        if ok and type(res) == "table" then
            local body = res.Body or res.body
            if type(body) == "string" and #body > 50 then return body end
        end
    end
    return nil
end

local function SafeLoad(url)
    local src = SafeHttpGet(url)
    if type(src) ~= "string" then return nil end
    local loader = loadstring or load
    if type(loader) ~= "function" then return nil end
    local ok, fn = pcall(loader, src)
    if not ok or type(fn) ~= "function" then return nil end
    local ok2, result = pcall(fn)
    if not ok2 then return nil end
    return result
end

local repoUrls = {
    "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/",
    "https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/",
}

local Library, ThemeManager, SaveManager, repo
for i = 1, #repoUrls do
    local base = repoUrls[i]
    local result = SafeLoad(base .. "Library.lua")
    if type(result) == "table" and type(result.CreateWindow) == "function" then
        Library = result
        repo = base
        break
    end
end

if type(Library) ~= "table" or type(Library.CreateWindow) ~= "function" then
    return
end

do
    local tm = SafeLoad(repo .. "addons/ThemeManager.lua")
    if type(tm) == "table" then ThemeManager = tm else ThemeManager = nil end
end
do
    local sm = SafeLoad(repo .. "addons/SaveManager.lua")
    if type(sm) == "table" then SaveManager = sm else SaveManager = nil end
end

local genv = (getgenv and getgenv()) or _G
if genv.GourdyUnload then pcall(genv.GourdyUnload) end

local Options = Library.Options or {}
local Toggles = Library.Toggles or {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local VIM
pcall(function() VIM = game:GetService("VirtualInputManager") end)

local Running = true
local Conns = {}
local State = { ToT = false, Hiding = false }
local FarmToken, ToTToken = 0, 0
local Hover
local StatusLabel, CountLabel
local SkipUntil, MachineTime, MachineLast = {}, {}, {}
local ForceRescan = true
local LastCur, RisingUntil = {}, {}
local LastSafe

State.LostInterestAt = 0
State.LostInterestUntil = 0
State.CurGen = nil
State.WorkingGen = nil
State.SpottedUntil = 0
State.Moving = 0
State.KeysDown = {}
State.SprintKey = Enum.KeyCode.LeftShift
State.espBudget = 20

local CurrentMap
local LastMapUpdate = 0

local function updateCurrentMap()
    local map = Workspace:FindFirstChild("CurrentMap") or Workspace:FindFirstChild("CurrentRoom")
    if map ~= CurrentMap then
        CurrentMap = map
        ForceRescan = true
        LastMapUpdate = tick()
        State.MapGeneration = (State.MapGeneration or 0) + 1
    end
end

Conns.MapWatch = RunService.Heartbeat:Connect(function()
    if not Running then return end
    if tick() - LastMapUpdate > 0.05 then
        updateCurrentMap()
    end
end)

local function T(name) return Toggles[name] and Toggles[name].Value end
local function O(name) return Options[name] and Options[name].Value end

State.NotifyAt = {}
local function notifyOnce(key, text, secs)
    if tick() - (State.NotifyAt[key] or 0) < 6 then return end
    State.NotifyAt[key] = tick()
    pcall(function() Library:Notify(text, secs or 3) end)
end

local function Status(text)
    if StatusLabel then pcall(function() StatusLabel:SetText("Status: " .. text) end) end
end

local function getChar()
    local c = LocalPlayer.Character
    if not c then return end
    local h = c:FindFirstChildOfClass("Humanoid")
    local r = c:FindFirstChild("HumanoidRootPart")
    if h and r and h.Health > 0 then return c, h, r end
end

local function keyDown(kc)
    if not VIM or State.KeysDown[kc] then return end
    State.KeysDown[kc] = true
    pcall(function() VIM:SendKeyEvent(true, kc, false, game) end)
end

local function keyUp(kc)
    if not VIM or not State.KeysDown[kc] then return end
    State.KeysDown[kc] = nil
    pcall(function() VIM:SendKeyEvent(false, kc, false, game) end)
end

local function releaseAllKeys()
    for kc in pairs(State.KeysDown) do
        pcall(function() VIM:SendKeyEvent(false, kc, false, game) end)
    end
    State.KeysDown = {}
end

local function directionToKeys(worldDir)
    local cam = Workspace.CurrentCamera
    if not cam then return { Enum.KeyCode.W } end
    local look = cam.CFrame.LookVector * Vector3.new(1, 0, 1)
    local right = cam.CFrame.RightVector * Vector3.new(1, 0, 1)
    if look.Magnitude < 0.01 then look = Vector3.new(0, 0, -1) end
    if right.Magnitude < 0.01 then right = Vector3.new(1, 0, 0) end
    look = look.Unit
    right = right.Unit
    local flat = worldDir * Vector3.new(1, 0, 1)
    if flat.Magnitude < 0.05 then return { Enum.KeyCode.W } end
    flat = flat.Unit
    local f = flat:Dot(look)
    local r = flat:Dot(right)
    local keys = {}
    if f > 0.35 then keys[#keys + 1] = Enum.KeyCode.W end
    if f < -0.35 then keys[#keys + 1] = Enum.KeyCode.S end
    if r > 0.35 then keys[#keys + 1] = Enum.KeyCode.D end
    if r < -0.35 then keys[#keys + 1] = Enum.KeyCode.A end
    if #keys == 0 then keys[1] = Enum.KeyCode.W end
    return keys
end

local function holdWASD(worldDir, duration, alive, sprint)
    if not VIM then return false end
    local keys = directionToKeys(worldDir)
    for _, k in ipairs(keys) do keyDown(k) end
    if sprint then keyDown(State.SprintKey) end
    local t0 = tick()
    while alive() and tick() - t0 < duration do
        local newKeys = directionToKeys(worldDir)
        local want = {}
        for _, k in ipairs(newKeys) do want[k] = true end
        for k in pairs(State.KeysDown) do
            if k ~= State.SprintKey and not want[k] then keyUp(k) end
        end
        for _, k in ipairs(newKeys) do keyDown(k) end
        if sprint then keyDown(State.SprintKey) end
        task.wait()
    end
    releaseAllKeys()
    return true
end

local CATS = {
    Items      = { names = { "items" },             color = Color3.fromRGB(80, 255, 120) },
    Generators = { names = { "generators" },        color = Color3.fromRGB(0, 180, 255), highlight = true },
    Monsters   = { names = { "monsters" },          color = Color3.fromRGB(255, 50, 50), highlight = true },
    ToT        = { names = { "trickortreatdoors", "trickortreatdoor_origin" }, color = Color3.fromRGB(255, 170, 0) },
    Toons      = { names = {}, color = Color3.fromRGB(150, 210, 255) },
}
local CAT_ORDER = { "Items", "Generators", "Monsters", "ToT" }

local ESPThemes = {
    Default = {
        Items = Color3.fromRGB(80, 255, 120),
        Generators = Color3.fromRGB(0, 180, 255),
        Monsters = Color3.fromRGB(255, 50, 50),
        ToT = Color3.fromRGB(255, 170, 0),
        Toons = Color3.fromRGB(150, 210, 255),
    },
    Neon = {
        Items = Color3.fromRGB(120, 255, 160),
        Generators = Color3.fromRGB(50, 210, 255),
        Monsters = Color3.fromRGB(255, 80, 120),
        ToT = Color3.fromRGB(255, 200, 50),
        Toons = Color3.fromRGB(100, 255, 220),
    },
    Pastel = {
        Items = Color3.fromRGB(170, 240, 180),
        Generators = Color3.fromRGB(160, 210, 240),
        Monsters = Color3.fromRGB(240, 150, 150),
        ToT = Color3.fromRGB(240, 200, 140),
        Toons = Color3.fromRGB(200, 220, 240),
    },
    Mono = {
        Items = Color3.fromRGB(220, 220, 220),
        Generators = Color3.fromRGB(200, 200, 200),
        Monsters = Color3.fromRGB(255, 220, 220),
        ToT = Color3.fromRGB(210, 210, 210),
        Toons = Color3.fromRGB(240, 240, 240),
    },
}

local function baseColor(cat)
    if cat == "Toons" then return Color3.fromRGB(150, 210, 255) end
    return CATS[cat] and CATS[cat].color or Color3.new(1, 1, 1)
end

local function catColor(cat)
    local themeName = O("ESPTheme") or "Default"
    local theme = ESPThemes[themeName] or ESPThemes.Default
    local themeCol = theme[cat] or baseColor(cat)

    local pickerKey = (cat == "Toons") and "ToonColor" or ("Color_" .. cat)
    local picker = Options[pickerKey]
    if picker and typeof(picker.Value) == "Color3" then
        local base = baseColor(cat)
        local v = picker.Value
        if math.abs(v.R - base.R) > 0.005
            or math.abs(v.G - base.G) > 0.005
            or math.abs(v.B - base.B) > 0.005 then
            return v
        end
    end
    return themeCol
end

local twistedInfoCache = {}

local function readValueObj(d)
    if not d then return nil end
    if d:IsA("ValueBase") then
        local ok, v = pcall(function() return d.Value end)
        if ok then return v end
        return nil
    end
    local v = d:FindFirstChild("Value", true)
    if v and v:IsA("ValueBase") then
        local ok, val = pcall(function() return v.Value end)
        if ok then return val end
    end
    return nil
end

local function readTwistedAbility(unit)
    local abilities = unit:FindFirstChild("Abilities")
    if not abilities then return nil end
    local cdPart = abilities:FindFirstChild("CurrentCooldown", true)
    if not cdPart then return nil end
    local n = tonumber(readValueObj(cdPart))
    if not n or n <= 0 then return nil end
    return n
end

local function readTwistedInfo(unit)
    if unit.Name:lower():find("squirm", 1, true) then
        return { skip = true }
    end

    local patrol, run, chasing = nil, nil, nil
    for _, d in ipairs(unit:GetDescendants()) do
        local n = d.Name
        if n == "PatrolSpeed" then
            local v = tonumber(readValueObj(d))
            if v then patrol = v end
        elseif n == "RunSpeed" then
            local v = tonumber(readValueObj(d))
            if v then run = v end
        elseif n == "ChasingValue" or n == "Chasing" then
            local v = readValueObj(d)
            if v ~= nil and v ~= "" and v ~= false and v ~= 0 then
                chasing = tostring(v)
            end
        end
    end

    local speed = patrol
    if chasing then speed = run or patrol end

    local faster = false
    if speed then
        local _, hum = getChar()
        if hum then faster = speed > hum.WalkSpeed end
    end

    return {
        speed = speed,
        runSpeed = run,
        isFaster = faster,
        chasing = chasing,
        abilityCD = readTwistedAbility(unit),
        skip = false,
    }
end

local function twistedInfoCached(unit)
    local c = twistedInfoCache[unit]
    if c and tick() - c.tick < 0.6 then return c.data end
    local data = readTwistedInfo(unit)
    twistedInfoCache[unit] = { data = data, tick = tick() }
    return data
end

local Roots, Cache, NameSets = {}, {}, {}
local BlackNames, BlacklistUnits = {}, {}
for cat in pairs(CATS) do Roots[cat] = {} Cache[cat] = {} end

local function buildNameSets()
    for cat, def in pairs(CATS) do
        local set = {}
        for _, n in ipairs(def.names) do set[n] = true end
        local extra = O("Extra_" .. cat)
        if type(extra) == "string" then
            for piece in extra:gmatch("[^,]+") do
                local n = piece:match("^%s*(.-)%s*$"):lower()
                if n ~= "" then set[n] = true end
            end
        end
        NameSets[cat] = set
    end
end

local function units(cat) return Cache[cat] or {} end

local function basePart(obj)
    if not obj then return nil end
    if obj:IsA("BasePart") then return obj end
    if obj:IsA("Model") then
        return obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart", true)
    end
    return obj:FindFirstChildWhichIsA("BasePart", true)
end

local function rebuildBlackNames()
    for cat in pairs(CATS) do
        local black = {}
        local bl = O("Blacklist_" .. cat)
        if type(bl) == "string" then
            for piece in bl:gmatch("[^,]+") do
                local n = piece:match("^%s*(.-)%s*$"):lower()
                if n ~= "" then black[#black + 1] = n end
            end
        end
        BlackNames[cat] = black
    end
end

local function isBlacklisted(cat, u)
    if BlacklistUnits[u] then return true end
    local list = BlackNames[cat]
    if list and #list > 0 then
        local n = u.Name:lower()
        for _, b in ipairs(list) do
            if n:find(b, 1, true) then return true end
        end
    end
    return false
end

local function findRoots()
    buildNameSets()
    rebuildBlackNames()
    local new = {}
    for cat in pairs(CATS) do new[cat] = {} end
    for _, d in ipairs(Workspace:GetDescendants()) do
        if not d:IsA("BasePart") then
            local n = d.Name:lower()
            for cat, set in pairs(NameSets) do
                if set[n] then new[cat][#new[cat] + 1] = d end
            end
        end
    end
    Roots = new
end

local function isContainer(m)
    local subs = 0
    for _, c in ipairs(m:GetChildren()) do
        if c:IsA("BasePart") then return false end
        if c:IsA("Model") then subs = subs + 1 end
    end
    return subs >= 2
end

local function collectUnits(cat)
    local out, seen = {}, {}
    local function add(u)
        if not seen[u] then
            seen[u] = true
            if not isBlacklisted(cat, u) then out[#out + 1] = u end
        end
    end
    local function walk(parent, depth)
        if depth > 12 then return end
        for _, c in ipairs(parent:GetChildren()) do
            if c:IsA("BasePart") then
                add(c)
            elseif c:IsA("Model") then
                if isContainer(c) then walk(c, depth + 1) else add(c) end
            elseif c:IsA("Folder") then
                walk(c, depth + 1)
            end
        end
    end
    for _, r in ipairs(Roots[cat]) do
        if r.Parent then walk(r, 0) end
    end
    return out
end

Conns.DescAdded = Workspace.DescendantAdded:Connect(function(d)
    if d:IsA("BasePart") then return end
    local n = d.Name:lower()
    for cat, set in pairs(NameSets) do
        if set[n] then
            local list = Roots[cat]
            local exists = false
            for _, r in ipairs(list) do if r == d then exists = true break end end
            if not exists then list[#list + 1] = d end
        end
    end
end)

local StatCache = {}

local function attrLookup(inst, lname, contains)
    for k in pairs(inst:GetAttributes()) do
        local lk = k:lower()
        if lk == lname or (contains and lk:find(lname, 1, true)) then return k end
    end
end

local function findStatRef(unit, lname, contains)
    for pass = 1, 2 do
        if pass == 2 and not contains then break end
        local loose = pass == 2
        local k = attrLookup(unit, lname, loose)
        if k then return { kind = "attr", inst = unit, key = k } end
        for _, d in ipairs(unit:GetDescendants()) do
            local ln = d.Name:lower()
            if d:IsA("ValueBase") and (ln == lname or (loose and ln:find(lname, 1, true))) then
                return { kind = "val", inst = d }
            end
            local ak = attrLookup(d, lname, loose)
            if ak then return { kind = "attr", inst = d, key = ak } end
        end
    end
end

local function readRef(ref)
    if ref.kind == "attr" then return ref.inst:GetAttribute(ref.key) end
    local ok, v = pcall(function() return ref.inst.Value end)
    if ok then return v end
    return nil
end

local function getStat(unit, lname, contains)
    local uc = StatCache[unit]
    if not uc then uc = {} StatCache[unit] = uc end
    local e = uc[lname]
    if not e then e = { tried = 0 } uc[lname] = e end
    if e.ref and not e.ref.inst.Parent then e.ref = nil end
    if not e.ref and tick() - e.tried > 1 then
        e.tried = tick()
        e.ref = findStatRef(unit, lname, contains)
    end
    if e.ref then return readRef(e.ref) end
    return nil
end

local function toBool(v)
    if v == nil then return nil end
    if type(v) == "boolean" then return v end
    if type(v) == "number" then return v ~= 0 end
    if type(v) == "string" then
        local s = v:lower()
        return s == "true" or s == "yes" or s == "on" or s == "1"
    end
    return nil
end

local function toNum(v)
    if type(v) == "number" then return v end
    if type(v) == "string" then return tonumber(v) end
    if type(v) == "boolean" then return v and 1 or 0 end
    return nil
end

local function machineInfo(unit)
    return {
        cur = toNum(getStat(unit, "currentamount")),
        req = toNum(getStat(unit, "requiredamount")),
        connie = toBool(getStat(unit, "connie", true)),
        completed = toBool(getStat(unit, "completed")),
    }
end

local function isTreadmill(unit)
    if not unit then return false end
    if unit.Name:lower():find("treadmill", 1, true) then return true end
    for _, d in ipairs(unit:GetDescendants()) do
        if d.Name:lower():find("treadmill", 1, true) then return true end
    end
    return false
end

local function fmt(n)
    if n == nil then return "?" end
    if math.abs(n - math.floor(n + 0.5)) < 1e-4 then return tostring(math.floor(n + 0.5)) end
    return (string.format("%.2f", n):gsub("0+$", ""):gsub("%.$", ""))
end

local function hex(c)
    return string.format("#%02X%02X%02X",
        math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
end

local function progColor(p)
    p = math.clamp(p, 0, 1)
    local red, yel, grn = Color3.fromRGB(255, 70, 70), Color3.fromRGB(255, 220, 60), Color3.fromRGB(80, 255, 120)
    if p < 0.5 then return red:Lerp(yel, p * 2) end
    return yel:Lerp(grn, (p - 0.5) * 2)
end

local DONE_ATTRS = { "Done", "Finished", "Full", "IsDone", "Repaired" }
local function isDone(unit)
    local info = machineInfo(unit)
    if info.completed == true then return true end
    if info.cur and info.req and info.req > 0 and info.cur >= info.req then return true end
    if info.completed == false then return false end
    for _, n in ipairs(DONE_ATTRS) do
        if unit:GetAttribute(n) == true then return true end
    end
    local sawPrompt, anyEnabled = false, false
    for _, d in ipairs(unit:GetDescendants()) do
        if d:IsA("ProximityPrompt") then
            sawPrompt = true
            if d.Enabled then anyEnabled = true end
        end
    end
    if sawPrompt and not anyEnabled then return true end
    return false
end

local function skip(unit, seconds) SkipUntil[unit] = tick() + seconds end
local function isSkipped(unit) return SkipUntil[unit] and SkipUntil[unit] > tick() end

local twCache = { tick = 0, parts = {} }
local function twistedParts()
    if tick() - twCache.tick < 0.12 then return twCache.parts end
    local list = {}
    for _, m in ipairs(units("Monsters")) do
        local p = basePart(m)
        if p and p.Parent then list[#list + 1] = p end
    end
    twCache.parts = list
    twCache.tick = tick()
    return list
end

local function nearestOf(parts, pos)
    local best, bd
    for _, p in ipairs(parts) do
        local d = (p.Position - pos).Magnitude
        if not bd or d < bd then best, bd = p, d end
    end
    return best, bd
end

local function findSafePosition(fromPos, minDist)
    minDist = minDist or (O("DodgeDistance") or 34) + 12
    local tw = twistedParts()
    if #tw == 0 then return fromPos end
    local bestPos, bestScore = fromPos, -math.huge
    for _, deg in ipairs({0, 45, 90, 135, 180, 225, 270, 315, 30, 60, 120, 150}) do
        local rad = math.rad(deg)
        local dir = Vector3.new(math.cos(rad), 0, math.sin(rad))
        local candidate = fromPos + dir * minDist
        local score = math.huge
        for _, t in ipairs(tw) do
            score = math.min(score, (candidate - t.Position).Magnitude)
        end
        if score > bestScore then
            bestScore, bestPos = score, candidate
        end
    end
    return bestPos
end

local function twistedDanger(pos)
    if not T("AvoidTwisted") then return false end
    if tick() < State.LostInterestUntil then return false end
    local tp, d = nearestOf(twistedParts(), pos)
    if tp and d < (O("DodgeDistance") or 34) then return true, tp, d end
    return false
end

local function moveDanger()
    if not T("AvoidTwisted") then return false end
    if tick() < State.LostInterestUntil then return false end
    local _, _, r = getChar()
    if not r then return true end
    local tp, d = nearestOf(twistedParts(), r.Position)
    if not tp or not d or d >= (O("DodgeDistance") or 34) then return false end
    local want = O("SpottedEvent")
    if type(want) == "string" and want:match("%S") then
        return State.SpottedUntil > tick()
    end
    return true
end

local function hideMoveMode()
    local m = O("HideMove") or "Smooth TP"
    if m == "TP" or m == "Noclip Into Part" then return "Smooth TP" end
    return m
end

local function zeroVel(root)
    pcall(function()
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end)
end

local function placeAt(root, pos)
    local look = root.CFrame.LookVector
    local flat = Vector3.new(look.X, 0, look.Z)
    local cf = flat.Magnitude > 0.01 and CFrame.lookAt(pos, pos + flat.Unit) or CFrame.new(pos)
    local c = root.Parent
    local ok = false
    if c and c:IsA("Model") then
        ok = pcall(function()
            c:PivotTo(cf * (root.CFrame:Inverse() * c:GetPivot()))
        end)
    end
    if not ok then root.CFrame = cf end
    zeroVel(root)
end

local function setHover(vec) Hover = vec or Vector3.zero end

local function clearHover()
    Hover = nil
    local _, hum, root = getChar()
    if root then zeroVel(root) end
    if hum and hum.PlatformStand then hum.PlatformStand = false end
end

Conns.FloatStep = RunService.Stepped:Connect(function(_, dt)
    if not Hover then return end
    local _, hum, root = getChar()
    if not root then return end
    if not hum.PlatformStand then hum.PlatformStand = true end
    root.AssemblyLinearVelocity = Hover + Vector3.new(0, Workspace.Gravity * (dt or 1 / 60), 0)
    root.AssemblyAngularVelocity = Vector3.zero
end)

Conns.CharAdded = LocalPlayer.CharacterAdded:Connect(function()
    Hover = nil
    releaseAllKeys()
    State.Hiding = false
    State.Moving = 0
    LastSafe = nil
end)

Conns.SafePos = RunService.Heartbeat:Connect(function()
    local _, hum, root = getChar()
    if not root then return end
    if hum.FloorMaterial ~= Enum.Material.Air and not State.Hiding then
        LastSafe = root.Position + Vector3.new(0, 3, 0)
    end
    if LastSafe and root.Position.Y < Workspace.FallenPartsDestroyHeight + 40 then
        placeAt(root, LastSafe)
    end
end)

task.spawn(function()
    local folder = game:GetService("ReplicatedStorage"):WaitForChild("StoryEvents", 30)
    if not folder then return end
    local li = folder:WaitForChild("LostInterest", 30)
    if li and li:IsA("RemoteEvent") then
        Conns.LostInterest = li.OnClientEvent:Connect(function()
            if not Running then return end
            State.LostInterestAt = tick()
            State.SpottedUntil = 0
            if T("UseLostInterest") then
                State.LostInterestUntil = tick() + (O("LostInterestGrace") or 3)
            end
        end)
    end
    for _, e in ipairs(folder:GetChildren()) do
        if e:IsA("RemoteEvent") then
            Conns["StoryLog_" .. e.Name] = e.OnClientEvent:Connect(function(...)
                if T("LogStoryEvents") then  end
                local want = O("SpottedEvent")
                if type(want) == "string" and want:match("%S") and (want:lower():gsub("%s", "")) == e.Name:lower() then
                    State.SpottedUntil = tick() + (O("SpottedHold") or 6)
                end
            end)
        end
    end
end)

State.StopCache = setmetatable({}, { __mode = "k" })
State.LastStopFire = 0

local function findStopEvent(unit)
    if unit then
        local c = State.StopCache[unit]
        if c and c.Parent then return c end
        local ev = unit:FindFirstChild("StopInteracting", true)
        if ev and (ev:IsA("RemoteEvent") or ev:IsA("UnreliableRemoteEvent")) then
            State.StopCache[unit] = ev
            return ev
        end
    end
    local ev
    pcall(function()
        ev = Workspace.CurrentRoom.AquariumMap.Generators.Generator.Stats.StopInteracting
    end)
    return ev
end

local function stopInteracting(unit, force)
    if not T("AutoStopInteract") then return end
    local now = tick()
    if not force and now - State.LastStopFire < 0.15 then return end
    State.LastStopFire = now
    local ev = findStopEvent(unit)
    if ev then pcall(function() ev:FireServer("Stop") end) end
end

State.ElevCache = { obj = nil, found = 0, tried = 0 }

local function elevatorPos(obj)
    if obj:IsA("BasePart") then return obj.Position end
    if obj:IsA("Model") then return obj:GetPivot().Position end
    local p = basePart(obj)
    return p and p.Position
end

local function findElevator()
    if State.ElevCache.obj and State.ElevCache.obj.Parent and tick() - State.ElevCache.found < 10 then
        return State.ElevCache.obj
    end
    if tick() - State.ElevCache.tried < 2 then
        return (State.ElevCache.obj and State.ElevCache.obj.Parent) and State.ElevCache.obj or nil
    end
    State.ElevCache.tried = tick()
    local names = { elevator = true }
    local extra = O("ElevatorName")
    if type(extra) == "string" then
        for piece in extra:gmatch("[^,]+") do
            local n = piece:match("^%s*(.-)%s*$"):lower()
            if n ~= "" then names[n] = true end
        end
    end
    local char = LocalPlayer.Character
    local best, bs
    local n = 0
    for _, d in ipairs(Workspace:GetDescendants()) do
        n = n + 1
        if n % 3000 == 0 then task.wait() end
        local ln = d.Name:lower()
        local exact = names[ln]
        if exact or (ln:find("elevator", 1, true) and not ln:find("fake", 1, true)) then
            if not (char and d:IsDescendantOf(char)) and elevatorPos(d) then
                local score = (exact and 0 or 1000) + #ln
                if not bs or score < bs then best, bs = d, score end
            end
        end
    end
    State.ElevCache.obj, State.ElevCache.found = best, tick()
    return best
end

State.AllDoneCache = { v = false, t = 0 }
local function allMachinesDone()
    if tick() - State.AllDoneCache.t < 0.25 then return State.AllDoneCache.v end
    State.AllDoneCache.t = tick()
    local n, result = 0, true
    for _, u in ipairs(units("Generators")) do
        if u.Parent then
            n = n + 1
            if not isDone(u) then result = false break end
        end
    end
    State.AllDoneCache.v = result and n > 0
    return State.AllDoneCache.v
end

local Mv = { scale = 1, pulls = 0, lastPull = 0 }

function Mv.onPull(dev)
    Mv.pulls = Mv.pulls + 1
    Mv.lastPull = tick()
    Mv.scale = math.max(0.25, Mv.scale * 0.65)
end

function Mv.recover(dt)
    Mv.scale = math.min(1, Mv.scale + dt * 0.08)
    if tick() - Mv.lastPull > 3 then Mv.pulls = 0 end
end

function Mv.follow(points, speed, alive, timeout, o)
    o = o or {}
    State.Moving = State.Moving + 1
    local ok, res, why = pcall(function()
        local t0 = tick()
        local idx = 1
        local expected
        local tol = o.tol or 1.5
        local vcap = o.vspeed or 55
        while alive() and tick() - t0 < timeout do
            local dt = math.min(RunService.Heartbeat:Wait(), 0.1)
            local _, _, r = getChar()
            if not r then return false, "dead" end
            if not o.ignoreDanger and moveDanger() then return false, "danger" end
            if expected and (r.Position - expected).Magnitude > math.max(5, speed * Mv.scale * 0.25) then
                Mv.onPull((r.Position - expected).Magnitude)
                if Mv.pulls >= (o.maxPulls or 5) then return false, "pulled" end
                expected = nil
                task.wait(0.12)
            else
                local target = points[idx]
                if not target then return true end
                local diff = target - r.Position
                local dist = diff.Magnitude
                if dist <= tol then
                    idx = idx + 1
                    if idx > #points then
                        placeAt(r, target)
                        return true
                    end
                else
                    local dir = diff / dist
                    local step = speed * Mv.scale * dt
                    local vmax = vcap * Mv.scale * dt
                    if math.abs(dir.Y) * step > vmax then step = vmax / math.abs(dir.Y) end
                    step = math.min(step, dist)
                    local np = r.Position + dir * step
                    placeAt(r, np)
                    expected = np
                    Mv.recover(dt)
                end
            end
        end
        return false, "timeout"
    end)
    State.Moving -= 1
    if not ok then return false, "error" end
    return res, why
end

function Mv.spamTP(pos, alive, timeout)
    local _, _, root = getChar()
    if not root then return false end
    timeout = timeout or 8
    local t0 = tick()
    local lastPos = root.Position
    local tries = 0
    while alive() and tick() - t0 < timeout do
        local _, _, r = getChar()
        if not r then return false end
        local dist = (r.Position - pos).Magnitude
        if dist < 4 then
            placeAt(r, pos)
            zeroVel(r)
            return true
        end
        placeAt(r, pos)
        zeroVel(r)
        tries = tries + 1
        if tries % 3 == 0 then task.wait(0.02) else RunService.Heartbeat:Wait() end
        local _, _, r2 = getChar()
        if r2 then
            if (r2.Position - lastPos).Magnitude > 10 and (r2.Position - pos).Magnitude > dist * 0.65 then
                task.wait(0.05)
            end
            lastPos = r2.Position
        end
    end
    local _, _, rf = getChar()
    if rf then
        placeAt(rf, pos)
        return (rf.Position - pos).Magnitude < 10
    end
    return false
end

local function MoveTo(pos, alive, timeout)
    State.Moving = State.Moving + 1
    local ok, res = pcall(Mv.spamTP, pos, alive, timeout or 8)
    State.Moving -= 1
    releaseAllKeys()
    return ok and res
end

function Mv.hideTravel(dest, alive)
    local hm = hideMoveMode()
    for _ = 1, 3 do
        local _, _, r = getChar()
        if not r then return false end
        if (r.Position - dest).Magnitude < 3 then return true end
        if hm == "Instant TP" then
            placeAt(r, dest)
            task.wait(0.1)
        else
            local speed = (hm == "Tween") and (O("TweenSpeed") or 25) or (O("TPSpeed") or 90)
            local vs = O("HideRiseSpeed") or 60
            local dist = (dest - r.Position).Magnitude
            local eff = math.max(math.min(speed, vs), 10)
            Mv.follow({ dest }, speed, alive, dist / (eff * 0.4) + 3, { vspeed = vs, ignoreDanger = true, tol = 2 })
        end
        local _, _, r2 = getChar()
        if r2 and (r2.Position - dest).Magnitude < 6 then return true end
        if not alive() then return false end
        task.wait(0.2)
    end
    return false
end

local NoclipConnection
local function enableStrongNoclip()
    if NoclipConnection then return end
    NoclipConnection = RunService.Stepped:Connect(function()
        local c = LocalPlayer.Character
        if not c then return end
        for _, v in pairs(c:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end
        end
    end)
end

local function disableStrongNoclip()
    if NoclipConnection then
        NoclipConnection:Disconnect()
        NoclipConnection = nil
    end
end

local Release = {
    fps = 60, sampleTime = 0, frames = 0,
    lagging = false, lowFor = 0, goodFor = 0, itemBudget = math.huge,
    restoredAt = 0, started = tick(), lastSend = tick(), nextSend = 0,
    sending = false, graphics = setmetatable({}, { __mode = "k" }),
}

function Release.escape(text)
    return tostring(text):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
end

function Release.monitor(dt)
    if not Running or dt <= 0 then return end
    Release.frames = Release.frames + 1
    Release.sampleTime = Release.sampleTime + dt
    if Release.sampleTime < 0.5 then return end
    local elapsed = Release.sampleTime
    Release.fps = Release.frames / elapsed
    Release.frames, Release.sampleTime = 0, 0
    local low = O("LagFPS") or 35
    if T("AdaptiveItemESP") ~= false then
        if Release.fps < low then
            Release.lowFor = Release.lowFor + elapsed
            Release.goodFor = 0
            if Release.lowFor >= 1 then
                Release.lagging = true
                Release.itemBudget = O("LagItemLimit") or 5
            end
        elseif Release.fps >= low + 8 then
            Release.lowFor = 0
            Release.goodFor = Release.goodFor + elapsed
            if Release.goodFor >= (O("LagRecovery") or 3) then
                Release.lagging = false
                if tick() - Release.restoredAt >= 1 and Release.itemBudget < math.huge then
                    Release.itemBudget = Release.itemBudget + O("LagRestoreBatch") or 3
                    Release.restoredAt = tick()
                    if Release.itemBudget >= #units("Items") then Release.itemBudget = math.huge end
                end
            end
        else
            Release.lowFor, Release.goodFor = 0, 0
        end
    else
        Release.lagging, Release.itemBudget = false, math.huge
    end
    if Release.fpsLabel then
        Release.fpsLabel:SetText(string.format("FPS %.0f  ·  ESP %s  ·  %s",
            Release.fps, Release.itemBudget == math.huge and "all" or tostring(Release.itemBudget),
            Release.lagging and "trimming" or "normal"))
    end
end

function Release.setProperty(obj, key, value)
    local ok, previous = pcall(function() return obj[key] end)
    if not ok or previous == value then return end
    local record = Release.graphics[obj]
    if not record then record = {} Release.graphics[obj] = record end
    if not record[key] then record[key] = { before = previous, applied = value } end
    pcall(function() obj[key] = value end)
end

function Release.optimizeObject(obj)
    if not Running or not T("FPSBoost") then return end
    if obj:IsA("BasePart") then
        Release.setProperty(obj, "CastShadow", false)
    elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam")
        or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles")
        or obj:IsA("PostEffect") then
        Release.setProperty(obj, "Enabled", false)
    end
end

function Release.restoreGraphics()
    for obj, record in pairs(Release.graphics) do
        for key, entry in pairs(record) do
            pcall(function()
                if obj[key] == entry.applied then obj[key] = entry.before end
            end)
        end
    end
    table.clear(Release.graphics)
end

function Release.boost(enabled)
    if not enabled then Release.restoreGraphics() return end
    Release.setProperty(game:GetService("Lighting"), "GlobalShadows", false)
    task.spawn(function()
        for _, root in ipairs({ Workspace, game:GetService("Lighting") }) do
            for i, obj in ipairs(root:GetDescendants()) do
                if not Running or not T("FPSBoost") then return end
                Release.optimizeObject(obj)
                if i % 200 == 0 then task.wait() end
            end
        end
    end)
end

function Release.webhook(test)
    if not Running or not T("WebhookEnabled") or Release.sending or tick() < Release.nextSend then return end
    local url = tostring(O("DiscordWebhookURL") or ""):match("^%s*(.-)%s*$")
    local valid = false
    for _, host in ipairs({ "discord.com", "discordapp.com", "canary.discord.com", "ptb.discord.com" }) do
        local prefix = "https://" .. host .. "/api/webhooks/"
        if url:sub(1, #prefix) == prefix and url:sub(#prefix + 1):match("^%d+/[%w_%-]+$") then valid = true break end
    end
    if not valid then notifyOnce("webhookURL", "webhook url looks wrong", 4) return end
    local requestFn = (syn and syn.request) or (http and http.request) or http_request or request
    if type(requestFn) ~= "function" then notifyOnce("webhookHTTP", "no http function on this executor", 4) return end
    local fields = {
        { name = "Session", value = tostring(math.floor((tick() - Release.started) / 60)) .. " min", inline = true },
    }
    if T("WebhookPerformance") then
        fields[#fields + 1] = { name = "FPS", value = string.format("%.0f", Release.fps), inline = true }
    end
    if T("WebhookCounts") then
        local done = 0
        for _, u in ipairs(units("Generators")) do if u.Parent and isDone(u) then done = done + 1 end end
        fields[#fields + 1] = { name = "Snapshot", value = string.format("items %d\nmachines %d/%d\ntwisteds %d\ntot %d",
            #units("Items"), done, #units("Generators"), #units("Monsters"), #units("ToT")) }
    end
    if T("WebhookPlayer") then fields[#fields + 1] = { name = "Player", value = LocalPlayer.Name } end
    if T("WebhookMap") then fields[#fields + 1] = { name = "Map", value = CurrentMap and CurrentMap.Name or "?" } end
    local payload = {
        username = "gourdy", allowed_mentions = { parse = {} },
        embeds = {{ title = test and "test" or "stats", color = 0x50FF78,
            fields = fields, footer = { text = VERSION } }},
    }
    Release.sending = true
    Release.nextSend = tick() + 10
    local ok, response = pcall(requestFn, {
        Url = url, Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = HttpService:JSONEncode(payload),
    })
    Release.sending = false
    if not Running then return end
    local code = ok and type(response) == "table" and tonumber(response.StatusCode or response.Status) or 0
    if code and code >= 200 and code < 300 then
        Release.lastSend = tick()
        if test then Library:Notify("sent", 3) end
    elseif code == 429 then
        Release.nextSend = tick() + 60
        notifyOnce("webhookRate", "discord rate limited", 4)
    else
        Release.nextSend = tick() + 60
        notifyOnce("webhookFailed", "webhook failed: " .. tostring(code or 0), 4)
    end
end

function Release.baseplateTarget(from)
    local best, score
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Anchored and obj.CanCollide
            and obj.Name:lower() == tostring(O("BaseplateName") or "Baseplate"):lower() then
            local localPos = obj.CFrame:PointToObjectSpace(from)
            local half = obj.Size / 2
            local top = obj.CFrame:PointToWorldSpace(Vector3.new(
                math.clamp(localPos.X, -math.max(0, half.X - 3), math.max(0, half.X - 3)),
                half.Y, math.clamp(localPos.Z, -math.max(0, half.Z - 3), math.max(0, half.Z - 3))))
            local target = top + Vector3.new(0, 3.5, 0)
            local distance = (target - from).Magnitude
            if target.Y < from.Y and target.Y > Workspace.FallenPartsDestroyHeight + 45
                and (not score or distance < score) then best, score = target, distance end
        end
    end
    return best
end

function Release.verifiedTP(dest, alive)
    local started, stable = tick(), nil
    local char = LocalPlayer.Character
    local generation = State.MapGeneration
    while Running and alive() and State.MapGeneration == generation and LocalPlayer.Character == char
        and tick() - started < (O("UndergroundRetryTimeout") or 20) do
        local _, _, root = getChar()
        if not root then return false end
        if (root.Position - dest).Magnitude <= 4 then
            stable = stable or tick()
            if tick() - stable >= 0.6 then return true end
        else
            stable = nil
            placeAt(root, dest)
        end
        task.wait(0.12)
    end
    return false
end

function Release.walkAway(alive)
    local char, hum, root = getChar()
    if not root then return false end
    stopInteracting(State.CurGen, true)
    clearHover()
    releaseAllKeys()
    local machine = State.CurGen and basePart(State.CurGen)
    local origin = root.Position
    local away = (origin - (machine and machine.Position or (origin - root.CFrame.LookVector))) * Vector3.new(1, 0, 1)
    if away.Magnitude < 0.1 then away = Vector3.new(1, 0, 0) end
    local distance = O("RoofWalkDistance") or 7
    local goal = origin + away.Unit * distance
    State.RoofWalking = true
    disableStrongNoclip()
    local collision = {}
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            collision[part] = part.CanCollide
            if part.Name == "Torso" or part.Name == "UpperTorso" or part.Name == "LowerTorso" then
                part.CanCollide = true
            end
        end
    end
    local ok, reached = pcall(function()
        local start = tick()
        while Running and alive() and LocalPlayer.Character == char and tick() - start < 3 do
            local _, h, r = getChar()
            if not r then return false end
            if ((r.Position - origin) * Vector3.new(1, 0, 1)).Magnitude >= distance - 1 then return true end
            h:MoveTo(goal)
            task.wait(0.05)
        end
        return false
    end)
    pcall(function() hum:MoveTo(root.Position) end)
    for part, previous in pairs(collision) do pcall(function() part.CanCollide = previous end) end
    State.RoofWalking = false
    return ok and reached
end

Conns.FPSMonitor = RunService.RenderStepped:Connect(Release.monitor)
Conns.BoostAdded = Workspace.DescendantAdded:Connect(function(obj) Release.optimizeObject(obj) end)
Conns.BoostLighting = game:GetService("Lighting").DescendantAdded:Connect(function(obj) Release.optimizeObject(obj) end)
Conns.Noclip = RunService.Stepped:Connect(function()
    if State.RoofWalking then return end
    local shouldNoclip = State.Hiding or Hover ~= nil or (T("Noclip") and (T("AutoFarm") or T("AutoToT") or State.Moving > 0))
    if shouldNoclip then enableStrongNoclip() else disableStrongNoclip() end
end)

local HideSpots = {}

local function refreshHideSpots()
    local minT = O("HideThickness") or 5
    local char = LocalPlayer.Character
    local list, n = {}, 0
    for _, d in ipairs(Workspace:GetDescendants()) do
        n = n + 1
        if n % 3000 == 0 then task.wait() end
        if d:IsA("BasePart") and d.Anchored and d.CanCollide then
            local s = d.Size
            if math.min(s.X, s.Y, s.Z) >= minT and not (char and d:IsDescendantOf(char)) then
                local bad = false
                for _, cat in ipairs({ "Monsters", "Items", "Generators" }) do
                    for _, r in ipairs(Roots[cat]) do
                        if d:IsDescendantOf(r) then bad = true break end
                    end
                    if bad then break end
                end
                if not bad then
                    local model = d:FindFirstAncestorOfClass("Model")
                    if model and Players:GetPlayerFromCharacter(model) then bad = true end
                end
                if not bad then list[#list + 1] = d end
            end
        end
    end
    HideSpots = list
end

local function nearestHideSpot(pos, tw)
    local best, bs
    for _, p in ipairs(HideSpots) do
        if p.Parent then
            local score = (p.Position - pos).Magnitude
            local _, td = nearestOf(tw, p.Position)
            if td and td < 12 then score = score + 300 end
            if not bs or score < bs then best, bs = p, score end
        end
    end
    return best
end

local function exitPoint(part, fromPos)
    local s = part.Size
    local axes = {
        { s.X, part.CFrame.RightVector },
        { s.Y, part.CFrame.UpVector },
        { s.Z, part.CFrame.LookVector },
    }
    table.sort(axes, function(a, b) return a[1] < b[1] end)
    local size, dir = axes[1][1], axes[1][2]
    if dir:Dot(fromPos - part.Position) < 0 then dir = -dir end
    return part.Position + dir * (size / 2 + 3.5)
end

local function hideInThickPart(alive, holdFor)
    local _, _, root = getChar()
    if not root then return false end
    releaseAllKeys()
    if #HideSpots == 0 then pcall(refreshHideSpots) end
    local tw = twistedParts()
    local spot = nearestHideSpot(root.Position, tw)
    if not spot then
        notifyOnce("thick", "no thick part around", 3)
        return false
    end
    State.Hiding = true
    Status("hiding in " .. spot.Name)
    local pos = spot.Position
    local startPos = root.Position
    clearHover()
    local reached = false
    for _ = 1, 6 do
        if not alive() then break end
        local _, _, r = getChar()
        if not r then break end
        placeAt(r, pos)
        task.wait(0.07)
        local _, _, r2 = getChar()
        if r2 and (r2.Position - pos).Magnitude < 4 then reached = true break end
    end
    if not reached then
        notifyOnce("thickfail", "couldnt get inside", 3)
        State.Hiding = false
        return false
    end
    setHover(Vector3.zero)
    local t0 = tick()
    local release = (O("DodgeDistance") or 34) + 20
    while alive() and tick() - t0 < (holdFor or O("MaxHideTime") or 25) do
        local _, _, r = getChar()
        if not r then break end
        stopInteracting(State.CurGen, true)
        if (r.Position - pos).Magnitude > 2.5 then placeAt(r, pos) end
        if not holdFor then
            if T("UseLostInterest") and State.LostInterestAt > t0 then break end
            local _, td = nearestOf(twistedParts(), r.Position)
            if not td or td > release then break end
        end
        task.wait(0.08)
    end
    local _, _, r = getChar()
    if r then
        local out = exitPoint(spot, startPos)
        for _ = 1, 4 do
            placeAt(r, out)
            task.wait(0.06)
            local _, _, rr = getChar()
            if rr and (rr.Position - out).Magnitude < 4 then break end
            r = rr or r
        end
    end
    clearHover()
    State.Hiding = false
    return true
end

local RoofCache = { y = nil, t = 0 }

local function roofHeight(pos)
    if RoofCache.generation ~= State.MapGeneration then
        RoofCache.y, RoofCache.pos = nil, nil
        RoofCache.generation = State.MapGeneration
    end
    local override = O("HideRoofOverride") or 0
    if override > 0 then return override end
    pos = pos or Vector3.zero
    if RoofCache.y and RoofCache.pos and tick() - RoofCache.t < 30
        and ((RoofCache.pos - pos) * Vector3.new(1, 0, 1)).Magnitude < 120 then
        return RoofCache.y
    end
    local char = LocalPlayer.Character
    local top, n = nil, 0
    for _, d in ipairs(Workspace:GetDescendants()) do
        n = n + 1
        if n % 3000 == 0 then task.wait() end
        if d:IsA("BasePart") and d.Anchored and d.CanCollide then
            local s = d.Size
            if math.max(s.X, s.Y, s.Z) < 2000 and not (char and d:IsDescendantOf(char))
                and ((d.Position - pos) * Vector3.new(1, 0, 1)).Magnitude < 400 then
                local y = d.Position.Y + s.Y / 2
                if not top or y > top then top = y end
            end
        end
    end
    RoofCache.y, RoofCache.t, RoofCache.pos = top or (pos.Y + 60), tick(), pos
    return RoofCache.y
end

local function machineUnsafe(g)
    local p = g and g.Parent and basePart(g)
    if not p then return false end
    local _, d = nearestOf(twistedParts(), p.Position)
    return d ~= nil and d < (O("SafeGenDistance") or 45)
end

local function findFakeElevator()
    local c = State.FakeElev
    if c and c.Parent then return c end
    if tick() - (State.FakeElevTried or 0) < 2 then return nil end
    State.FakeElevTried = tick()
    local found
    pcall(function() found = Workspace.CurrentRoom.EmotionMap.FreeArea.FakeElevator end)
    if not found then
        local room = Workspace:FindFirstChild("CurrentRoom")
        found = (room and room:FindFirstChild("FakeElevator", true)) or Workspace:FindFirstChild("FakeElevator", true)
    end
    State.FakeElev = found
    return found
end

local function hideHigh(alive, holdFor)
    local _, _, root = getChar()
    if not root then return false end
    local mode = O("HideMode") or "Map Roof"
    if mode == "FakeElevator TP" then mode = "FakeElevator"
    elseif mode == "Fake Elevator" then mode = "Map Roof" end
    if mode == "Map Roof" then
        if not Release.walkAway(alive) then
            notifyOnce("roofwalk", "couldnt walk away from machine", 3)
            return false
        end
        local _, _, movedRoot = getChar()
        if not movedRoot then return false end
        root = movedRoot
    end
    local startPos = root.Position
    local height = O("HideHeight") or 10
    local landPos = startPos
    local dest

    local function machineLand()
        local g = State.CurGen
        local gp = g and g.Parent and basePart(g)
        return gp and (gp.Position + Vector3.new(0, 3, 0)) or startPos
    end

    if mode == "Machine Top" then
        local tw = twistedParts()
        local best, bs
        for _, u in ipairs(units("Generators")) do
            local p = basePart(u)
            if p and p.Parent then
                local _, td = nearestOf(tw, p.Position)
                local score = (p.Position - startPos).Magnitude
                if td and td < (O("SafeGenDistance") or 45) then score = score + 400 end
                if not bs or score < bs then best, bs = p, score end
            end
        end
        if not best then
            notifyOnce("mtop", "no machine", 3)
            return false
        end
        dest = best.Position + Vector3.new(0, best.Size.Y / 2 + 4, 0)
        landPos = best.Position + Vector3.new(0, 3, 0)
    elseif mode == "FakeElevator" then
        local fe = findFakeElevator()
        local fp = fe and elevatorPos(fe)
        if not fp then
            notifyOnce("fakeelev", "no fake elevator", 3)
            return false
        end
        dest = fp + Vector3.new(0, O("FakeElevOffset") or 3, 0)
        landPos = machineLand()
    elseif mode == "Elevator" then
        local el = findElevator()
        local ep = el and elevatorPos(el)
        if not ep then
            notifyOnce("elev", "no elevator", 3)
            return false
        end
        dest = ep + Vector3.new(0, O("ElevatorYOffset") or 3, 0)
        landPos = machineLand()
    elseif mode == "Underground" then
        dest = Release.baseplateTarget(startPos)
        if not dest then
            notifyOnce("under", "no baseplate below", 4)
            return false
        end
    else
        local override = O("HideRoofOverride") or 0
        local y
        if override > 0 then
            y = override + height
        else
            y = math.clamp(roofHeight(startPos) + height, startPos.Y + 15, startPos.Y + (O("MaxClimb") or 140))
        end
        dest = Vector3.new(startPos.X, y, startPos.Z)
    end
    local ground = Vector3.new(dest.X, startPos.Y, dest.Z)

    releaseAllKeys()
    State.Hiding = true
    setHover(Vector3.zero)
    local reached = false
    local ok, err = pcall(function()
        Status("hiding " .. mode)
        reached = mode == "Underground" and Release.verifiedTP(dest, alive) or (mode ~= "Underground" and Mv.hideTravel(dest, alive))
        if not reached then
            notifyOnce("hidepull", "hide spot not reachable", 4)
            return
        end
        local t0 = tick()
        local release = (O("DodgeDistance") or 34) + 20
        local elev = (mode == "FakeElevator" or mode == "Elevator")
        while alive() and tick() - t0 < (holdFor or O("MaxHideTime") or 25) do
            local _, _, r = getChar()
            if not r then break end
            if r.Position.Y < Workspace.FallenPartsDestroyHeight + 30 then break end
            stopInteracting(State.CurGen)
            local dd = (r.Position - dest).Magnitude
            if dd > 25 then
                if mode == "Underground" then Release.verifiedTP(dest, alive) else Mv.hideTravel(dest, alive) end
            elseif dd > 1.5 then
                placeAt(r, dest)
            end
            if not holdFor then
                if elev then
                    local safe = not machineUnsafe(State.CurGen)
                    if T("UseLostInterest") then
                        if State.LostInterestAt > t0 and safe then break end
                    else
                        local _, td = nearestOf(twistedParts(), startPos)
                        if safe and (not td or td > release) then break end
                    end
                else
                    if T("UseLostInterest") and State.LostInterestAt > t0 then break end
                    local _, td = nearestOf(twistedParts(), ground)
                    if not td or td > release then break end
                end
            end
            task.wait(0.05)
        end
    end)
    local _, _, r = getChar()
    if r and (r.Position - landPos).Magnitude > 6 then
        pcall(function() Mv.hideTravel(landPos, function() return Running end) end)
    end
    clearHover()
    releaseAllKeys()
    State.Hiding = false
    if not ok then end
    return reached
end

local function hideFromTwisted(alive, holdFor)
    releaseAllKeys()
    local mode = O("HideMode") or "Map Roof"
    if mode == "Thick Parts" then return hideInThickPart(alive, holdFor) end
    return hideHigh(alive, holdFor)
end

task.spawn(function()
    while Running do
        local mode = O("HideMode")
        if T("HideInWalls") and T("AutoFarm") then
            if mode == "Thick Parts" then
                pcall(refreshHideSpots)
                task.wait(15)
            elseif mode == "FakeElevator" or mode == "FakeElevator TP" then
                pcall(findFakeElevator)
                task.wait(3)
            elseif mode == "Elevator" then
                pcall(findElevator)
                task.wait(5)
            elseif mode == "Underground" or mode == "Machine Top" then
                task.wait(1)
            else
                local _, _, r = getChar()
                if r then pcall(roofHeight, r.Position) end
                task.wait(5)
            end
        else
            task.wait(1)
        end
    end
end)

local function fireAll(unit, root, doTouch, doClick)
    local touched = 0
    for _, d in ipairs(unit:GetDescendants()) do
        if d:IsA("ProximityPrompt") and d.Enabled then
            if T("InstantPrompts") then
                pcall(function()
                    d.HoldDuration = 0
                    d.RequiresLineOfSight = false
                end)
            end
            if fireproximityprompt then pcall(fireproximityprompt, d) end
        elseif doClick and d:IsA("ClickDetector") and fireclickdetector then
            pcall(fireclickdetector, d)
        elseif doTouch and d:IsA("BasePart") and firetouchinterest and touched < 10 then
            touched = touched + 1
            pcall(function()
                firetouchinterest(root, d, 0)
                firetouchinterest(root, d, 1)
            end)
        end
    end
    if unit:IsA("BasePart") and doTouch and firetouchinterest then
        pcall(function()
            firetouchinterest(root, unit, 0)
            firetouchinterest(root, unit, 1)
        end)
    end
end

local function Interact(unit, duration, alive, opts)
    opts = opts or {}
    local part = basePart(unit)
    if not part then return end
    local treadmill = T("TreadmillSprint") and isTreadmill(unit)
    local t0 = tick()
    while alive() and tick() - t0 < duration do
        if not unit.Parent then break end
        if moveDanger() then
            stopInteracting(unit, true)
            releaseAllKeys()
            break
        end
        local _, hum, root = getChar()
        if not root then break end
        local pos = part.Position + Vector3.new(0, 3, 0)
        if treadmill then
            if Hover then clearHover() end
            if (root.Position - pos).Magnitude > 6 then MoveTo(pos, alive, 3) end
            local dir = (part.CFrame.LookVector * Vector3.new(1, 0, 1))
            if dir.Magnitude < 0.1 then dir = Vector3.new(1, 0, 0) end
            dir = dir.Unit
            local side = math.sin(tick() * 1.7) * 0.4
            local moveDir = (dir + part.CFrame.RightVector * side).Unit
            holdWASD(moveDir, 0.35, function()
                return alive() and not moveDanger()
            end, true)
            fireAll(unit, root, opts.touch, opts.click)
        else
            if (root.Position - pos).Magnitude > 5 then MoveTo(pos, alive, 4) end
            fireAll(unit, root, opts.touch, opts.click)
            task.wait(O("PromptRate") or 0.05)
        end
        if opts.stopWhen and opts.stopWhen() then break end
    end
    releaseAllKeys()
end

local function pickItem(pos, tw)
    local best, bd
    for _, u in ipairs(units("Items")) do
        local p = basePart(u)
        if p and p.Parent and not isSkipped(u) then
            local d = (p.Position - pos).Magnitude
            if d <= (O("MaxDist") or 1500) then
                local safe = true
                if T("AvoidTwisted") then
                    local _, td = nearestOf(tw, p.Position)
                    if td and td < (O("SafeGenDistance") or 45) * 0.6 then safe = false end
                end
                if safe and (not bd or d < bd) then best, bd = u, d end
            end
        end
    end
    return best
end

local function pickGenerator(pos, tw)
    local best, bd
    local nDone, nConnie, nTwisted, nFar = 0, 0, 0, 0
    for _, u in ipairs(units("Generators")) do
        local p = basePart(u)
        if p and p.Parent and not isSkipped(u) then
            local info = machineInfo(u)
            if T("SkipConnie") and info.connie == true then
                nConnie = nConnie + 1
            elseif T("SkipDone") and isDone(u) then
                nDone = nDone + 1
            else
                local blocked = false
                if T("AvoidTwisted") then
                    local _, td = nearestOf(tw, p.Position)
                    if td and td < (O("SafeGenDistance") or 45) then
                        nTwisted = nTwisted + 1
                        blocked = true
                    end
                end
                local d = (p.Position - pos).Magnitude
                if not blocked and d > (O("MaxDist") or 1500) then
                    nFar = nFar + 1
                    blocked = true
                end
                if not blocked then
                    local score = d
                    if T("PreferLowProgress") and info.cur and info.req and info.req > 0 then
                        score = d + math.clamp(info.cur / info.req, 0, 1) * 400
                    end
                    if not bd or score < bd then best, bd = u, score end
                end
            end
        end
    end
    local why = string.format("no machine (done %d, connie %d, twisted %d)", nDone, nConnie, nTwisted)
    return best, why
end

local function flee(twisted, root, alive)
    releaseAllKeys()
    local away = (root.Position - twisted.Position) * Vector3.new(1, 0, 1)
    if away.Magnitude < 0.1 then away = Vector3.new(math.random() - 0.5, 0, math.random() - 0.5) end
    local target = root.Position + away.Unit * ((O("DodgeDistance") or 34) + 12)
    Status("dodging")
    MoveTo(target, alive, 2.5)
end

local function spottedNow()
    local n = O("SpottedEvent")
    if type(n) == "string" and n:match("%S") then return State.SpottedUntil > tick() end
    return true
end

local function threatLevel(pos)
    local danger, tp = twistedDanger(pos)
    if not danger or not spottedNow() then return nil end
    local when = O("HideWhen") or "Any time a twisted is close"
    if T("HideInWalls") then
        if when == "Any time a twisted is close" then return "hide", tp end
        if State.WorkingGen and machineUnsafe(State.WorkingGen) then return "hide", tp end
        return "flee", tp
    end
    return "flee", tp
end

local function stillOnMachine()
    local g = State.WorkingGen
    if not g or not g.Parent or isSkipped(g) then return false end
    if T("SkipDone") and isDone(g) then return false end
    if T("SkipConnie") and machineInfo(g).connie == true then return false end
    return true
end

local function goToElevator(alive)
    local obj = findElevator()
    if not obj then
        Status("all done, no elevator")
        task.wait(1)
        return
    end
    local _, _, root = getChar()
    if not root then return end
    local pos = elevatorPos(obj) + Vector3.new(0, O("ElevatorYOffset") or 3, 0)
    Status("all done, going to elevator")
    local _, td = nearestOf(twistedParts(), pos)
    if td and td < (O("SafeGenDistance") or 45) then
        MoveTo(findSafePosition(root.Position), alive, 6)
    end
    if (root.Position - pos).Magnitude > 6 then MoveTo(pos, alive, 15) end
    local _, _, r = getChar()
    if r then
        setHover(Vector3.zero)
        fireAll(obj, r, true, true)
    end
    task.wait(0.4)
end

local function farmStep(alive)
    while State.ToT and alive() do task.wait(0.2) end
    if not alive() then return end
    local _, hum, root = getChar()
    if not root then task.wait(0.5) return end

    if T("GoElevator") and allMachinesDone() then
        State.WorkingGen = nil
        goToElevator(alive)
        return
    end
    if State.WorkingGen and not stillOnMachine() then State.WorkingGen = nil end

    local level, tp = threatLevel(root.Position)
    if level then
        stopInteracting(State.CurGen, true)
        State.WorkingGen = nil
        releaseAllKeys()
        clearHover()
        if level == "hide" and T("HideInWalls") then
            Status("hiding: " .. tostring(O("HideMode") or "Map Roof"))
            local hid = hideFromTwisted(alive)
            if hid then return end
            notifyOnce("hidefail", "hide failed, dodging", 2)
        end
        if tp then flee(tp, root, alive) end
        task.wait(0.15)
        return
    end

    local function safeAlive()
        if not alive() then return false end
        local _, _, r = getChar()
        if not r then return false end
        if threatLevel(r.Position) then
            stopInteracting(State.CurGen)
            releaseAllKeys()
            return false
        end
        return true
    end

    local tw = twistedParts()

    if T("PrioritizeItems") and not (T("FinishMachineFirst") and State.WorkingGen) then
        local item = pickItem(root.Position, tw)
        if item then
            local p = basePart(item)
            State.CurGen = nil
            Status("grabbing " .. item.Name)
            local reached = MoveTo(p.Position + Vector3.new(0, 3, 0), safeAlive, 10)
            if not reached then skip(item, 4) return end
            Interact(item, 1.0, safeAlive, { touch = true })
            if item.Parent then skip(item, 6) end
            return
        end
    end

    local gen, why = pickGenerator(root.Position, tw)
    if gen then
        local p = basePart(gen)
        State.CurGen = gen
        State.WorkingGen = gen
        local tread = isTreadmill(gen)
        Status((tread and "treadmill " or "machine ") .. gen.Name)
        local _, td = nearestOf(tw, p.Position)
        local targetPos = p.Position + Vector3.new(0, 3, 0)
        if td and td < (O("SafeGenDistance") or 45) then
            local safePos = findSafePosition(root.Position)
            Status("twisted near, going safe first")
            MoveTo(safePos, safeAlive, 6)
        end
        local reached = MoveTo(targetPos, safeAlive, 12)
        if not reached then
            State.WorkingGen = nil
            skip(gen, 3)
            Status("couldnt reach " .. gen.Name)
            return
        end
        local holdTime = tread and (O("MachineHold") or 2.2) * 1.8 or (O("MachineHold") or 2.2)
        local started = tick()
        Interact(gen, holdTime, safeAlive, {
            stopWhen = function()
                if T("SkipConnie") and machineInfo(gen).connie == true then return true end
                return T("SkipDone") and isDone(gen)
            end,
        })
        local info = machineInfo(gen)
        if info.cur and MachineLast[gen] ~= info.cur then
            MachineLast[gen] = info.cur
            MachineTime[gen] = 0
        else
            MachineTime[gen] = (MachineTime[gen] or 0) + (tick() - started)
        end
        if T("SkipDone") and isDone(gen) then
            MachineTime[gen] = nil
            MachineLast[gen] = nil
            State.WorkingGen = nil
            skip(gen, 3)
            Status("machine done")
        elseif T("SwitchStuck") and (MachineTime[gen] or 0) > (O("MachineMax") or 30) then
            MachineTime[gen] = nil
            State.WorkingGen = nil
            skip(gen, 30)
            Status("machine stuck, switching")
        end
    else
        State.WorkingGen = nil
        Status(why)
        task.wait(0.4)
    end
end

local function startFarm()
    FarmToken = FarmToken + 1
    State.Moving = 0
    local token = FarmToken
    local function alive() return Running and FarmToken == token and T("AutoFarm") and not State.ToT end
    task.spawn(function()
        while Running and FarmToken == token and T("AutoFarm") do
            local ok, err = pcall(farmStep, alive)
            if not ok then task.wait(0.5) end
            task.wait()
        end
        State.Hiding = false
        releaseAllKeys()
        if not State.ToT then clearHover() end
        Status("idle")
    end)
end

local function stopFarm()
    FarmToken = FarmToken + 1
    State.WorkingGen = nil
    State.Hiding = false
    releaseAllKeys()
    if not State.ToT then clearHover() end
    local _, hum = getChar()
    if hum then hum.WalkSpeed = 16 end
    Status("idle")
end

local StaminaState = { curRef = nil, maxRef = nil, target = nil, tried = 0, char = nil }

local function readStamValue(ref)
    if not ref then return nil end
    if ref.kind == "attr" then return ref.inst:GetAttribute(ref.key) end
    local ok, v = pcall(function() return ref.inst.Value end)
    if ok then return v end
    return nil
end

local function writeStamValue(ref, v)
    if not ref then return end
    if ref.kind == "attr" then
        pcall(function() ref.inst:SetAttribute(ref.key, v) end)
    else
        pcall(function() ref.inst.Value = v end)
    end
end

local function findStaminaRefs(char)
    if not char then return nil, nil end
    local curRef, maxRef = nil, nil

    for _, d in ipairs(char:GetDescendants()) do
        local n = d.Name:lower()
        if d:IsA("ValueBase") then
            if n == "currentstamina" or n == "stamina" then
                if not curRef then curRef = { kind = "val", inst = d } end
            elseif n == "maxstamina" or n == "staminamax" or n == "staminamaximum" then
                if not maxRef then maxRef = { kind = "val", inst = d } end
            elseif n == "boundarysize" then
                local val = readStamValue({ kind = "val", inst = d })
                if type(val) == "number" then
                    local existing = maxRef and readStamValue(maxRef) or 0
                    if not maxRef or val > existing then
                        maxRef = { kind = "val", inst = d }
                    end
                end
            end
        elseif d:IsA("BasePart") and n == "boundarysize" then
            local v = d:FindFirstChild("Value", true)
            if v and v:IsA("ValueBase") then
                local val = readStamValue({ kind = "val", inst = v })
                if type(val) == "number" then
                    local existing = maxRef and readStamValue(maxRef) or 0
                    if not maxRef or val > existing then
                        maxRef = { kind = "val", inst = v }
                    end
                end
            end
        end
    end

    for k in pairs(char:GetAttributes()) do
        local lk = k:lower()
        if lk == "currentstamina" or lk == "stamina" then
            if not curRef then curRef = { kind = "attr", inst = char, key = k } end
        elseif lk == "maxstamina" or lk == "staminamax" or lk == "boundarysize" then
            if not maxRef then maxRef = { kind = "attr", inst = char, key = k } end
        end
    end

    return curRef, maxRef
end

Conns.InfStamina = RunService.Heartbeat:Connect(function()
    if not Running or not T("InfStamina") then return end
    local char = LocalPlayer.Character
    if not char then
        StaminaState.curRef, StaminaState.maxRef, StaminaState.target, StaminaState.char = nil, nil, nil, nil
        return
    end
    if StaminaState.char ~= char then
        StaminaState.char = char
        StaminaState.curRef, StaminaState.maxRef, StaminaState.target = nil, nil, nil
        StaminaState.tried = 0
    end
    if not StaminaState.curRef or not StaminaState.curRef.inst.Parent then
        if tick() - StaminaState.tried > 0.5 then
            StaminaState.tried = tick()
            StaminaState.curRef, StaminaState.maxRef = findStaminaRefs(char)
        end
        if not StaminaState.curRef then return end
    end
    if StaminaState.maxRef then
        local mv = readStamValue(StaminaState.maxRef)
        if type(mv) == "number" and mv > 0 then StaminaState.target = mv end
    end
    if not StaminaState.target then
        local cv = readStamValue(StaminaState.curRef)
        if type(cv) == "number" and cv > 0 then StaminaState.target = cv end
        if not StaminaState.target then return end
    end
    local cv = readStamValue(StaminaState.curRef)
    if type(cv) == "number" and cv ~= StaminaState.target then
        writeStamValue(StaminaState.curRef, StaminaState.target)
    end
end)

local NEEDLE_HINTS = { "needle", "pointer", "arrow", "cursor", "indicator", "hand", "marker", "line" }
local ZONE_HINTS = { "zone", "success", "target", "hit", "safe", "good", "great", "perfect", "area", "goal", "sweet", "window" }
local SC_NAMES = { "skillcheck", "skill_check", "skill check" }

local SC = { container = nil, needle = nil, zone = nil, lastSearch = 0, lastPress = 0,
             lastPos = nil, lastRot = nil, mode = nil, dirty = true }

local function hasHint(name, hints)
    local n = name:lower()
    for _, h in ipairs(hints) do
        if n:find(h, 1, true) then return true end
    end
    return false
end

local function guiVisible(g)
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    local cur = g
    while cur and cur ~= pg do
        if cur:IsA("GuiObject") and not cur.Visible then return false end
        if cur:IsA("ScreenGui") and not cur.Enabled then return false end
        cur = cur.Parent
    end
    return true
end

local function findSkillCheckLegacy()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return end
    for _, d in ipairs(pg:GetDescendants()) do
        if (d:IsA("GuiObject") or d:IsA("ScreenGui")) and hasHint(d.Name, SC_NAMES) then
            local needle, zone
            for _, c in ipairs(d:GetDescendants()) do
                if c:IsA("GuiObject") then
                    if not needle and hasHint(c.Name, NEEDLE_HINTS) then
                        needle = c
                    elseif not zone and hasHint(c.Name, ZONE_HINTS) then
                        zone = c
                    end
                end
            end
            if needle and zone then return d, needle, zone end
        end
    end
end

local function findSkillCheck()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return end
    local sg = pg:FindFirstChild("ScreenGui")
    local menu = sg and sg:FindFirstChild("Menu")
    local frame = menu and menu:FindFirstChild("SkillCheckFrame")
    local gold = frame and frame:FindFirstChild("GoldArea", true)
    if frame and gold then
        local marker
        for _, c in ipairs(frame:GetDescendants()) do
            if c ~= gold and c:IsA("GuiObject") and c.Name:lower():find("marker", 1, true) then
                marker = c break
            end
        end
        if not marker then
            for _, c in ipairs(frame:GetDescendants()) do
                if c ~= gold and c:IsA("GuiObject") and hasHint(c.Name, NEEDLE_HINTS) then
                    marker = c break
                end
            end
        end
        if marker then return frame, marker, gold end
    end
    for _, m in ipairs(pg:GetDescendants()) do
        if m:IsA("GuiObject") and m.Name:lower():find("marker", 1, true) then
            local anc = m.Parent
            for _ = 1, 5 do
                if not anc or anc == pg then break end
                for _, g in ipairs(anc:GetDescendants()) do
                    if g ~= m and g:IsA("GuiObject") and g.Name:lower():find("gold", 1, true) then
                        return (m:FindFirstAncestorOfClass("ScreenGui") or anc), m, g
                    end
                end
                anc = anc.Parent
            end
        end
    end
    return findSkillCheckLegacy()
end

local function pressSkillKey()
    if not VIM then return end
    local k = O("SkillKey") or "Space"
    pcall(function()
        if k == "Click" then
            local c = Workspace.CurrentCamera.ViewportSize / 2
            VIM:SendMouseButtonEvent(c.X, c.Y, 0, true, game, 0)
            VIM:SendMouseButtonEvent(c.X, c.Y, 0, false, game, 0)
        else
            local kc = Enum.KeyCode[k]
            VIM:SendKeyEvent(true, kc, false, game)
            task.delay(0.03, function() VIM:SendKeyEvent(false, kc, false, game) end)
        end
    end)
end

local function instantSkillCheck(n, z)
    if not n or not z then return end
    local goldCX = z.AbsolutePosition.X + z.AbsoluteSize.X / 2
    local goldCY = z.AbsolutePosition.Y + z.AbsoluteSize.Y / 2
    local markerCX = n.AbsolutePosition.X + n.AbsoluteSize.X / 2
    local markerCY = n.AbsolutePosition.Y + n.AbsoluteSize.Y / 2
    local dx = goldCX - markerCX
    local dy = goldCY - markerCY
    if math.abs(dx) > 0.5 or math.abs(dy) > 0.5 then
        pcall(function() n.Position = n.Position + UDim2.fromOffset(dx, dy) end)
    end
    if n.Rotation ~= z.Rotation then
        pcall(function() n.Rotation = z.Rotation end)
    end
    local nx1, nx2 = n.AbsolutePosition.X, n.AbsolutePosition.X + n.AbsoluteSize.X
    local ny1, ny2 = n.AbsolutePosition.Y, n.AbsolutePosition.Y + n.AbsoluteSize.Y
    local zx1, zx2 = z.AbsolutePosition.X, z.AbsolutePosition.X + z.AbsoluteSize.X
    local zy1, zy2 = z.AbsolutePosition.Y, z.AbsolutePosition.Y + z.AbsoluteSize.Y
    if nx1 <= zx2 and nx2 >= zx1 and ny1 <= zy2 and ny2 >= zy1 then
        if tick() - SC.lastPress > 0.3 then
            SC.lastPress = tick()
            pressSkillKey()
        end
    end
end

local function skillCheckStep(dt)
    if not SC.container or not SC.container.Parent
        or not SC.needle or not SC.needle.Parent
        or not SC.zone or not SC.zone.Parent then
        SC.container, SC.needle, SC.zone = nil, nil, nil
        SC.lastPos, SC.lastRot, SC.mode = nil, nil, nil
        if SC.dirty or tick() - SC.lastSearch > 0.25 then
            SC.dirty = false
            SC.lastSearch = tick()
            SC.container, SC.needle, SC.zone = findSkillCheck()
        end
        if not SC.container then return end
    end
    if not (guiVisible(SC.needle) and guiVisible(SC.zone)) then
        SC.lastPos, SC.lastRot, SC.mode = nil, nil, nil
        return
    end
    local n, z = SC.needle, SC.zone

    if T("InstantSkillCheck") then
        instantSkillCheck(n, z)
        return
    end

    local npos = n.AbsolutePosition + n.AbsoluteSize / 2
    local nrot = n.Rotation
    local lead = O("SkillLead") or 0.03
    local hit = false

    if SC.lastPos and SC.lastRot and dt > 0 then
        local posDelta = (npos - SC.lastPos).Magnitude
        local rotDelta = math.abs(nrot - SC.lastRot)

        if rotDelta > 0.5 then SC.mode = "rot"
        elseif posDelta > 0.5 then SC.mode = "pos" end

        if tick() - SC.lastPress > 0.35 then
            if rotDelta > 0.05 or SC.mode == "rot" then
                local angVel = rotDelta > 0 and (nrot - SC.lastRot) / dt or 0
                local predicted = nrot + angVel * lead
                local offset = O("SkillOffset") or 0
                local diff = ((predicted - z.Rotation - offset + 180) % 360) - 180
                if math.abs(diff) <= (O("SkillTol") or 12) then
                    hit = true
                end
            end

            if not hit and (posDelta > 0.05 or SC.mode == "pos" or not SC.mode) then
                local vel = posDelta > 0 and (npos - SC.lastPos) / dt or Vector2.new(0, 0)
                local predicted = npos + vel * lead
                local zp, zs = z.AbsolutePosition, z.AbsoluteSize
                local tol = O("SkillPixelTol") or 4
                local nHalf = n.AbsoluteSize / 2
                if O("SkillMatch") == "Marker touches Gold" then
                    hit = predicted.X + nHalf.X >= zp.X - tol
                        and predicted.X - nHalf.X <= zp.X + zs.X + tol
                        and predicted.Y + nHalf.Y >= zp.Y - tol
                        and predicted.Y - nHalf.Y <= zp.Y + zs.Y + tol
                else
                    hit = predicted.X >= zp.X - tol
                        and predicted.X <= zp.X + zs.X + tol
                        and predicted.Y >= zp.Y - tol
                        and predicted.Y <= zp.Y + zs.Y + tol
                end
            end
        end
    end

    SC.lastPos, SC.lastRot = npos, nrot

    if hit then
        SC.lastPress = tick()
        pressSkillKey()
    end
end

Conns.SkillCheck = RunService.Heartbeat:Connect(function(dt)
    local shouldRun = T("InstantSkillCheck") or (T("AutoSkillCheck") and T("AutoFarm"))
    if not shouldRun then return end
    local ok, err = pcall(skillCheckStep, dt)
    if not ok then end
end)

task.spawn(function()
    local pg = LocalPlayer:WaitForChild("PlayerGui")
    Conns.PGAdded = pg.DescendantAdded:Connect(function(d)
        if hasHint(d.Name, SC_NAMES) or hasHint(d.Name, { "marker", "gold" }) then SC.dirty = true end
    end)
end)

local function dumpSkillCheck()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return end
    local lines = 0
    local function dump(inst, depth)
        if lines > 220 then return end
        lines = lines + 1
        local extra = ""
        if inst:IsA("GuiObject") then
            extra = string.format(" vis=%s pos=(%d,%d) size=(%d,%d) rot=%.1f",
                tostring(inst.Visible), inst.AbsolutePosition.X, inst.AbsolutePosition.Y,
                inst.AbsoluteSize.X, inst.AbsoluteSize.Y, inst.Rotation)
        end

        for _, c in ipairs(inst:GetChildren()) do dump(c, depth + 1) end
    end
    local found = false
    for _, d in ipairs(pg:GetChildren()) do
        for _, x in ipairs(d:GetDescendants()) do
            if hasHint(x.Name, SC_NAMES) or hasHint(x.Name, { "skill", "marker", "gold" }) then
                found = true

                dump(d, 0)
                break
            end
        end
    end
        Library:Notify("printed to f9", 3)
end

local function totTargets()
    local list = {}
    if T("ToTEveryPart") then
        local gap = O("ToTPartGap") or 3
        for _, u in ipairs(units("ToT")) do
            local kept, parts = {}, {}
            if u:IsA("BasePart") then parts[1] = u end
            for _, d in ipairs(u:GetDescendants()) do
                if d:IsA("BasePart") then parts[#parts + 1] = d end
            end
            for _, p in ipairs(parts) do
                local close = false
                for _, k in ipairs(kept) do
                    if (k.Position - p.Position).Magnitude < gap then close = true break end
                end
                if not close then
                    kept[#kept + 1] = p
                    list[#list + 1] = { part = p, unit = u }
                    if #list >= 400 then return list end
                end
            end
        end
    else
        for _, u in ipairs(units("ToT")) do
            local p = basePart(u)
            if p then list[#list + 1] = { part = p, unit = u } end
        end
    end
    return list
end

local function totPass(alive)
    local targets = totTargets()
    if #targets == 0 then
        Library:Notify("no tot doors", 3)
        return
    end
    State.ToT = true
    Library:Notify("tot: " .. #targets .. " targets", 2)
    local visited, firedUnit = {}, {}
    for _ = 1, #targets do
        if not alive() then break end
        local _, _, root = getChar()
        if not root then task.wait(0.5) break end
        local best, bd
        for i, t in ipairs(targets) do
            if not visited[i] and t.part.Parent then
                local d = (t.part.Position - root.Position).Magnitude
                if not bd or d < bd then best, bd = i, d end
            end
        end
        if not best then break end
        visited[best] = true
        local t = targets[best]
        Status("tot " .. t.unit.Name)
        MoveTo(t.part.Position + Vector3.new(0, 3, 0), alive, 10)
        if not firedUnit[t.unit] then
            firedUnit[t.unit] = true
            local _, _, r = getChar()
            if r then fireAll(t.unit, r, true, true) end
        end
        Interact(t.part, O("ToTDwell") or 0.4, alive, { touch = true, click = true })
        task.wait(O("ToTDelay") or 0.1)
    end
    State.ToT = false
    Library:Notify("tot done", 2)
end

local function startToT()
    ToTToken = ToTToken + 1
    local token = ToTToken
    local function alive() return Running and ToTToken == token and T("AutoToT") end
    task.spawn(function()
        repeat
            local ok, err = pcall(totPass, alive)
            if not ok then end
            State.ToT = false
            if alive() and T("ToTLoop") then task.wait(5) end
        until not (alive() and T("ToTLoop"))
        State.ToT = false
        if ToTToken == token and T("AutoToT") then
            Toggles.AutoToT:SetValue(false)
        end
    end)
end

local ESPRoot = Instance.new("Folder")
ESPRoot.Name = "GourdyESP"
pcall(function() ESPRoot.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
if not ESPRoot.Parent then ESPRoot.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local ESPObjects = {}
local ToonESP = {}
local removeToon

local function fadeInLabel(label)
    if not T("SmoothText") then return end
    label.TextTransparency = 0.4
    TweenService:Create(label, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
end

local function setBillboardHeight(bb, height)
    local target = UDim2.fromOffset(300, height)
    if bb.Size.Y.Offset == height then return end
    if T("SmoothText") then
        TweenService:Create(bb, TweenInfo.new(0.15), { Size = target }):Play()
    else
        bb.Size = target
    end
end

local function removeESP(unit)
    local e = ESPObjects[unit]
    if not e then return end
    for _, o in ipairs(e.objs) do pcall(function() o:Destroy() end) end
    ESPObjects[unit] = nil
    LastCur[unit] = nil
    RisingUntil[unit] = nil
    twistedInfoCache[unit] = nil
end

local function getToTDisplayPart(unit)
    if unit.Name == "doorAddon" and unit:IsA("BasePart") then return unit end
    if unit.Name == "TrickOrTreatDoor_Origin" then
        local addon = unit:FindFirstChild("doorAddon", true)
        if addon and addon:IsA("BasePart") then return addon end
        return basePart(unit) or unit
    end
    local origin = unit:FindFirstChild("TrickOrTreatDoor_Origin", true)
    if origin then
        local addon = origin:FindFirstChild("doorAddon", true)
        if addon and addon:IsA("BasePart") then return addon end
        return basePart(origin) or origin
    end
    local addon = unit:FindFirstChild("doorAddon", true)
    if addon and addon:IsA("BasePart") then return addon end
    return nil
end

local function makeESP(catName, unit)
    local def = CATS[catName]
    local part = catName == "ToT" and getToTDisplayPart(unit) or basePart(unit)
    if not part then return end

    local e = { cat = catName, unit = unit, part = part, objs = {} }
    local isMachine = catName == "Generators"
    local isTwisted = catName == "Monsters"
    local col = catColor(catName)

    local bb = Instance.new("BillboardGui")
    bb.Adornee = part
    bb.AlwaysOnTop = true
    if isMachine then
        bb.Size = UDim2.fromOffset(300, 90)
        bb.StudsOffset = Vector3.new(0, -3 - part.Size.Y / 2, 0)
    else
        bb.Size = UDim2.fromOffset(300, 22)
        bb.StudsOffset = Vector3.new(0, 3, 0)
    end
    bb.Parent = ESPRoot
    e.bb = bb

    if isTwisted then
        local chaseBB = Instance.new("BillboardGui")
        chaseBB.Adornee = part
        chaseBB.AlwaysOnTop = true
        chaseBB.Size = UDim2.fromOffset(40, 40)
        chaseBB.StudsOffset = Vector3.new(0, -5.5, 0)
        chaseBB.Enabled = false
        chaseBB.Parent = ESPRoot
        e.chaseBB = chaseBB
        e.objs[#e.objs + 1] = chaseBB

        local img = Instance.new("ImageLabel")
        img.Size = UDim2.fromScale(1, 1)
        img.BackgroundTransparency = 1
        img.Parent = chaseBB
        e.chaseImg = img
    end

    local t = Instance.new("TextLabel")
    t.Size = UDim2.fromScale(1, 1)
    t.BackgroundTransparency = 1
    t.TextColor3 = col
    t.TextStrokeTransparency = 0.3
    t.Font = Enum.Font.GothamBold
    t.TextSize = 13
    t.RichText = true
    t.TextYAlignment = isMachine and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
    t.Text = unit.Name
    t.Parent = bb
    e.label = t
    e.objs[#e.objs + 1] = bb
    fadeInLabel(t)

    if def.highlight then
        local h = Instance.new("Highlight")
        h.Adornee = unit
        h.FillColor = col
        h.OutlineColor = Color3.new(1, 1, 1)
        h.FillTransparency = 0.55
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Parent = ESPRoot
        e.objs[#e.objs + 1] = h
        e.hl = h
    else
        local sb = Instance.new("SelectionBox")
        sb.Adornee = part
        sb.Color3 = col
        sb.LineThickness = 0.02
        sb.SurfaceTransparency = 1
        sb.Parent = ESPRoot
        e.objs[#e.objs + 1] = sb
        e.box = sb
    end

    ESPObjects[unit] = e
end

local function espBroken(e)
    if not e.part or not e.part.Parent then return true end
    if not e.bb or not e.bb.Parent then return true end
    if not e.label or e.label.Parent ~= e.bb then return true end
    if e.bb.Adornee ~= e.part then return true end
    if e.cat ~= "ToT" and basePart(e.unit) ~= e.part then return true end
    if e.box and (not e.box.Parent or e.box.Adornee ~= e.part) then return true end
    if e.hl and not e.hl.Parent then return true end
    if e.chaseBB and not e.chaseBB.Parent then return true end
    return false
end

local function refreshAllESP()
    for u in pairs(ESPObjects) do removeESP(u) end
    for p in pairs(ToonESP) do removeToon(p) end
end

local function reconcileESP()
    if not ESPRoot.Parent then
        pcall(function() ESPRoot.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
        if not ESPRoot.Parent then ESPRoot.Parent = LocalPlayer:WaitForChild("PlayerGui") end
        refreshAllESP()
    end
    for u, e in pairs(ESPObjects) do
        if espBroken(e) then removeESP(u) end
    end
    if State.espBudget == nil then State.espBudget = 20 end

    local alive = {}
    if T("ESP") then
        for _, catName in ipairs(CAT_ORDER) do
            if T("ESP_" .. catName) then
                local candidates = {}
                local _, _, root = getChar()
                local myPos = root and root.Position
                for index, u in ipairs(units(catName)) do
                    if not (catName == "Generators" and isDone(u)) then
                        local part = catName == "ToT" and getToTDisplayPart(u) or (u.Parent and basePart(u))
                        if part and part:IsDescendantOf(Workspace) then
                            local distance = myPos and (part.Position - myPos).Magnitude or 0
                            if distance <= (O("ESPMaxDist") or 5000) then
                                candidates[#candidates + 1] = { unit = u, distance = distance, index = index }
                            end
                        end
                    end
                end
                if catName == "Items" then
                    table.sort(candidates, function(a, b)
                        if a.distance == b.distance then return a.index < b.index end
                        return a.distance < b.distance
                    end)
                end
                local limit = catName == "Items" and Release.itemBudget or math.huge
                for index, candidate in ipairs(candidates) do
                    if index > limit then break end
                    local u = candidate.unit
                    alive[u] = true
                    if not ESPObjects[u] and State.espBudget > 0 then
                        makeESP(catName, u)
                        State.espBudget -= 1
                    end
                end
            end
        end
    end
    for u in pairs(ESPObjects) do
        if not alive[u] or not u.Parent then removeESP(u) end
    end
end

local GRAY = "#B4B4B4"

local function machineText(unit, distText, near)
    local info = machineInfo(unit)
    local lines = {}

    if T("TxtName") then
        lines[#lines + 1] = string.format('<font color="%s"><b>%s</b>%s</font>',
            hex(catColor("Generators")), Release.escape(unit.Name), distText)
    end
    if T("TxtProgress") and (info.cur ~= nil or info.req ~= nil) then
        local cur = info.cur or 0
        local req = info.req or 0
        local pct = req > 0 and (cur / req) or 0
        lines[#lines + 1] = string.format('<font color="%s">%s / %s</font>',
            hex(progColor(pct)), fmt(cur), fmt(req))
    end
    local statusParts = {}
    if T("TxtConnie") and info.connie ~= nil then
        statusParts[#statusParts + 1] = info.connie
            and '<font color="#FF7A3C">connie yes</font>'
            or '<font color="#78FF8C">connie no</font>'
    end
    if T("TxtCompleted") and info.completed ~= nil then
        statusParts[#statusParts + 1] = info.completed
            and '<font color="#50FF78">done yes</font>'
            or '<font color="#E6E6E6">done no</font>'
    end
    if T("TxtSafe") then
        statusParts[#statusParts + 1] = near
            and '<font color="#FF3C3C"><b>danger</b></font>'
            or '<font color="#3CFF64"><b>safe</b></font>'
    end
    if #statusParts > 0 then
        lines[#lines + 1] = table.concat(statusParts, "  ·  ")
    end
    if #lines == 0 then lines[1] = " " end
    return table.concat(lines, "\n"), info
end

local RISE_ORANGE = Color3.fromRGB(255, 140, 0)

local function updateESPLabels()
    local _, _, root = getChar()
    if not root then return end
    local tw = twistedParts()
    local safeDist = O("SafeLabelDistance") or 45
    local maxD = O("ESPMaxDist") or 5000
    local holdFor = O("RisingHold") or 1.5
    local size = O("ESPTextSize") or 13
    local now = tick()
    local myPos = root.Position

    for unit, e in pairs(ESPObjects) do
        if e.part and e.part.Parent then
            local dist = (e.part.Position - myPos).Magnitude
            local visible = dist <= maxD
            local distText = T("ESPDistance") and (" [" .. math.floor(dist) .. "]") or ""
            local col = catColor(e.cat)
            e.label.TextColor3 = col
            e.label.TextSize = size
            if e.bb then e.bb.Enabled = visible end

            if e.cat == "Generators" then
                local _, td = nearestOf(tw, e.part.Position)
                local near = td ~= nil and td < safeDist
                local text, info = machineText(unit, distText, near)
                if e.label.Text ~= text then e.label.Text = text end
                local _, nl = text:gsub("\n", "\n")
                local newH = (nl + 1) * (size + 4) + 4
                setBillboardHeight(e.bb, newH)
                if info.cur then
                    local last = LastCur[unit]
                    if last and info.cur > last + 1e-4 then RisingUntil[unit] = now + holdFor end
                    LastCur[unit] = info.cur
                end
                local rising = (RisingUntil[unit] or 0) > now
                if e.hl then
                    e.hl.FillColor = (rising and T("RisingOrange")) and RISE_ORANGE or col
                    e.hl.Enabled = visible
                end
            elseif e.cat == "Monsters" then
                if not T("TxtTwisteds") then
                    e.label.Visible = false
                    if e.chaseBB then e.chaseBB.Enabled = false end
                    if e.hl then e.hl.FillColor = col e.hl.Enabled = visible end
                else
                    e.label.Visible = true
                    local info = twistedInfoCached(unit)
                    local lines = {}
                    lines[#lines + 1] = Release.escape(unit.Name) .. distText

                    if not info.skip and info.speed then
                        local spd = string.format("speed %s", fmt(info.speed))
                        if info.isFaster then
                            spd = spd .. ' <font color="#FFDD00"><b>FASTER</b></font>'
                        end
                        lines[#lines + 1] = spd
                    end

                    if not info.skip and info.abilityCD then
                        lines[#lines + 1] = string.format('<font color="%s">cd %s</font>',
                            GRAY, fmt(info.abilityCD))
                    end

                    local showChaseImg = false
                    if not info.skip and info.chasing and e.chaseBB and e.chaseImg then
                        local lowChase = info.chasing:lower()
                        if lowChase == LocalPlayer.Name:lower() or lowChase == LocalPlayer.DisplayName:lower() then
                            lines[#lines + 1] = '<font color="#FF3333"><b>YOU</b></font>'
                        else
                            local targetPlr = nil
                            for _, p in ipairs(Players:GetPlayers()) do
                                if p ~= LocalPlayer and (p.Name:lower() == lowChase or p.DisplayName:lower() == lowChase) then
                                    targetPlr = p
                                    break
                                end
                            end
                            if targetPlr then
                                showChaseImg = true
                                local newImg = "rbxthumb://type=AvatarHeadShot&id=" .. targetPlr.UserId .. "&w=150&h=150"
                                if e.chaseImg.Image ~= newImg then e.chaseImg.Image = newImg end
                            end
                        end
                    end
                    if e.chaseBB then e.chaseBB.Enabled = showChaseImg and visible end

                    local text = table.concat(lines, "\n")
                    if e.label.Text ~= text then e.label.Text = text end
                    local _, nl = text:gsub("\n", "\n")
                    local newH = (nl + 1) * (size + 4) + 4
                    setBillboardHeight(e.bb, newH)

                    if e.hl then
                        e.hl.FillColor = col
                        e.hl.Enabled = visible
                    end
                end
            else
                local showTxt = true
                if e.cat == "Items" and not T("TxtItems") then showTxt = false end
                if e.cat == "ToT" and not T("TxtToTDoors") then showTxt = false end

                if not showTxt then
                    e.label.Visible = false
                else
                    e.label.Visible = true
                    local text = Release.escape(unit.Name) .. distText
                    if e.label.Text ~= text then e.label.Text = text end
                    local newH = size + 8
                    setBillboardHeight(e.bb, newH)
                end
                if e.hl then
                    e.hl.FillColor = col
                    e.hl.Enabled = visible
                end
                if e.box then
                    e.box.Color3 = col
                    e.box.Visible = visible
                end
            end
        end
    end
end

Conns.LabelUpdate = RunService.RenderStepped:Connect(function()
    if not Running or not T("ESP") then return end
    updateESPLabels()
end)

local KillRangeCache = {}

local function readKillRadius(unit)
    local kr = unit:FindFirstChild("KillRadius", true)
    if not kr then return nil end
    if kr:IsA("ValueBase") then
        local v = readValueObj(kr)
        if type(v) == "number" then return v end
    end
    for _, d in ipairs(kr:GetDescendants()) do
        if d:IsA("ValueBase") then
            local v = readValueObj(d)
            if type(v) == "number" then return v end
        end
    end
    local v = kr:GetAttribute("Value")
    if type(v) == "number" then return v end
    return nil
end

local function updateKillRanges()
    if not T("ESP") or not T("KillRange") then
        for _, data in pairs(KillRangeCache) do
            if data.sphere then data.sphere:Destroy() end
        end
        table.clear(KillRangeCache)
        return
    end
    local seen = {}
    for _, unit in ipairs(units("Monsters")) do
        local part = basePart(unit)
        if part and part.Parent then
            seen[unit] = true
            local radius = readKillRadius(unit)
            if radius and radius > 0 then
                local data = KillRangeCache[unit]
                if not data then
                    data = {}
                    KillRangeCache[unit] = data
                end
                if not data.sphere or not data.sphere.Parent then
                    local ss = Instance.new("SelectionSphere")
                    ss.Color3 = Color3.fromRGB(255, 90, 90)
                    ss.SurfaceColor3 = Color3.fromRGB(255, 40, 40)
                    ss.SurfaceTransparency = 0.5
                    ss.Parent = ESPRoot
                    data.sphere = ss
                end
                if data.sphere.Adornee ~= part then data.sphere.Adornee = part end
                if data.sphere.Radius ~= radius then data.sphere.Radius = radius end
            else
                local data = KillRangeCache[unit]
                if data and data.sphere then
                    data.sphere:Destroy()
                    KillRangeCache[unit] = nil
                end
            end
        end
    end
    for unit, data in pairs(KillRangeCache) do
        if not seen[unit] then
            if data.sphere then data.sphere:Destroy() end
            KillRangeCache[unit] = nil
        end
    end
end

local TOON_ITEM_SLOTS = 4
local TOON_TRINKET_SLOTS = 3

local EVENT_ONLY_ABILITIES = {
    brightney = true,
}

local function isEventOnlyAbility(char)
    local name = (char and char.Name or ""):lower()
    if EVENT_ONLY_ABILITIES[name] then return true end
    local abilities = char and char:FindFirstChild("Abilities", true)
    if abilities then
        local flag = abilities:FindFirstChild("Available", true)
            or abilities:FindFirstChild("Enabled", true)
            or abilities:FindFirstChild("CanUse", true)
        if flag then
            local v = readValueObj(flag)
            if v == false or v == 0 or v == "false" or v == "off" then
                return true
            end
        end
    end
    return false
end

local function getItemDisplayName(part)
    if part:IsA("ValueBase") then
        local v = readValueObj(part)
        if v ~= nil and v ~= "" then return tostring(v) end
        return nil
    end
    local v = part:FindFirstChild("Value", true)
    if v and v:IsA("ValueBase") then
        local val = readValueObj(v)
        if val ~= nil and val ~= "" then return tostring(val) end
    end
    return nil
end

local function readTrinkets(char)
    local trinkets = {}
    for _, d in ipairs(char:GetDescendants()) do
        if d.Name == "Trinkets" and (d:IsA("Folder") or d:IsA("Model")) then
            for _, c in ipairs(d:GetChildren()) do
                local dispName = getItemDisplayName(c)
                if dispName then
                    local active = false
                    local activePart = c:FindFirstChild("Active", true)
                    if activePart then
                        local av
                        if activePart:IsA("ValueBase") then
                            av = readValueObj(activePart)
                        else
                            local inner = activePart:FindFirstChild("Value", true)
                            if inner and inner:IsA("ValueBase") then av = readValueObj(inner) end
                        end
                        active = (av == true or av == 1 or av == "true" or av == "yes" or av == "on")
                    else
                        active = true
                    end
                    trinkets[#trinkets + 1] = { name = dispName, active = active }
                end
            end
            break
        end
    end
    return trinkets
end

local function readToonInfo(char)
    if not char then return nil, {}, {} end
    local cd = nil
    local items = {}
    local seenAbilities = false

    for _, d in ipairs(char:GetDescendants()) do
        if d.Name == "Abilities" and not seenAbilities then
            seenAbilities = true
            local cc = d:FindFirstChild("CurrentCooldown", true)
            if cc then
                local n = tonumber(readValueObj(cc))
                if n and n > 0 then cd = fmt(n) end
            end
        elseif d.Name == "Inventory" then
            for _, c in ipairs(d:GetChildren()) do
                local disp = getItemDisplayName(c)
                if disp then items[#items + 1] = disp end
            end
        end
    end

    if cd and isEventOnlyAbility(char) then
        cd = nil
    end

    local trinkets = readTrinkets(char)
    return cd, items, trinkets
end

local toonInfoCache = {}
local function readToonInfoCached(char)
    local c = toonInfoCache[char]
    if c and tick() - c.tick < 0.5 then return c.cd, c.items, c.trinkets end
    local cd, items, trinkets = readToonInfo(char)
    toonInfoCache[char] = { cd = cd, items = items, trinkets = trinkets, tick = tick() }
    return cd, items, trinkets
end

local function buildItemPath(items, slots)
    local out = {}
    for i = 1, slots do
        out[i] = items[i] or "none"
    end
    return table.concat(out, ", ")
end

local function buildTrinketPath(trinkets, slots)
    local out = {}
    for i = 1, slots do
        local t = trinkets[i]
        if t then
            local colour = t.active and "#FFFFFF" or "#888888"
            out[i] = string.format('<font color="%s">%s</font>', colour, Release.escape(t.name))
        else
            out[i] = '<font color="#888888">none</font>'
        end
    end
    return table.concat(out, ", ")
end

function removeToon(plr)
    local e = ToonESP[plr]
    if not e then return end
    for _, o in ipairs(e.objs) do pcall(function() o:Destroy() end) end
    ToonESP[plr] = nil
end

local function makeToon(plr, char, root)
    local e = { char = char, root = root, objs = {} }
    local col = catColor("Toons")

    local hl = Instance.new("Highlight")
    hl.Adornee = char
    hl.FillColor = col
    hl.OutlineColor = Color3.new(1, 1, 1)
    hl.FillTransparency = 0.6
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = ESPRoot
    e.hl = hl
    e.objs[#e.objs + 1] = hl

    local bb = Instance.new("BillboardGui")
    bb.Adornee = root
    bb.AlwaysOnTop = true
    bb.Size = UDim2.fromOffset(260, 40)
    bb.StudsOffset = Vector3.new(0, -3.5, 0)
    bb.Parent = ESPRoot
    e.objs[#e.objs + 1] = bb
    e.bb = bb

    local label = Instance.new("TextLabel")
    label.Size = UDim2.fromScale(1, 1)
    label.BackgroundTransparency = 1
    label.TextColor3 = col
    label.TextStrokeTransparency = 0.3
    label.Font = Enum.Font.GothamBold
    label.TextSize = 13
    label.TextYAlignment = Enum.TextYAlignment.Top
    label.RichText = true
    label.Text = plr.DisplayName
    label.Parent = bb
    e.label = label
    fadeInLabel(label)

    ToonESP[plr] = e
    return e
end

local function reconcileToons()
    if not T("ESP") or not T("ESP_Toons") then
        for plr in pairs(ToonESP) do removeToon(plr) end
        return
    end
    local _, _, myRoot = getChar()
    local col = catColor("Toons")
    local seen = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local char = plr.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if char and char.Parent and root and hum and hum.Health > 0 then
                seen[plr] = true
                local e = ToonESP[plr]
                if e and (e.char ~= char or e.root ~= root or not e.root.Parent
                    or not e.label.Parent or not e.hl.Parent or not e.bb.Parent) then
                    removeToon(plr)
                    e = nil
                end
                if not e then e = makeToon(plr, char, root) end
                e.hl.FillColor = col
                e.label.TextColor3 = col

                if not T("TxtToons") then
                    e.label.Visible = false
                else
                e.label.Visible = true

                local lines = {}
                local nameLine = plr.DisplayName
                if T("ESPDistance") and myRoot then
                    nameLine = nameLine .. " [" .. math.floor((root.Position - myRoot.Position).Magnitude) .. "]"
                end
                lines[#lines + 1] = nameLine

                local cd, items, trinkets = readToonInfoCached(char)
                if cd then lines[#lines + 1] = "cd " .. cd end

                lines[#lines + 1] = "items: " .. buildItemPath(items, TOON_ITEM_SLOTS)

                if trinkets and #trinkets > 0 then
                    lines[#lines + 1] = "trinkets: " .. buildTrinketPath(trinkets, TOON_TRINKET_SLOTS)
                end

                local text = table.concat(lines, "\n")
                if e.label.Text ~= text then e.label.Text = text end
                local h = 8 + #lines * 15
                if e.bb.Size.Y.Offset ~= h then
                    if T("SmoothText") then
                        TweenService:Create(e.bb, TweenInfo.new(0.15), { Size = UDim2.fromOffset(260, h) }):Play()
                    else
                        e.bb.Size = UDim2.fromOffset(260, h)
                    end
                end
                end
            end
        end
    end
    for plr in pairs(ToonESP) do
        if not seen[plr] then removeToon(plr) end
    end
end

Conns.Idle = LocalPlayer.Idled:Connect(function()
    if T("AntiAFK") then
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end)

local Window
do
    local okWin, winOrErr = pcall(function()
        return Library:CreateWindow({
            Title = "gourdy hub  " .. VERSION,
            Footer = "made by gourdy~holloway",
            NotifySide = "Right",
            ShowCustomCursor = false,
            Size = UDim2.fromOffset(790, 630),
            Center = true,
            AutoShow = true,
        })
    end)
    if not okWin or type(winOrErr) ~= "table" then
        return
    end
    Window = winOrErr
end
pcall(function()
    if type(Library.Toggle) == "function" then
        Library:Toggle(true)
    end
end)

local Tabs = {
    Main = Window:AddTab("main", "home"),
    AutoFarm = Window:AddTab("farm", "sword"),
    Visuals = Window:AddTab("visuals", "eye"),
    Movement = Window:AddTab("move", "move"),
    Performance = Window:AddTab("perf", "zap"),
    Webhook = Window:AddTab("webhook", "send"),
    Settings = Window:AddTab("settings", "settings"),
}

local StatusBox = Tabs.Main:AddLeftGroupbox("status", "activity")
StatusLabel = StatusBox:AddLabel("idle", true)
CountLabel = StatusBox:AddLabel("scanning...", true)

local QuickBox = Tabs.Main:AddRightGroupbox("quick", "toggle-left")
QuickBox:AddToggle("AntiAFK", { Text = "anti afk", Default = true })
QuickBox:AddToggle("InstantSkillCheck", {
    Text = "instant skillcheck",
    Default = false,
    Tooltip = "works without farm, snaps marker to gold and clicks",
})

local FarmBox = Tabs.AutoFarm:AddLeftGroupbox("farm", "sword")
FarmBox:AddLabel("pure tp, no walking", true)
FarmBox:AddToggle("AutoFarm", {
    Text = "auto farm",
    Default = false,
    Callback = function(v)
        if v then
            Library:Notify("farm on", 2)
            startFarm()
        else
            Library:Notify("farm off", 2)
            stopFarm()
        end
    end,
})
FarmBox:AddToggle("PrioritizeItems", { Text = "items first", Default = true })
FarmBox:AddToggle("FinishMachineFirst", { Text = "finish machine first", Default = true })
FarmBox:AddToggle("SkipDone", { Text = "skip done", Default = true })
FarmBox:AddToggle("SkipConnie", { Text = "skip connie", Default = true })
FarmBox:AddToggle("SwitchStuck", { Text = "switch if stuck", Default = true })
FarmBox:AddToggle("PreferLowProgress", { Text = "prefer low progress", Default = true })
FarmBox:AddToggle("AvoidTwisted", { Text = "avoid twisteds", Default = true })
FarmBox:AddToggle("HideInWalls", { Text = "hide when chased", Default = true })
FarmBox:AddToggle("TreadmillSprint", { Text = "treadmill sprint", Default = true })
FarmBox:AddToggle("InstantPrompts", { Text = "instant prompts", Default = true })

local ToTBox = Tabs.AutoFarm:AddRightGroupbox("trick or treat", "zap")
ToTBox:AddToggle("AutoToT", {
    Text = "auto tot",
    Default = false,
    Callback = function(v)
        if v then startToT() else ToTToken = ToTToken + 1 State.ToT = false end
    end,
})
ToTBox:AddToggle("ToTEveryPart", { Text = "visit every part", Default = true })
ToTBox:AddToggle("ToTLoop", { Text = "loop", Default = false })
ToTBox:AddSlider("ToTDwell", { Text = "time per part", Default = 0.4, Min = 0.1, Max = 2, Rounding = 2 })
ToTBox:AddSlider("ToTPartGap", { Text = "min part gap", Default = 3, Min = 0, Max = 10, Rounding = 1 })
ToTBox:AddSlider("ToTDelay", { Text = "delay", Default = 0.1, Min = 0, Max = 2, Rounding = 2 })

local FarmSet = Tabs.AutoFarm:AddLeftGroupbox("farm settings", "sliders")
FarmSet:AddSlider("ScanRate", { Text = "scan rate", Default = 0.08, Min = 0.05, Max = 1, Rounding = 2 })
FarmSet:AddSlider("MachineHold", { Text = "machine hold", Default = 2.2, Min = 0.8, Max = 10, Rounding = 1 })
FarmSet:AddSlider("MachineMax", { Text = "max time per machine", Default = 22, Min = 8, Max = 120, Rounding = 0 })
FarmSet:AddSlider("PromptRate", { Text = "prompt delay", Default = 0.05, Min = 0.03, Max = 0.3, Rounding = 2 })
FarmSet:AddSlider("DodgeDistance", { Text = "danger distance", Default = 34, Min = 15, Max = 80, Rounding = 0 })
FarmSet:AddSlider("SafeGenDistance", { Text = "skip near twisted", Default = 45, Min = 10, Max = 100, Rounding = 0 })
FarmSet:AddSlider("MaxDist", { Text = "max target dist", Default = 1500, Min = 100, Max = 3000, Rounding = 0 })

local EvBox = Tabs.AutoFarm:AddRightGroupbox("elevator & events", "door-open")
EvBox:AddToggle("GoElevator", { Text = "go to elevator when done", Default = true })
EvBox:AddInput("ElevatorName", {
    Text = "elevator name(s)",
    Default = "",
    Placeholder = "elevatordoor, exit",
    Finished = true,
    Callback = function() State.ElevCache.found = 0 State.ElevCache.tried = 0 end,
})
EvBox:AddSlider("ElevatorYOffset", { Text = "elevator offset", Default = 3, Min = 0, Max = 15, Rounding = 0 })
EvBox:AddToggle("UseLostInterest", { Text = "stop hiding on lostinterest", Default = true })
EvBox:AddSlider("LostInterestGrace", { Text = "ignore danger after", Default = 3, Min = 0, Max = 10, Rounding = 1 })
EvBox:AddInput("SpottedEvent", { Text = "spotted event (optional)", Default = "", Placeholder = "remote name", Finished = true })
EvBox:AddSlider("SpottedHold", { Text = "spotted lasts", Default = 6, Min = 1, Max = 20, Rounding = 0 })
EvBox:AddToggle("AutoStopInteract", { Text = "auto stop interacting", Default = true })
EvBox:AddToggle("LogStoryEvents", { Text = "log story events", Default = false })

local SCSet = Tabs.AutoFarm:AddLeftGroupbox("skill check", "zap")
SCSet:AddLabel("auto mode needs farm on, instant is on main", true)
SCSet:AddToggle("AutoSkillCheck", { Text = "auto skillcheck", Default = true })
SCSet:AddDropdown("SkillKey", { Text = "key", Values = { "Space", "E", "F", "Q", "R", "Click" }, Default = "Space" })
SCSet:AddDropdown("SkillMatch", {
    Text = "fire when",
    Values = { "Marker center in Gold", "Marker touches Gold" },
    Default = "Marker center in Gold",
})
SCSet:AddSlider("SkillLead", { Text = "press early", Default = 0.03, Min = 0, Max = 0.15, Rounding = 3 })
SCSet:AddSlider("SkillTol", { Text = "angle tol", Default = 12, Min = 2, Max = 45, Rounding = 0 })
SCSet:AddSlider("SkillOffset", { Text = "angle offset", Default = 0, Min = -180, Max = 180, Rounding = 0 })
SCSet:AddSlider("SkillPixelTol", { Text = "pixel tol", Default = 4, Min = 0, Max = 20, Rounding = 0 })
SCSet:AddButton({ Text = "print skill gui", Func = dumpSkillCheck })

local HideSet = Tabs.AutoFarm:AddRightGroupbox("hiding", "eye")
HideSet:AddSlider("RoofWalkDistance", { Text = "walk before roof tp", Default = 7, Min = 3, Max = 15, Rounding = 0 })
HideSet:AddInput("BaseplateName", { Text = "underground baseplate", Default = "Baseplate", Finished = true })
HideSet:AddSlider("UndergroundRetryTimeout", { Text = "baseplate retry timeout", Default = 20, Min = 5, Max = 60, Rounding = 0 })
HideSet:AddDropdown("HideWhen", {
    Text = "hide when",
    Values = { "Any time a twisted is close", "Unsafe machine + spotted" },
    Default = "Any time a twisted is close",
})
HideSet:AddDropdown("HideMode", {
    Text = "hide mode",
    Values = { "Map Roof", "Underground", "Elevator", "FakeElevator", "Machine Top", "Thick Parts" },
    Default = "Map Roof",
    Callback = function(v)
        if v == "Thick Parts" then task.spawn(function() pcall(refreshHideSpots) end) end
    end,
})
HideSet:AddDropdown("HideMove", { Text = "hide travel", Values = { "Smooth TP", "Tween", "Instant TP" }, Default = "Smooth TP" })
HideSet:AddSlider("HideRiseSpeed", { Text = "hide rise speed", Default = 60, Min = 20, Max = 250, Rounding = 0 })
HideSet:AddSlider("HideHeight", { Text = "height above roof", Default = 10, Min = 3, Max = 60, Rounding = 0 })
HideSet:AddSlider("MaxClimb", { Text = "max climb", Default = 140, Min = 30, Max = 400, Rounding = 0 })
HideSet:AddSlider("FakeElevOffset", { Text = "elevator hide height", Default = 3, Min = 0, Max = 15, Rounding = 0 })
HideSet:AddSlider("HideRoofOverride", { Text = "roof y override", Default = 0, Min = 0, Max = 3000, Rounding = 0 })
HideSet:AddSlider("HideThickness", { Text = "thick parts min", Default = 5, Min = 2, Max = 20, Rounding = 0 })
HideSet:AddSlider("MaxHideTime", { Text = "max hide time", Default = 25, Min = 5, Max = 60, Rounding = 0 })
HideSet:AddButton({
    Text = "test hide mode",
    Func = function()
        if State.Hiding then return end
        task.spawn(function()
            Library:Notify("testing " .. tostring(O("HideMode")) .. " for 4s", 2)
            hideFromTwisted(function() return Running end, 4)
        end)
    end,
})
HideSet:AddButton({
    Text = "rescan spots",
    Func = function()
        task.spawn(function()
            refreshHideSpots()
            Library:Notify("found " .. #HideSpots .. " spots", 3)
        end)
    end,
})

local FindBox = Tabs.AutoFarm:AddLeftGroupbox("folder names", "settings")
FindBox:AddLabel("extra folder names, comma separated", true)
local function extraInput(idx, text, placeholder)
    FindBox:AddInput(idx, {
        Text = text, Default = "", Placeholder = placeholder, Finished = true,
        Callback = function() ForceRescan = true end,
    })
end
extraInput("Extra_Items", "extra item folders", "pickups")
extraInput("Extra_Generators", "extra machine folders", "machines")
extraInput("Extra_Monsters", "extra twisted folders", "twisteds")
extraInput("Extra_ToT", "extra tot folders", "totdoors")
FindBox:AddButton({
    Text = "rescan + print",
    Func = function()
        findRoots()
        for _, cat in ipairs(CAT_ORDER) do
            Cache[cat] = collectUnits(cat)
            if #Roots[cat] == 0 then

            else
                for _, r in ipairs(Roots[cat]) do

                end
            end
        end
        Library:Notify("printed to f9", 3)
    end,
})

local BlackBox = Tabs.AutoFarm:AddRightGroupbox("blacklist", "ban")
BlackBox:AddLabel("names, comma separated, partial match", true)
local function blackInput(idx, text, placeholder)
    BlackBox:AddInput(idx, {
        Text = text, Default = "", Placeholder = placeholder, Finished = true,
        Callback = function() ForceRescan = true end,
    })
end
blackInput("Blacklist_Items", "blacklist items", "candy")
blackInput("Blacklist_Generators", "blacklist machines", "machine3")
blackInput("Blacklist_Monsters", "blacklist twisteds", "boxten")
blackInput("Blacklist_ToT", "blacklist tot doors", "door2")
BlackBox:AddButton({
    Text = "blacklist nearest machine",
    Func = function()
        local _, _, root = getChar()
        if not root then return end
        local best, bd
        for _, u in ipairs(units("Generators")) do
            local p = basePart(u)
            if p then
                local d = (p.Position - root.Position).Magnitude
                if not bd or d < bd then best, bd = u, d end
            end
        end
        if best then
            BlacklistUnits[best] = true
            Cache.Generators = collectUnits("Generators")
            Library:Notify("added " .. best.Name, 3)
        else
            Library:Notify("no machine", 2)
        end
    end,
})
BlackBox:AddButton({
    Text = "clear machine blacklist",
    Func = function()
        BlacklistUnits = {}
        ForceRescan = true
        Library:Notify("cleared", 2)
    end,
})

local ESPBox = Tabs.Visuals:AddLeftGroupbox("esp", "eye")
ESPBox:AddToggle("ESP", { Text = "esp master", Default = true })
ESPBox:AddToggle("ESP_Monsters", { Text = "twisteds", Default = true })
ESPBox:AddToggle("ESP_Items", { Text = "items", Default = true })
ESPBox:AddToggle("ESP_Generators", { Text = "machines", Default = true })
ESPBox:AddToggle("ESP_ToT", { Text = "tot doors", Default = true })
ESPBox:AddToggle("ESP_Toons", { Text = "players", Default = true })
ESPBox:AddToggle("ESPDistance", { Text = "show distance", Default = true })

local TextToggleBox = Tabs.Visuals:AddLeftGroupbox("text toggles", "type")
TextToggleBox:AddLabel("turn text off per category", true)
TextToggleBox:AddToggle("TxtItems", { Text = "item names", Default = true })
TextToggleBox:AddToggle("TxtTwisteds", { Text = "twisted info", Default = true })
TextToggleBox:AddToggle("TxtToTDoors", { Text = "tot door names", Default = true })
TextToggleBox:AddToggle("TxtToons", { Text = "player info", Default = true })

local MachineTextBox = Tabs.Visuals:AddRightGroupbox("machine text", "cog")
MachineTextBox:AddToggle("TxtName", { Text = "name", Default = true })
MachineTextBox:AddToggle("TxtProgress", { Text = "progress", Default = true })
MachineTextBox:AddToggle("TxtConnie", { Text = "connie", Default = true })
MachineTextBox:AddToggle("TxtCompleted", { Text = "done", Default = true })
MachineTextBox:AddToggle("TxtSafe", { Text = "safe", Default = true })
MachineTextBox:AddToggle("RisingOrange", { Text = "orange fill rising", Default = true })
MachineTextBox:AddSlider("SafeLabelDistance", { Text = "twisted near", Default = 45, Min = 10, Max = 120, Rounding = 0 })
MachineTextBox:AddSlider("RisingHold", { Text = "orange hold", Default = 1.5, Min = 0.3, Max = 5, Rounding = 1 })
MachineTextBox:AddSlider("ESPMaxDist", { Text = "esp max dist", Default = 5000, Min = 100, Max = 5000, Rounding = 0 })
MachineTextBox:AddSlider("ESPTextSize", { Text = "text size", Default = 13, Min = 9, Max = 24, Rounding = 0 })

local ThemeBox = Tabs.Visuals:AddRightGroupbox("theme", "palette")
ThemeBox:AddDropdown("ESPTheme", {
    Text = "esp theme",
    Values = { "Default", "Neon", "Pastel", "Mono" },
    Default = "Default",
    Callback = function()
        for _, e in pairs(ESPObjects) do
            local col = catColor(e.cat)
            if e.label then e.label.TextColor3 = col end
            if e.hl then e.hl.FillColor = col end
            if e.box then e.box.Color3 = col end
            if e.chaseImg then e.chaseImg.ImageColor3 = col end
        end
        for _, e in pairs(ToonESP) do
            local col = catColor("Toons")
            if e.hl then e.hl.FillColor = col end
            if e.label then e.label.TextColor3 = col end
        end
    end,
})
ThemeBox:AddToggle("SmoothText", {
    Text = "smooth anims",
    Default = true,
    Tooltip = "fade in + smooth size changes. turn off for instant.",
})
ThemeBox:AddLabel("pickers below override the theme", true)
ThemeBox:AddLabel("items"):AddColorPicker("Color_Items", { Default = baseColor("Items"), Title = "items" })
ThemeBox:AddLabel("machines"):AddColorPicker("Color_Generators", { Default = baseColor("Generators"), Title = "machines" })
ThemeBox:AddLabel("twisteds"):AddColorPicker("Color_Monsters", { Default = baseColor("Monsters"), Title = "twisteds" })
ThemeBox:AddLabel("tot doors"):AddColorPicker("Color_ToT", { Default = baseColor("ToT"), Title = "tot doors" })
ThemeBox:AddLabel("players"):AddColorPicker("ToonColor", { Default = baseColor("Toons"), Title = "players" })

local KRBox = Tabs.Visuals:AddLeftGroupbox("kill-range", "target")
KRBox:AddToggle("KillRange", { Text = "kill range circle", Default = true })
KRBox:AddLabel("red sphere around twisteds from KillRadius", true)

ESPBox:AddButton({
    Text = "refresh esp",
    Func = function()
        refreshAllESP()
        ForceRescan = true
        Library:Notify("refreshed", 1.5)
    end,
})

local MoveBox = Tabs.Movement:AddLeftGroupbox("movement", "move")
MoveBox:AddLabel("tp only, nothing walks or flies", true)
MoveBox:AddToggle("Noclip", { Text = "noclip while moving", Default = true })
MoveBox:AddToggle("MoveDebug", { Text = "movement debug", Default = false })
MoveBox:AddToggle("InfStamina", {
    Text = "infinite stamina",
    Default = false,
    Tooltip = "locks currentstamina to boundarysize / maxstamina",
})

local InfoBox = Tabs.Movement:AddRightGroupbox("info", "info")
InfoBox:AddLabel("stamina scan: currentstamina, boundarysize, maxstamina, staminamax", true)
InfoBox:AddLabel("noclip is auto on while farming or hiding", true)

local PerfBox = Tabs.Performance:AddLeftGroupbox("performance", "zap")
Release.fpsLabel = PerfBox:AddLabel("measuring...", true)
PerfBox:AddToggle("FPSBoost", { Text = "fps boost", Default = false, Callback = Release.boost })
PerfBox:AddLabel("kills shadows and particles, restores when off", true)

local AdaptiveBox = Tabs.Performance:AddRightGroupbox("adaptive esp", "eye")
AdaptiveBox:AddToggle("AdaptiveItemESP", {
    Text = "limit item esp when lagging",
    Default = true,
    Callback = function(v)
        if not v then
            Release.itemBudget = math.huge
            Release.lagging = false
        end
    end,
})
AdaptiveBox:AddSlider("LagFPS", { Text = "low fps threshold", Default = 35, Min = 10, Max = 100, Rounding = 0 })
AdaptiveBox:AddSlider("LagItemLimit", { Text = "items during lag", Default = 5, Min = 1, Max = 20, Rounding = 0 })
AdaptiveBox:AddSlider("LagRecovery", { Text = "recovery time", Default = 3, Min = 1, Max = 15, Rounding = 0 })
AdaptiveBox:AddSlider("LagRestoreBatch", { Text = "items restored per sec", Default = 3, Min = 1, Max = 20, Rounding = 0 })

local WebhookBox = Tabs.Webhook:AddLeftGroupbox("discord", "send")
WebhookBox:AddLabel("opt-in only, url isnt saved to config", true)
WebhookBox:AddInput("DiscordWebhookURL", {
    Text = "webhook url",
    Default = "", Finished = true,
    Placeholder = "https://discord.com/api/webhooks/...",
})
WebhookBox:AddToggle("WebhookEnabled", { Text = "enable", Default = false })
WebhookBox:AddSlider("WebhookInterval", { Text = "interval (s)", Default = 300, Min = 30, Max = 1800, Rounding = 0 })
WebhookBox:AddButton({
    Text = "send test",
    Func = function()
        if not T("WebhookEnabled") then
            Library:Notify("enable first", 3)
            return
        end
        task.spawn(Release.webhook, true)
    end,
})

local WebhookFieldsBox = Tabs.Webhook:AddRightGroupbox("included data", "sliders")
WebhookFieldsBox:AddToggle("WebhookCounts", { Text = "map counts", Default = true })
WebhookFieldsBox:AddToggle("WebhookPerformance", { Text = "fps", Default = true })
WebhookFieldsBox:AddToggle("WebhookMap", { Text = "map name", Default = false })
WebhookFieldsBox:AddToggle("WebhookPlayer", { Text = "player name", Default = false })

local MenuBox = Tabs.Settings:AddLeftGroupbox("menu", "settings")
MenuBox:AddButton({ Text = "unload", Func = function() Library:Unload() end })
MenuBox:AddLabel("keybind"):AddKeyPicker("MenuKeybind", {
    Default = "RightShift", NoUI = true, Text = "menu keybind",
})
Library.ToggleKeybind = Options.MenuKeybind

local LogBox = Tabs.Settings:AddRightGroupbox("version", "scroll-text")
LogBox:AddLabel("current: " .. VERSION, true)
LogBox:AddLabel("0.0.8 - chase icon under twisted, item path display, cd gating for event only abilities, smooth theme stuff, skillcheck circle fix", true)

Library:OnUnload(function()
    Running = false
    Release.restoreGraphics()
    disableStrongNoclip()
    FarmToken = FarmToken + 1
    ToTToken = ToTToken + 1
    State.ToT = false
    State.Hiding = false
    releaseAllKeys()
    clearHover()
    for u in pairs(ESPObjects) do removeESP(u) end
    for p in pairs(ToonESP) do removeToon(p) end
    for _, data in pairs(KillRangeCache) do
        if data.sphere then data.sphere:Destroy() end
    end
    table.clear(KillRangeCache)
    genv.GourdyUnload = nil
    pcall(function() ESPRoot:Destroy() end)
    for _, c in pairs(Conns) do pcall(function() c:Disconnect() end) end
    local _, hum = getChar()
    if hum then hum.WalkSpeed = 16 end
end)

genv.GourdyUnload = function() pcall(function() Library:Unload() end) end

if ThemeManager then
    ThemeManager:SetLibrary(Library)
    ThemeManager:SetFolder("GourdyHub")
    ThemeManager:ApplyToTab(Tabs.Settings)
end
if SaveManager then
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({ "MenuKeybind", "DiscordWebhookURL", "WebhookEnabled" })
    SaveManager:SetFolder("GourdyHub")
    SaveManager:BuildConfigSection(Tabs.Settings)
    SaveManager:LoadAutoloadConfig()
end

task.spawn(function()
    local lastRoots, tickNum, lastCount = 0, 0, ""
    while Running do
        tickNum = tickNum + 1
        local ok, err = pcall(function()
            updateCurrentMap()
            if ForceRescan or tick() - lastRoots > 3 then
                ForceRescan = false
                lastRoots = tick()
                findRoots()
            end
            for _, cat in ipairs(CAT_ORDER) do
                Cache[cat] = collectUnits(cat)
            end
            State.espBudget = math.min((State.espBudget or 0) + 8, 40)
            reconcileESP()
            reconcileToons()
            updateKillRanges()

            if tickNum % 100 == 0 then
                for u in pairs(StatCache) do if not u.Parent then StatCache[u] = nil end end
                for u in pairs(SkipUntil) do if not u.Parent then SkipUntil[u] = nil end end
                for u in pairs(MachineTime) do if not u.Parent then MachineTime[u] = nil end end
                for u in pairs(MachineLast) do if not u.Parent then MachineLast[u] = nil end end
                for u in pairs(BlacklistUnits) do if not u.Parent then BlacklistUnits[u] = nil end end
                for c in pairs(toonInfoCache) do if not c.Parent then toonInfoCache[c] = nil end end
                for c in pairs(twistedInfoCache) do if not c.Parent then twistedInfoCache[c] = nil end end
            end

            local summary = string.format("items %d  ·  machines %d  ·  twisteds %d  ·  tot %d",
                #Cache.Items, #Cache.Generators, #Cache.Monsters, #Cache.ToT)
            if summary ~= lastCount and CountLabel then
                lastCount = summary
                CountLabel:SetText(summary)
            end
        end)
        if not ok then end
        task.wait(math.max(O("ScanRate") or 0.1, (T("FPSBoost") or Release.lagging) and 0.2 or 0))
    end
end)

Library:Notify("gourdy hub " .. VERSION .. " loaded", 4)

task.spawn(function()
    while Running do
        if T("WebhookEnabled") and tick() - Release.lastSend >= (O("WebhookInterval") or 300)
            and tick() >= Release.nextSend then
            Release.webhook(false)
        end
        task.wait(1)
    end
end)