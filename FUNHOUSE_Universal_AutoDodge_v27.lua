local RS = game:GetService("ReplicatedStorage")

local Core = RS:FindFirstChild("Core")
local Combat = Core and Core:FindFirstChild("Combat")
local Data = Core and Core:FindFirstChild("Data")
local ConfigModule = Data and Data:FindFirstChild("Config")
local BattleModule = Combat and Combat:FindFirstChild("Battle")
local SoulModule = Combat and Combat:FindFirstChild("Soul")
local HitboxModule = Combat and Combat:FindFirstChild("Hitbox")
local GmSceneModule = Combat and Combat:FindFirstChild("GmScene")

if not BattleModule or not SoulModule or not HitboxModule then
    return
end

local okHit, Hitbox = pcall(require, HitboxModule)
if not okHit or type(Hitbox) ~= "table" then
    return
end

local GmScene
if GmSceneModule then
    pcall(function() GmScene = require(GmSceneModule) end)
end

local Config
if ConfigModule then
    pcall(function()
        Config = require(ConfigModule)
    end)
end

local GEN = (getgenv and getgenv()) or _G
if GEN.__FUNHOUSE_AUTODODGE_V27 then
    return
end
GEN.__FUNHOUSE_AUTODODGE_V27 = true

local PI = math.pi
local PI2 = PI * 2
local DIAG = 0.7071067811865476
local EPS = 0.000001
local MAX_BULLETS = 180
local MAX_THREATS = 48
local MAX_SPECIAL = 48
local MAX_SPECIAL_LISTS = 6
local NORMAL_GAP = 3
local FAST_GAP = 2
local NORMAL_HORIZON = 30
local ROUTE_DEPTH = 18
local ROUTE_BEAM = 3
local MAX_DIRECT_OBJECTS = 18
local FAST_HORIZON = 45
local MARGIN = 4.0
local OUTSIDE_RANGE = 1200
local STATIONARY_AIM_SPEED = 86
local STATIONARY_AIM_MAX_SPEED = 150
local CURVE_TURN_LIMIT = 1.15
local HARD = 1000000
local NEAR = 70000

local DIRS = {
    {0,0,"N"},
    {1,0,"R"},
    {-1,0,"L"},
    {0,1,"D"},
    {0,-1,"U"},
    {1,1,"RD"},
    {1,-1,"RU"},
    {-1,1,"LD"},
    {-1,-1,"LU"}
}

local S = {
    Battle = nil,
    Soul = nil,
    ControllerOriginal = nil,
    InputHolders = setmetatable({}, {__mode = "k"}),
    BattleHolders = setmetatable({}, {__mode = "k"}),
    Tracks = setmetatable({}, {__mode = "k"}),
    SpecialTracks = setmetatable({}, {__mode = "k"}),
    SpecialObjects = {},
    DirectObjects = {},
    GcScanList = nil,
    GcScanIndex = 1,
    GcScanFound = {},
    GcScanSeen = setmetatable({}, {__mode = "k"}),
    SpecialLists = {},
    SpecialSeen = setmetatable({}, {__mode = "k"}),
    Threats = {},
    ThreatCount = 0,
    RouteThreats = {},
    RouteThreatCount = 0,
    SpecialThreats = {},
    SpecialCount = 0,
    RouteSpecials = {},
    RouteSpecialCount = 0,
    DirX = 0,
    DirY = 0,
    ShieldX = 0,
    ShieldY = 0,
    Fast = false,
    LastFrame = -1,
    LastDecision = -100,
    LastWaveRefresh = -100,
    BoxData = {valid=false,free=false,frames={},l={},b={},r={},t={}},
    SoulW = 12,
    SoulH = 12,
    SoulOX = 0,
    SoulOY = 0,
    SoulSizeR = 8,
    BlockFn = nil,
    BoxFree = false,
    WaveFns = setmetatable({}, {__mode = "k"}),
    GmScenes = setmetatable({}, {__mode = "k"}),
    SceneTracks = setmetatable({}, {__mode = "k"}),
    LastGcSpecialScan = 0,
    LastSceneScan = 0,
    SceneHooked = false,
    DecisionError = "",
    DecisionOk = false,
    FallbackUsed = false,
    LastSoulX = nil,
    LastSoulY = nil,
    StuckCount = 0,
    StuckDirX = 0,
    StuckDirY = 0
}

for i = 1, MAX_THREATS do
    S.Threats[i] = {obj=nil, tr=nil, p=0}
end
for i = 1, MAX_SPECIAL do
    S.SpecialThreats[i] = {x=0,y=0,w=0,h=0,a=0,shape="Rect",tr=nil,obj=nil}
end

local function finite(v)
    return type(v) == "number" and v == v and v > -math.huge and v < math.huge
end

local function num(v,d)
    v = tonumber(v)
    if finite(v) then
        return v
    end
    return d
end

local function raw(o,k)
    if type(o) ~= "table" then
        return nil
    end
    return rawget(o,k)
end

local function getMethod(o,k)
    if type(o) ~= "table" then
        return nil
    end
    local f = rawget(o,k)
    if type(f) == "function" then
        return f
    end
    local mt = getmetatable(o)
    if type(mt) ~= "table" then
        return nil
    end
    local idx = rawget(mt,"__index")
    if type(idx) == "table" then
        f = rawget(idx,k)
        if type(f) == "function" then
            return f
        end
    elseif type(idx) == "function" then
        local ok,v = pcall(idx,o,k)
        if ok and type(v) == "function" then
            return v
        end
    end
    return nil
end

local function clamp(v,a,b)
    if v < a then return a end
    if v > b then return b end
    return v
end

local function sign(v)
    if v > 0 then return 1 end
    if v < 0 then return -1 end
    return 0
end

local function dist2(ax,ay,bx,by)
    local dx = ax - bx
    local dy = ay - by
    return dx * dx + dy * dy
end

local function angleWrap(a)
    return (a + PI) % PI2 - PI
end

local function getUpvalues(fn)
    if type(getupvalues) == "function" then
        local ok,v = pcall(getupvalues,fn)
        if ok and type(v) == "table" then
            return v
        end
    end
    if type(debug) == "table" and type(debug.getupvalue) == "function" then
        local out = {}
        for i = 1,80 do
            local ok,n,v = pcall(debug.getupvalue,fn,i)
            if not ok or n == nil then
                break
            end
            out[i] = v
        end
        return out
    end
end

local function addSeen(list,v,limit)
    if #list >= limit or type(v) ~= "table" then
        return
    end
    if S.SpecialSeen[v] then
        return
    end
    S.SpecialSeen[v] = true
    list[#list + 1] = v
end

local function looksSpecial(v)
    if type(v) ~= "table" then
        return false
    end
    local hb = raw(v,"Hitbox")
    local x = raw(v,"X")
    local y = raw(v,"Y")
    if type(hb) == "table" then
        if raw(hb,"Alive") == false then
            return false
        end
        x = finite(raw(hb,"X")) and raw(hb,"X") or x
        y = finite(raw(hb,"Y")) and raw(hb,"Y") or y
    end
    if not finite(x) or not finite(y) then
        return false
    end
    local d = raw(v,"Damage")
    if d == nil and type(hb) == "table" then
        d = raw(hb,"Damage")
    end
    if type(hb) == "table" and finite(raw(hb,"Width")) and finite(raw(hb,"Height")) and finite(raw(hb,"Angle")) and d ~= nil then
        return true
    end
    local w = raw(v,"Width")
    local h = raw(v,"Height")
    local a = raw(v,"Angle")
    if finite(w) and finite(h) and finite(a) and d ~= nil then
        return true
    end
    local f = getMethod and getMethod(v,"GetHitbox")
    if type(f) == "function" and d ~= nil then
        return true
    end
    return false
end

local function walkWaveState(v,depth,seen)
    if depth > 4 or type(v) ~= "table" or seen[v] then
        return
    end
    seen[v] = true

    local spears = raw(v,"Spears")
    if type(spears) == "table" then
        addSeen(S.SpecialLists,spears,MAX_SPECIAL_LISTS)
    end

    if looksSpecial(v) then
        addSeen(S.SpecialObjects,v,MAX_SPECIAL)
    end

    local hitbox = raw(v,"Hitbox")
    if type(hitbox) == "table" and finite(raw(v,"X")) and finite(raw(v,"Y")) then
        local damage = raw(v,"Damage")
        local timer = raw(v,"Timer")
        local direction = raw(v,"Direction")
        local widthGoal = raw(v,"WidthGoal")
        if damage ~= nil or type(timer) == "number" or type(direction) == "number" or type(widthGoal) == "number" then
            addSeen(S.SpecialObjects,v,MAX_SPECIAL)
        end
    end

    local n = 0
    for k,value in pairs(v) do
        n += 1
        if n > 100 then
            break
        end
        if type(value) == "table" then
            if k == "Spears" or k == "collectionState" or k == "Hitbox" or k == "State" or k == "Scene" or k == "Soul" or k == "Battle" or type(k) == "number" then
                walkWaveState(value,depth + 1,seen)
            end
        end
    end
end

local function scanWaveFunction(fn)
    if type(fn) ~= "function" or S.WaveFns[fn] then
        return
    end
    S.WaveFns[fn] = true
    local ups = getUpvalues(fn)
    if type(ups) ~= "table" then
        return
    end
    local seen = {}
    for _,v in pairs(ups) do
        if type(v) == "table" then
            walkWaveState(v,0,seen)
        end
    end
end

local function getSoul(battle)
    local soul = raw(battle,"Soul")
    if type(soul) == "table" and raw(soul,"Active") ~= false and raw(soul,"Puppet") ~= true then
        return soul
    end
    local souls = raw(battle,"Souls")
    if type(souls) == "table" then
        for i = 1,#souls do
            local v = souls[i]
            if type(v) == "table" and raw(v,"Active") ~= false and raw(v,"Puppet") ~= true and finite(raw(v,"X")) and finite(raw(v,"Y")) then
                return v
            end
        end
    end
end

local function readSoulGeometry(soul)
    local w,h = 12,12
    local fn = getMethod(soul,"HitboxSize")
    if type(fn) == "function" then
        local ok,a,b = pcall(fn,soul)
        if ok and finite(a) and finite(b) then
            w = math.abs(a)
            h = math.abs(b)
        end
    elseif type(Config) == "table" and type(Config.Soul) == "table" then
        w = math.abs(num(raw(Config.Soul,"HitboxWidth"),12))
        h = math.abs(num(raw(Config.Soul,"HitboxHeight"),12))
    end
    S.SoulW = w
    S.SoulH = h
    if type(Config) == "table" and type(Config.Soul) == "table" then
        S.SoulOX = num(raw(Config.Soul,"HitboxOffsetX"),0)
        S.SoulOY = num(raw(Config.Soul,"HitboxOffsetY"),0)
    else
        S.SoulOX = 0
        S.SoulOY = 0
    end
    S.SoulSizeR = math.sqrt(w * w + h * h) * 0.5
    S.BlockFn = getMethod(soul,"IsBlocked")
end

local function prepareBox(battle,horizon)
    local box = raw(battle,"Box")
    local out = S.BoxData
    out.valid = false
    out.free = raw(S.Soul,"FreeRoam") == true
    S.BoxFree = out.free
    if type(box) ~= "table" or out.free then
        return out
    end

    local cx = num(raw(box,"CenterX"),0)
    local cy = num(raw(box,"CenterY"),0)
    local w = num(raw(box,"Width"),0)
    local h = num(raw(box,"Height"),0)
    local tx = num(raw(box,"TargetCenterX"),cx)
    local ty = num(raw(box,"TargetCenterY"),cy)
    local tw = num(raw(box,"TargetWidth"),w)
    local th = num(raw(box,"TargetHeight"),h)
    local sx = math.abs(num(raw(box,"StepCenterX"),0))
    local sy = math.abs(num(raw(box,"StepCenterY"),0))
    local sw = math.abs(num(raw(box,"StepWidth"),0))
    local sh = math.abs(num(raw(box,"StepHeight"),0))
    out.valid = finite(cx) and finite(cy) and finite(w) and finite(h)
    if not out.valid then
        return out
    end

    local k = 0
    for f = 0,horizon do
        k += 1
        local ccx = cx
        local ccy = cy
        local ww = w
        local hh = h

        if sx > 0 then
            ccx = ccx + sign(tx - ccx) * math.min(math.abs(tx - ccx),sx * f)
        end
        if sy > 0 then
            ccy = ccy + sign(ty - ccy) * math.min(math.abs(ty - ccy),sy * f)
        end
        if sw > 0 then
            ww = ww + sign(tw - ww) * math.min(math.abs(tw - ww),sw * f)
        end
        if sh > 0 then
            hh = hh + sign(th - hh) * math.min(math.abs(th - hh),sh * f)
        end

        out.frames[k] = f
        out.l[k] = ccx - ww * 0.5
        out.b[k] = ccy - hh * 0.5
        out.r[k] = ccx + ww * 0.5
        out.t[k] = ccy + hh * 0.5
    end
    out.count = k
    return out
end

local function boxAt(plan,frame)
    if not plan.valid or not plan.count or plan.count == 0 then
        return nil
    end
    local f = math.floor(num(frame,0))
    if f < 0 then f = 0 end
    if f >= plan.count then f = plan.count - 1 end
    local i = f + 1
    return plan.l[i],plan.b[i],plan.r[i],plan.t[i]
end

local function parseHitbox(o,fn)
    local hb = fn(o)
    if type(hb) ~= "table" then
        return nil
    end
    local shape = raw(hb,"Shape") or hb[1]
    local x = raw(hb,"X")
    local y = raw(hb,"Y")
    if not finite(x) then x = hb[2] end
    if not finite(y) then y = hb[3] end
    if not finite(x) or not finite(y) then
        return nil
    end
    if shape == "Circle" then
        local r = raw(hb,"Radius")
        if not finite(r) then
            r = raw(hb,"Width")
            if finite(r) then r = r * 0.5 end
        end
        return "Circle",x,y,math.abs(num(r,4)),0,0
    end
    local w = math.abs(num(raw(hb,"Width"),hb[4] or 8))
    local h = math.abs(num(raw(hb,"Height"),hb[5] or 8))
    local a = num(raw(hb,"Angle"),hb[6] or 0)
    if shape == "OrientedRect" or math.abs(a) > EPS then
        return "OrientedRect",x,y,w,h,a
    end
    return "Rect",x,y,w,h,0
end

local function getHitboxFn(track,o)
    if track and track.hfn then
        return track.hfn
    end
    local f = getMethod(o,"GetHitbox")
    if track then
        track.hfn = f
    end
    return f
end

local function getTrack(o)
    local t = S.Tracks[o]
    if t then
        return t
    end
    t = {
        hfn = getMethod(o,"GetHitbox"),
        x = 0,
        y = 0,
        vx = 0,
        vy = 0,
        ax = 0,
        ay = 0,
        angle = 0,
        av = 0,
        turn = 0,
        homing = 0,
        frame = -1,
        seen = 0,
        stationaryAge = 0,
        preAim = false,
        preAimSpeed = STATIONARY_AIM_SPEED,
        shape = "Rect",
        w = 8,
        h = 8,
        r = 4,
        wv = 0,
        hv = 0,
        px = table.create and table.create(40,0) or {},
        py = table.create and table.create(40,0) or {},
        pa = table.create and table.create(40,0) or {},
        pw = table.create and table.create(40,0) or {},
        ph = table.create and table.create(40,0) or {}
    }
    S.Tracks[o] = t
    return t
end

local function updateTrack(o,shape,x,y,w,h,a,r,frame)
    local t = getTrack(o)
    local rawVx = num(raw(o,"VX"),0)
    local rawVy = num(raw(o,"VY"),0)
    local rawSpin = num(raw(o,"Spin"),0)
    local oldX,oldY = t.x,t.y
    local oldVx,oldVy = t.vx,t.vy

    if t.seen > 0 then
        local df = frame - t.frame
        if df < 1 then df = 1 end
        if df > 6 then df = 6 end
        local ovx = (x - oldX) / df
        local ovy = (y - oldY) / df
        if math.sqrt(ovx * ovx + ovy * ovy) > 420 then
            ovx,ovy = rawVx,rawVy
        end
        local vx = ovx * 0.76 + rawVx * 0.24
        local vy = ovy * 0.76 + rawVy * 0.24
        local oldSpeed = math.sqrt(oldVx * oldVx + oldVy * oldVy)
        local newSpeed = math.sqrt(vx * vx + vy * vy)
        t.ax = clamp((vx - oldVx) / df,-45,45)
        t.ay = clamp((vy - oldVy) / df,-45,45)
        t.wv = clamp((w - t.w) / df,-60,60)
        t.hv = clamp((h - t.h) / df,-60,60)
        if oldSpeed > 0.5 and newSpeed > 0.5 then
            local turn = angleWrap(math.atan2(vy,vx) - math.atan2(oldVy,oldVx)) / df
            if math.abs(turn) <= CURVE_TURN_LIMIT then
                t.turn = clamp(t.turn * 0.30 + turn * 0.70,-CURVE_TURN_LIMIT,CURVE_TURN_LIMIT)
            else
                t.turn = clamp(turn,-CURVE_TURN_LIMIT,CURVE_TURN_LIMIT)
            end
            local tx = num(raw(S.Soul,"X"),x) - x
            local ty = num(raw(S.Soul,"Y"),y) - y
            local td = math.sqrt(tx * tx + ty * ty)
            local align = td > 0 and (tx * vx + ty * vy) / math.max(td * newSpeed,EPS) or 0
            if math.abs(t.turn) > 0.015 and align > 0.18 then
                t.homing = clamp(t.homing * 0.5 + math.abs(t.turn) * (align + 0.15) * 0.75,0,0.18)
            else
                t.homing = t.homing * 0.55
            end
        else
            t.homing = t.homing * 0.7
        end
        t.vx,t.vy = vx,vy
    else
        t.ax,t.ay,t.wv,t.hv = 0,0,0,0
        t.turn,t.homing = 0,0
        t.vx,t.vy = rawVx,rawVy
        t.stationaryAge = 0
    end

    if math.abs(t.vx) + math.abs(t.vy) < 0.000001 then
        t.stationaryAge += 1
    else
        t.stationaryAge = 0
    end

    t.x,t.y,t.angle = x,y,a
    t.av = rawSpin ~= 0 and (t.av * 0.55 + rawSpin * 0.45) or t.av
    t.shape,t.w,t.h = shape,w,h
    t.r = r or math.sqrt(w * w + h * h) * 0.5
    t.frame = frame
    t.seen += 1

    t.preAim = false
    local damage = num(raw(o,"Damage"),0)
    local harmful = raw(o,"Harmful") ~= false
    local noCull = raw(o,"NoCull") == true
    if harmful and damage > 0 and t.stationaryAge >= 1 and not S.BoxFree and S.BoxData.valid then
        local l,b,rgt,top = boxAt(S.BoxData,0)
        if l and (x < l - 12 or x > rgt + 12 or y < b - 12 or y > top + 12) then
            local sx,sy = num(raw(S.Soul,"X"),x),num(raw(S.Soul,"Y"),y)
            if dist2(x,y,sx,sy) <= OUTSIDE_RANGE * OUTSIDE_RANGE then
                t.preAim = true
                t.preAimSpeed = clamp(STATIONARY_AIM_SPEED,STATIONARY_AIM_SPEED,STATIONARY_AIM_MAX_SPEED)
            end
        end
    end
    return t
end

local function predictTrack(o,t,horizon)
    local x,y = t.x,t.y
    local vx,vy = t.vx,t.vy
    local rawAccel = num(raw(o,"Accel"),0)
    local gy = num(raw(o,"Gravity"),0)
    local angle = t.angle
    local w,h = t.w,t.h
    local turn = clamp(t.turn,-CURVE_TURN_LIMIT,CURVE_TURN_LIMIT)
    local homing = clamp(t.homing,0,0.22)
    local targetX,targetY = num(raw(S.Soul,"X"),x),num(raw(S.Soul,"Y"),y)

    for f = 0,horizon do
        if f > 0 then
            local speed = math.sqrt(vx * vx + vy * vy)

            if rawAccel ~= 0 and speed > EPS then
                local ns = math.max(0,speed + rawAccel)
                vx,vy = vx / speed * ns,vy / speed * ns
            end

            vx += t.ax
            vy += t.ay + gy

            local currentSpeed = math.sqrt(vx * vx + vy * vy)
            if currentSpeed > 0.5 and turn ~= 0 then
                local delta = turn

                if homing > 0 then
                    local toward = angleWrap(math.atan2(targetY - y,targetX - x) - math.atan2(vy,vx))
                    delta += clamp(toward,-homing,homing)
                end

                delta = clamp(delta,-1.05,1.05)
                local c,ss = math.cos(delta),math.sin(delta)
                vx,vy = vx * c - vy * ss,vx * ss + vy * c
            end

            x += vx
            y += vy
            angle += t.av
            w = math.max(0.1,w + t.wv)
            h = math.max(0.1,h + t.hv)
        end

        t.px[f + 1],t.py[f + 1] = x,y
        t.pa[f + 1] = angle
        t.pw[f + 1],t.ph[f + 1] = w,h
    end
end

local function circleAABB(cx,cy,r,sx,sy,sw,sh)
    local qx = clamp(cx,sx - sw * 0.5,sx + sw * 0.5)
    local qy = clamp(cy,sy - sh * 0.5,sy + sh * 0.5)
    local dx = cx - qx
    local dy = cy - qy
    local rr = r + MARGIN
    return dx * dx + dy * dy < rr * rr
end

local function obbAABB(cx,cy,w,h,angle,sx,sy,sw,sh)
    local c = math.cos(angle)
    local s = math.sin(angle)
    local ux1,uy1 = c,s
    local ux2,uy2 = -s,c
    local rx = sw * 0.5
    local ry = sh * 0.5
    local bx = w * 0.5
    local by = h * 0.5
    local dx = sx - cx
    local dy = sy - cy

    local p = math.abs(dx) - (rx + bx * math.abs(ux1) + by * math.abs(ux2))
    if p > MARGIN then return false end
    p = math.abs(dy) - (ry + bx * math.abs(uy1) + by * math.abs(uy2))
    if p > MARGIN then return false end
    p = math.abs(dx * ux1 + dy * uy1) - (rx * math.abs(ux1) + ry * math.abs(uy1) + bx)
    if p > MARGIN then return false end
    p = math.abs(dx * ux2 + dy * uy2) - (rx * math.abs(ux2) + ry * math.abs(uy2) + by)
    return p <= MARGIN
end

local function hazardHit(shape,x,y,w,h,a,r,sx,sy,sw,sh)
    if shape == "Circle" then
        return circleAABB(x,y,r,sx,sy,sw,sh)
    end
    if shape == "Rect" then
        return math.abs(x - sx) * 2 < w + sw + MARGIN * 2 and math.abs(y - sy) * 2 < h + sh + MARGIN * 2
    end
    return obbAABB(x,y,w,h,a,sx,sy,sw,sh)
end


local function registerGmScene(scene)
    if type(scene) ~= "table" then
        return
    end
    local battle = raw(scene,"Battle")
    if type(battle) == "table" then
        S.GmScenes[scene] = true
    end
end

local function getGmSceneClass()
    if not GmScene or type(GmScene.NewScene) ~= "function" then
        return nil
    end
    local ups = getUpvalues(GmScene.NewScene)
    if type(ups) ~= "table" then
        return nil
    end
    for _,v in pairs(ups) do
        if type(v) == "table" and raw(v,"__index") == v and type(raw(v,"Create")) == "function" and type(raw(v,"HitboxOf")) == "function" then
            return v
        end
    end
end

local function hookGmScenes()
    if S.SceneHooked or not GmScene then
        return S.SceneHooked
    end
    local newScene = raw(GmScene,"NewScene")
    if type(newScene) == "function" then
        local wrapper = function(self,...)
            local scene = newScene(self,...)
            registerGmScene(scene)
            return scene
        end
        local ok = pcall(function() rawset(GmScene,"NewScene",wrapper) end)
        if ok and raw(GmScene,"NewScene") == wrapper then
            S.SceneHooked = true
        end
    end
    return S.SceneHooked
end

local function scanGmScenesOnce(battle)
    if type(getgc) ~= "function" then
        return
    end
    local ok,list = pcall(getgc,true)
    if not ok or type(list) ~= "table" then
        ok,list = pcall(getgc)
    end
    if not ok or type(list) ~= "table" then
        return
    end
    for i = 1,#list do
        local v = list[i]
        if type(v) == "table" and raw(v,"Battle") == battle and type(raw(v,"Instances")) == "table" then
            S.GmScenes[v] = true
        end
    end
end

local function sceneHitbox(scene,obj)
    local fn = getMethod(scene,"HitboxOf")
    if type(fn) ~= "function" then
        return nil
    end
    local ok,hb = pcall(fn,scene,obj)
    if not ok or type(hb) ~= "table" then
        return nil
    end
    local x,y,w,h = raw(hb,"X"),raw(hb,"Y"),raw(hb,"Width"),raw(hb,"Height")
    if not finite(x) or not finite(y) or not finite(w) or not finite(h) then
        x,y,w,h = hb[2],hb[3],hb[4],hb[5]
    end
    if not finite(x) or not finite(y) or not finite(w) or not finite(h) then
        return nil
    end
    return "Rect",x,y,math.abs(w),math.abs(h),0
end

local function gatherGmSceneThreats(battle,soul,horizon)
    if type(battle) ~= "table" then
        return
    end
    local sx,sy = num(raw(soul,"X"),0),num(raw(soul,"Y"),0)
    local frame = num(raw(battle,"Frame"),0)
    local added = 0
    for scene in pairs(S.GmScenes) do
        if type(scene) == "table" and raw(scene,"Battle") == battle then
            local instances = raw(scene,"Instances")
            if type(instances) == "table" then
                local limit = math.min(#instances,260)
                for i = 1,limit do
                    local o = instances[i]
                    local oldTrack = type(o)=="table" and S.SceneTracks[o] or nil
                    local objX,objY = raw(o,"X"),raw(o,"Y")
                    local rvx = num(raw(o,"VX"),oldTrack and oldTrack.vx or 0)
                    local rvy = num(raw(o,"VY"),oldTrack and oldTrack.vy or 0)
                    local estimateSpeed = math.sqrt(rvx*rvx+rvy*rvy)
                    local quickRange = OUTSIDE_RANGE + estimateSpeed*horizon + 180
                    if type(o) == "table" and raw(o,"Alive") ~= false and raw(o,"Bullet") == true and raw(o,"Active") == 1 and num(raw(o,"Damage"),0) > 0 and finite(objX) and finite(objY) and (dist2(objX,objY,sx,sy)<=quickRange*quickRange or estimateSpeed>2 or (oldTrack and oldTrack.preAim)) then
                        local shape,x,y,w,h,a = sceneHitbox(scene,o)
                        if shape then
                            local tr = S.SceneTracks[o]
                            if not tr then
                                tr = {x=x,y=y,vx=0,vy=0,ax=0,ay=0,turn=0,frame=-1,seen=0,px={},py={},pa={},pw={},ph={},preAim=false,preAimSpeed=90}
                                S.SceneTracks[o] = tr
                            end
                            if tr.frame >= 0 then
                                local df = frame - tr.frame
                                if df < 1 then df = 1 end
                                if df > 5 then df = 5 end
                                local vx,vy = (x-tr.x)/df,(y-tr.y)/df
                                tr.ax = clamp((vx-tr.vx)/df,-80,80)
                                tr.ay = clamp((vy-tr.vy)/df,-80,80)
                                local os = math.sqrt(tr.vx*tr.vx+tr.vy*tr.vy)
                                local ns = math.sqrt(vx*vx+vy*vy)
                                if os > 0.5 and ns > 0.5 then
                                    local turn = angleWrap(math.atan2(vy,vx)-math.atan2(tr.vy,tr.vx))/df
                                    tr.turn = clamp(tr.turn*0.35+turn*0.65,-1.2,1.2)
                                end
                                tr.vx,tr.vy = vx,vy
                            else
                                tr.vx = num(raw(o,"VX"),0)
                                tr.vy = num(raw(o,"VY"),0)
                            end
                            tr.x,tr.y,tr.frame,tr.seen = x,y,frame,tr.seen+1
                            tr.w,tr.h,tr.a = w,h,a
                            tr.preAim = false
                            local box = S.BoxData
                            if not S.BoxFree and box.valid and tr.seen >= 1 and math.abs(tr.vx)+math.abs(tr.vy) < 0.5 then
                                local l,b,r,t = boxAt(box,0)
                                if l and (x < l-20 or x > r+20 or y < b-20 or y > t+20) then
                                    tr.preAim = true
                                end
                            end
                            local baseX,baseY = x,y
                            local px,py = baseX,baseY
                            local pvx,pvy = tr.vx,tr.vy
                            local pa = a
                            for f=0,horizon do
                                if f>0 then
                                    if tr.preAim then
                                        local dx,dy = sx-px,sy-py
                                        local dl = math.sqrt(dx*dx+dy*dy)
                                        if dl>0 then
                                            local sp = math.min(STATIONARY_AIM_MAX_SPEED,math.max(86,math.sqrt(pvx*pvx+pvy*pvy)))
                                            pvx,pvy = dx/dl*sp,dy/dl*sp
                                        end
                                    else
                                        pvx = pvx + clamp(tr.ax or 0,-80,80)
                                        pvy = pvy + clamp(tr.ay or 0,-80,80)
                                        local turn = clamp(tr.turn or 0,-1.2,1.2)
                                        if turn ~= 0 then
                                            local c,ss=math.cos(turn),math.sin(turn)
                                            pvx,pvy=pvx*c-pvy*ss,pvx*ss+pvy*c
                                        end
                                    end
                                    px,py=px+pvx,py+pvy
                                    pa = a + (tr.av or 0)*f
                                end
                                tr.px[f+1],tr.py[f+1]=px,py
                                tr.pa[f+1],tr.pw[f+1],tr.ph[f+1]=pa,w,h
                            end
                            local speed2 = tr.vx*tr.vx + tr.vy*tr.vy
                            local closeEnough = dist2(baseX,baseY,sx,sy) <= (OUTSIDE_RANGE + math.sqrt(w*w+h*h)*0.5 + 120)^2
                            if (closeEnough or speed2 > 4 or tr.preAim) and added < 32 and S.SpecialCount + added < MAX_SPECIAL then
                                added += 1
                                local e=S.SpecialThreats[S.SpecialCount+added]
                                e.x,e.y,e.w,e.h,e.a,e.shape,e.tr,e.obj=baseX,baseY,w,h,a,shape,tr,o
                            end
                        end
                    end
                end
            end
        end
    end
    if added > 0 then
        S.SpecialCount = math.min(MAX_SPECIAL,S.SpecialCount+added)
    end
end

local function scanDirectSpecials(battle)
    if type(getgc) ~= "function" or type(battle) ~= "table" then
        return
    end

    local tnow = os.clock()
    if type(S.GcScanList) ~= "table" then
        if tnow - S.LastGcSpecialScan < 3.5 then
            return
        end
        S.LastGcSpecialScan = tnow
        local ok,list = pcall(getgc,true)
        if not ok or type(list) ~= "table" then
            ok,list = pcall(getgc)
        end
        if not ok or type(list) ~= "table" then
            return
        end
        S.GcScanList = list
        S.GcScanIndex = 1
        S.GcScanFound = {}
        S.GcScanSeen = setmetatable({}, {__mode = "k"})
    end

    local list = S.GcScanList
    if type(list) ~= "table" then
        S.GcScanList = nil
        return
    end

    local first = math.max(1, S.GcScanIndex)
    local last = math.min(#list, first + 119)
    local soul = S.Soul
    local sx,sy = num(raw(soul,"X"),0),num(raw(soul,"Y"),0)

    for i = first,last do
        local v = list[i]
        if type(v) == "table" and not S.GcScanSeen[v] and raw(v,"Alive") ~= false and raw(v,"Dead") ~= true then
            local bx,by = raw(v,"X"),raw(v,"Y")
            if finite(bx) and finite(by) then
                local hb = raw(v,"Hitbox")
                local w,h = raw(v,"Width"),raw(v,"Height")
                local damage = num(raw(v,"Damage"),0)
                if damage <= 0 and type(hb) == "table" then
                    damage = num(raw(hb,"Damage"),0)
                end
                local len,direction = raw(v,"Len"),raw(v,"Direction")
                local scene = raw(v,"Scene")
                local owner = raw(v,"Battle") == battle or raw(v,"Soul") == soul or (type(scene) == "table" and raw(scene,"Battle") == battle)
                local spear = finite(len) and finite(direction) and (finite(raw(v,"FakeSpeed")) or raw(v,"BounceSpear") ~= nil or owner)
                local hasGeometry = (finite(w) and finite(h)) or type(hb) == "table" or type(getMethod(v,"GetHitbox")) == "function"
                local near = dist2(bx,by,sx,sy) <= (OUTSIDE_RANGE + 240)^2
                local eligible = (damage > 0 and hasGeometry and (near or owner)) or (spear and near and math.abs(len) <= 360)
                if eligible then
                    S.GcScanSeen[v] = true
                    S.GcScanFound[#S.GcScanFound + 1] = v
                    if #S.GcScanFound >= MAX_DIRECT_OBJECTS then
                        last = i
                        break
                    end
                end
            end
        end
    end

    S.GcScanIndex = last + 1
    if S.GcScanIndex > #list or #S.GcScanFound >= MAX_DIRECT_OBJECTS then
        if #S.GcScanFound > 0 then
            S.DirectObjects = S.GcScanFound
        end
        S.GcScanList = nil
        S.GcScanIndex = 1
        S.GcScanFound = {}
        S.GcScanSeen = setmetatable({}, {__mode = "k"})
        S.LastGcSpecialScan = os.clock()
    end
end

local function gatherThreats(battle,soul,horizon)
    S.ThreatCount = 0
    local bullets = raw(battle,"Bullets")
    if type(bullets) ~= "table" then return end
    local sx,sy = num(raw(soul,"X"),0),num(raw(soul,"Y"),0)
    local frame = num(raw(battle,"Frame"),0)
    local limit = math.min(#bullets,MAX_BULLETS)
    for i = 1,limit do
        local b = bullets[i]
        if type(b) == "table" and raw(b,"Alive") ~= false and raw(b,"Harmful") ~= false then
            local bx,by = num(raw(b,"X"),sx),num(raw(b,"Y"),sy)
            local rvx,rvy = num(raw(b,"VX"),0),num(raw(b,"VY"),0)
            local rs = math.sqrt(rvx * rvx + rvy * rvy)
            local rough = OUTSIDE_RANGE + rs * horizon + 80
            if dist2(bx,by,sx,sy) <= rough * rough then
                local t = getTrack(b)
                local hfn = getHitboxFn(t,b)
                if type(hfn) == "function" then
                    local shape,x,y,w,h,a = parseHitbox(b,hfn)
                    if shape then
                        local r = shape == "Circle" and w or math.sqrt(w * w + h * h) * 0.5
                        updateTrack(b,shape,x,y,w,h,a,r,frame)
                        local speed = math.sqrt(t.vx * t.vx + t.vy * t.vy)
                        local maxRange = OUTSIDE_RANGE + speed * horizon + r + 120
                        if t.preAim or dist2(x,y,sx,sy) <= maxRange * maxRange then
                            predictTrack(b,t,horizon)
                            local p = dist2(x,y,sx,sy) - (speed * horizon + r + S.SoulSizeR) ^ 2
                            local n = S.ThreatCount
                            if n < MAX_THREATS then
                                n += 1
                                S.Threats[n].obj = b
                                S.Threats[n].tr = t
                                S.Threats[n].p = p
                                S.ThreatCount = n
                            else
                                local worst,wp = 1,S.Threats[1].p
                                for j = 2,n do if S.Threats[j].p > wp then wp,worst = S.Threats[j].p,j end end
                                if p < wp then
                                    S.Threats[worst].obj = b
                                    S.Threats[worst].tr = t
                                    S.Threats[worst].p = p
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

local function specialHitbox(o)
    local fn = getMethod(o,"GetHitbox")
    if type(fn) == "function" then
        local ok,hb = pcall(fn,o)
        if ok and type(hb) == "table" then
            local shape,x,y,w,h,a = parseHitbox(o,function() return hb end)
            if shape then return shape,x,y,w,h,a end
        end
    end
    local x,y = num(raw(o,"X"),0),num(raw(o,"Y"),0)
    local hb = raw(o,"Hitbox")
    local timer = raw(o,"Timer")
    local direction = raw(o,"Direction")
    local widthGoal = raw(o,"WidthGoal")
    local hbObject = raw(o,"Hitbox")

    if type(hb) == "table" and finite(raw(hb,"Width")) and finite(raw(hb,"Height")) then
        if raw(hb,"Alive") == false then return nil end
        x = finite(raw(hb,"X")) and raw(hb,"X") or x
        y = finite(raw(hb,"Y")) and raw(hb,"Y") or y

        if type(timer) == "number" and finite(direction) and finite(widthGoal) then
            local lineW = num(raw(o,"LineLength"),640)
            local lineH = math.max(6,math.abs(num(widthGoal,8)),math.abs(num(raw(hb,"Height"),8)))
            return "OrientedRect",x,y,lineW,lineH,-math.rad(direction)
        end

        return "OrientedRect",x,y,math.abs(num(raw(hb,"Width"),8)),math.abs(num(raw(hb,"Height"),8)),num(raw(hb,"Angle"),0)
    end

    local w,h,a = raw(o,"Width"),raw(o,"Height"),raw(o,"Angle")
    if not finite(a) and finite(direction) then
        a = -math.rad(num(direction,0))
    end
    if not finite(w) then
        w = widthGoal
    end
    if not finite(h) then
        h = raw(o,"HeightGoal")
    end
    if finite(a) and finite(w) and finite(h) then
        return "OrientedRect",x,y,math.abs(w),math.abs(h),a
    end

    if type(timer) == "number" and finite(direction) and type(hbObject) == "table" then
        local lineW = num(raw(o,"LineLength"),640)
        local lineH = math.max(6,math.abs(num(widthGoal,8)))
        return "OrientedRect",x,y,lineW,lineH,-math.rad(direction)
    end
end

local function gatherDirectSpecialThreats(battle,soul,horizon)
    local frame = num(raw(battle,"Frame"),0)
    local sx,sy = num(raw(soul,"X"),0),num(raw(soul,"Y"),0)
    for i = #S.DirectObjects,1,-1 do
        local o = S.DirectObjects[i]
        if type(o) ~= "table" or raw(o,"Alive") == false or raw(o,"Dead") == true then
            table.remove(S.DirectObjects,i)
        else
            local bx,by = raw(o,"X"),raw(o,"Y")
            if finite(bx) and finite(by) then
                local shape,x,y,w,h,a = specialHitbox(o)
                local len,direction = raw(o,"Len"),raw(o,"Direction")
                local isSpear = finite(len) and finite(direction) and (finite(raw(o,"FakeSpeed")) or raw(o,"BounceSpear") ~= nil or raw(o,"Battle") == battle or raw(o,"Soul") == soul)
                if isSpear and (not shape or num(raw(o,"Damage"),0) <= 0) then
                    local sw = clamp(math.abs(len),18,300)
                    a = math.rad(num(direction,0))
                    x = bx + math.cos(a) * sw * 0.5
                    y = by + math.sin(a) * sw * 0.5
                    w,h,shape = sw,14,"OrientedRect"
                end
                if shape and finite(x) and finite(y) and finite(w) and finite(h) then
                    local already = false
                    for j=1,S.SpecialCount do
                        if S.SpecialThreats[j].obj == o then
                            already = true
                            break
                        end
                    end
                    if not already and S.SpecialCount < MAX_SPECIAL then
                        local tr = S.SpecialTracks[o]
                        if not tr then
                            tr = {x=x,y=y,vx=0,vy=0,ax=0,ay=0,a=a,av=0,turn=0,frame=-1,seen=0,px={},py={},pa={},pw={},ph={},preAim=false}
                            S.SpecialTracks[o] = tr
                        end
                        local oldX,oldY = tr.x,tr.y
                        local oldVx,oldVy = tr.vx,tr.vy
                        if tr.frame >= 0 then
                            local df = clamp(frame-tr.frame,1,6)
                            local mvx,mvy = (x-oldX)/df,(y-oldY)/df
                            if math.abs(mvx)+math.abs(mvy)>700 then
                                mvx,mvy = num(raw(o,"VX"),0),num(raw(o,"VY"),0)
                            end
                            local rvx,rvy = raw(o,"VX"),raw(o,"VY")
                            if finite(rvx) then mvx = mvx*0.62 + rvx*0.38 end
                            if finite(rvy) then mvy = mvy*0.62 + rvy*0.38 end
                            tr.ax = clamp((mvx-oldVx)/df,-80,80)
                            tr.ay = clamp((mvy-oldVy)/df,-80,80)
                            local os = math.sqrt(oldVx*oldVx+oldVy*oldVy)
                            local ns = math.sqrt(mvx*mvx+mvy*mvy)
                            if os>0.5 and ns>0.5 then
                                local turn = angleWrap(math.atan2(mvy,mvx)-math.atan2(oldVy,oldVx))/df
                                tr.turn = clamp(tr.turn*0.38+turn*0.62,-CURVE_TURN_LIMIT,CURVE_TURN_LIMIT)
                            else
                                tr.turn = tr.turn*0.5
                            end
                            tr.vx,tr.vy = mvx,mvy
                            local daa = angleWrap(a-(tr.a or a))/df
                            if math.abs(daa)<2 then tr.av = (tr.av or 0)*0.45 + daa*0.55 end
                        else
                            tr.vx,tr.vy = num(raw(o,"VX"),0),num(raw(o,"VY"),0)
                            tr.ax,tr.ay,tr.turn,tr.av = 0,0,0,0
                        end
                        tr.x,tr.y,tr.a,tr.w,tr.h,tr.frame = x,y,a,w,h,frame
                        tr.seen = tr.seen + 1
                        tr.preAim = false
                        local box = S.BoxData
                        if not S.BoxFree and box.valid and math.abs(tr.vx)+math.abs(tr.vy)<0.45 then
                            local l,b,r,t = boxAt(box,0)
                            if l and (x<l-20 or x>r+20 or y<b-20 or y>t+20) and dist2(x,y,sx,sy)<OUTSIDE_RANGE^2 then
                                tr.preAim = true
                            end
                        end
                        local px,py = x,y
                        local vx,vy = tr.vx,tr.vy
                        for f=0,horizon do
                            if f>0 then
                                if tr.preAim then
                                    local dx,dy = sx-px,sy-py
                                    local dl = math.sqrt(dx*dx+dy*dy)
                                    if dl>0 then
                                        local sp = math.min(STATIONARY_AIM_MAX_SPEED,math.max(STATIONARY_AIM_SPEED,math.sqrt(vx*vx+vy*vy)))
                                        vx,vy = dx/dl*sp,dy/dl*sp
                                    end
                                else
                                    vx = vx + tr.ax
                                    vy = vy + tr.ay
                                    local turn = clamp(tr.turn,-CURVE_TURN_LIMIT,CURVE_TURN_LIMIT)
                                    if turn ~= 0 then
                                        local c,ss = math.cos(turn),math.sin(turn)
                                        vx,vy = vx*c-vy*ss,vx*ss+vy*c
                                    end
                                end
                                px,py = px+vx,py+vy
                            end
                            tr.px[f+1],tr.py[f+1] = px,py
                            tr.pa[f+1] = a + (tr.av or 0)*f
                            tr.pw[f+1],tr.ph[f+1] = w,h
                        end
                        local r = math.sqrt(w*w+h*h)*0.5
                        if dist2(x,y,sx,sy) <= (OUTSIDE_RANGE+r+120)^2 or math.abs(tr.vx)+math.abs(tr.vy)>2 or tr.preAim then
                            S.SpecialCount += 1
                            local e = S.SpecialThreats[S.SpecialCount]
                            e.x,e.y,e.w,e.h,e.a,e.shape,e.tr,e.obj = x,y,w,h,a,shape,tr,o
                        end
                    end
                end
            end
        end
    end
end

local function gatherSpecialThreats(horizon)
    S.SpecialCount = 0
    local sx,sy = num(raw(S.Soul,"X"),0),num(raw(S.Soul,"Y"),0)
    for i = #S.SpecialObjects,1,-1 do
        local o = S.SpecialObjects[i]
        if type(o) ~= "table" or raw(o,"Alive") == false or raw(o,"Dead") == true then table.remove(S.SpecialObjects,i) end
    end
    for i = 1,#S.SpecialObjects do
        local o = S.SpecialObjects[i]
        if type(o) == "table" and o ~= S.Soul and raw(o,"Alive") ~= false and raw(o,"Dead") ~= true then
            local shape,x,y,w,h,a = specialHitbox(o)
            if shape then
                local t = S.SpecialTracks[o]
                if not t then t = {x=x,y=y,vx=0,vy=0,a=a,av=0,turn=0,seen=0,frame=-1,px={},py={},pa={},pw={},ph={}}; S.SpecialTracks[o] = t end
                local cf = S.Battle and num(raw(S.Battle,"Frame"),0) or 0
                if t.frame >= 0 then
                    local df = cf - t.frame; if df < 1 then df = 1 end; if df > 6 then df = 6 end
                    local vx,vy = (x - t.x) / df,(y - t.y) / df
                    local oldSpeed = math.sqrt(t.vx * t.vx + t.vy * t.vy)
                    local newSpeed = math.sqrt(vx * vx + vy * vy)
                    if oldSpeed > 0.5 and newSpeed > 0.5 then
                        local turn = angleWrap(math.atan2(vy,vx) - math.atan2(t.vy,t.vx)) / df
                        t.turn = clamp(t.turn * 0.45 + turn * 0.55,-CURVE_TURN_LIMIT,CURVE_TURN_LIMIT)
                    end
                    t.vx = vx * 0.72 + t.vx * 0.28
                    t.vy = vy * 0.72 + t.vy * 0.28
                    local daa = angleWrap(a - t.a) / df
                    if math.abs(daa) < 2 then t.av = t.av * 0.4 + daa * 0.6 end
                end
                t.x,t.y,t.a,t.frame = x,y,a,cf
                t.seen += 1

                local svx,svy = t.vx,t.vy
                local sangle = a
                for f = 0,horizon do
                    if f > 0 then
                        local turn = clamp(t.turn or 0,-CURVE_TURN_LIMIT,CURVE_TURN_LIMIT)
                        if turn ~= 0 then
                            local c,ss = math.cos(turn),math.sin(turn)
                            svx,svy = svx * c - svy * ss,svx * ss + svy * c
                        end
                    end
                    local px = x + svx * f
                    local py = y + svy * f
                    local pa = sangle + (t.av or 0) * f
                    t.px[f + 1] = px
                    t.py[f + 1] = py
                    t.pa[f + 1] = pa
                    t.pw[f + 1] = w
                    t.ph[f + 1] = h
                end

                local r = math.sqrt(w * w + h * h) * 0.5
                if dist2(x,y,sx,sy) <= (OUTSIDE_RANGE + r + 120) ^ 2 or math.abs(t.vx) + math.abs(t.vy) > 2 then
                    if S.SpecialCount < 18 then
                        S.SpecialCount += 1
                        local e = S.SpecialThreats[S.SpecialCount]
                        e.x,e.y,e.w,e.h,e.a,e.shape,e.tr,e.obj = x,y,w,h,a,shape,t,o
                    end
                end
            end
        end
    end
end

local function specialRisk(e,x,y,sw,sh,f)
    local px,py,pa,pw,ph = e.x,e.y,e.a,e.w,e.h
    local t = e.tr

    if t then
        px = t.px[f + 1] or px
        py = t.py[f + 1] or py
        pa = t.pa[f + 1] or pa
        pw = t.pw[f + 1] or pw
        ph = t.ph[f + 1] or ph
    end

    local r = math.sqrt(pw * pw + ph * ph) * 0.5
    local dx,dy = px - x,py - y
    local broad = r + S.SoulSizeR + OUTSIDE_RANGE

    if dx * dx + dy * dy > broad * broad then
        return 0,false
    end

    if hazardHit(e.shape,px,py,pw,ph,pa,r,x,y,sw,sh) then
        return HARD + (FAST_HORIZON - math.min(f,FAST_HORIZON)) * 22000,true
    end

    local d = math.sqrt(dx * dx + dy * dy) - r - S.SoulSizeR
    if d < 150 then
        return NEAR * 1.2 / math.max(1,d + 1) * (1 + (FAST_HORIZON - math.min(f,FAST_HORIZON)) * 0.05),false
    end

    return 0,false
end

local function shieldDirection()
    local bx,by = 0,0
    local urgency = -math.huge
    for li = 1,#S.SpecialLists do
        local list = S.SpecialLists[li]
        if type(list) == "table" then
            local n = math.min(#list,40)
            for i = 1,n do
                local spear = list[i]
                if type(spear) == "table" and raw(spear,"Alive") ~= false then
                    local len = num(raw(spear,"Len"),math.huge)
                    local bounce = num(raw(spear,"BounceSpear"),0)
                    if len < 140 then
                        local u = 140 - len
                        if len < 80 then u += 260 end
                        if bounce > 0 then u += 40 end
                        if u > urgency then
                            urgency = u
                            local d = num(raw(spear,"Direction"),num(raw(spear,"Angle"),0))
                            local a = math.rad((d + 180) % 360)
                            local vx = math.cos(a)
                            local vy = math.sin(a)
                            if math.abs(vx) > 0.65 and math.abs(vy) > 0.35 then
                                bx = sign(vx)
                                by = sign(vy)
                            elseif math.abs(vx) >= math.abs(vy) then
                                bx = sign(vx)
                                by = 0
                            else
                                bx = 0
                                by = sign(vy)
                            end
                        end
                    end
                end
            end
        end
    end
    if urgency > -math.huge then
        return bx,by,urgency
    end
    return 0,0,nil
end

local PLAN_DIRS = {
    {0,0},
    {1,0},{1,1},{0,1},{-1,1},{-1,0},{-1,-1},{0,-1},{1,-1}
}
local PLAN_OPTIONS = {
    [1] = {1,2,3,4,5,6,7,8,9},
    [2] = {2,9,3,8,4,6,1},
    [3] = {3,2,4,9,5,7,1},
    [4] = {4,3,5,2,6,8,1},
    [5] = {5,4,6,3,7,9,1},
    [6] = {6,5,7,4,8,2,1},
    [7] = {7,6,8,5,9,3,1},
    [8] = {8,7,9,6,2,4,1},
    [9] = {9,8,2,7,3,5,1}
}
local PLAN_ROOT = {}
local PLAN_BEAM_A,PLAN_BEAM_B,PLAN_CHILD_REFS = {},{},{}
local PLAN_POOL_A,PLAN_POOL_B = {},{}
for i=1,45 do
    PLAN_POOL_A[i]={}
    PLAN_POOL_B[i]={}
end

local function planPosition(x,y,dx,dy,frame,speed)
    local mx,my = dx,dy
    local normalize = true
    if type(Config)=="table" and type(Config.Soul)=="table" and raw(Config.Soul,"NormalizeDiagonal")==false then
        normalize = false
    end
    if normalize and mx~=0 and my~=0 then
        mx,my = mx*DIAG,my*DIAG
    end
    x,y = x+mx*speed,y+my*speed
    if not S.BoxFree and S.BoxData.valid then
        local l,b,r,t = boxAt(S.BoxData,frame)
        if l then
            local px = S.SoulW*0.5+math.abs(S.SoulOX)+1
            local py = S.SoulH*0.5+math.abs(S.SoulOY)+1
            if r-l > px*2 then x=clamp(x,l+px,r-px) end
            if t-b > py*2 then y=clamp(y,b+py,t-py) end
        end
    end
    return x,y
end

local function sweptTrackRisk(track,shape,prevX,prevY,x,y,frame,curW,curH)
    if not track or frame<1 then return 0,false end
    local bx0,by0 = track.px[frame],track.py[frame]
    local bx1,by1 = track.px[frame+1],track.py[frame+1]
    if not finite(bx0) or not finite(by0) or not finite(bx1) or not finite(by1) then return 0,false end
    local w0,h0 = track.pw[frame] or curW,track.ph[frame] or curH
    local w1,h1 = track.pw[frame+1] or curW,track.ph[frame+1] or curH
    if math.max(w0,h0,w1,h1)>110 then return 0,false end
    local moveX,moveY = bx1-bx0,by1-by0
    if moveX*moveX+moveY*moveY < 36 then return 0,false end
    local rx0,ry0 = bx0-prevX,by0-prevY
    local rx1,ry1 = bx1-x,by1-y
    local dx,dy = rx1-rx0,ry1-ry0
    local dd = dx*dx+dy*dy
    local u = dd>EPS and clamp(-(rx0*dx+ry0*dy)/dd,0,1) or 0
    local qx,qy = rx0+dx*u,ry0+dy*u
    local rr
    if shape=="Circle" then
        rr = math.max(track.r or 0,(w0 or 0)*0.5,(w1 or 0)*0.5)
    else
        rr = math.max(math.sqrt(w0*w0+h0*h0)*0.5,math.sqrt(w1*w1+h1*h1)*0.5)
    end
    rr = rr + S.SoulSizeR + MARGIN
    if qx*qx+qy*qy < rr*rr then
        return HARD*1.18 + (ROUTE_DEPTH-math.min(frame,ROUTE_DEPTH))*15000,true
    end
    return 0,false
end

local function threatRisk(e,x,y,f,sw,sh)
    if type(e) ~= "table" or type(e.tr) ~= "table" then
        return 0,false
    end
    local t = e.tr

    if t.preAim and num(t.stationaryAge,0) >= 1 and f > 0 then
        local dx,dy = x - t.x,y - t.y
        local len = math.sqrt(dx * dx + dy * dy)

        if len > 0 then
            local nx,ny = dx / len,dy / len
            local r = t.shape == "Circle" and num(t.r,0) or math.sqrt(num(t.w,8) * num(t.w,8) + num(t.h,8) * num(t.h,8)) * 0.5
            local slowSpeed = num(t.preAimSpeed,STATIONARY_AIM_SPEED)
            local fastSpeed = math.min(STATIONARY_AIM_MAX_SPEED,slowSpeed * 1.65)

            local px = t.x + nx * slowSpeed * f
            local py = t.y + ny * slowSpeed * f
            if hazardHit(t.shape,px,py,num(t.w,8),num(t.h,8),num(t.angle,0),r,x,y,sw,sh) then
                return HARD * 1.8 + (FAST_HORIZON - math.min(f,FAST_HORIZON)) * 23000,true
            end

            px = t.x + nx * fastSpeed * f
            py = t.y + ny * fastSpeed * f
            if hazardHit(t.shape,px,py,num(t.w,8),num(t.h,8),num(t.angle,0),r,x,y,sw,sh) then
                return HARD * 1.55 + (FAST_HORIZON - math.min(f,FAST_HORIZON)) * 21000,true
            end

            local d1 = math.sqrt((px-x)^2 + (py-y)^2) - r - S.SoulSizeR
            if d1 < 170 then
                return NEAR * 1.7 / math.max(1,d1+1),false
            end
        end
    end

    local px = t.px[f + 1]
    local py = t.py[f + 1]
    local pa = t.pa[f + 1]
    local pw = t.pw[f + 1]
    local ph = t.ph[f + 1]

    if not finite(px) or not finite(py) then
        return 0,false
    end
    pw,ph = num(pw,num(t.w,8)),num(ph,num(t.h,8))
    pa = num(pa,num(t.angle,0))

    local r = t.shape == "Circle" and num(t.r,pw) or math.sqrt(pw * pw + ph * ph) * 0.5
    local dx,dy = px-x,py-y
    local broad = r + S.SoulSizeR + 140

    if dx * dx + dy * dy > broad * broad then
        return 0,false
    end

    if hazardHit(t.shape,px,py,pw,ph,pa,r,x,y,sw,sh) then
        return HARD + (FAST_HORIZON - math.min(f,FAST_HORIZON)) * 17000,true
    end

    local d = math.sqrt(dx * dx + dy * dy) - r - S.SoulSizeR
    if d < 125 then
        return NEAR / math.max(1,d + 1) * (1 + (FAST_HORIZON - math.min(f,FAST_HORIZON)) * 0.05),false
    end

    return 0,false
end

local function positionRisk(soul,x,y,prevX,prevY,frame,sw,sh)
    local total,hardCount = 0,0
    local urgency = 1 + (ROUTE_DEPTH-frame)*0.012
    local blocked = false
    if type(S.BlockFn)=="function" then
        local ok,value = pcall(S.BlockFn,soul,x,y)
        blocked = ok and value==true
    end
    if blocked then
        total = total + HARD*1.2
        hardCount = hardCount + 1
    end
    for j=1,S.RouteThreatCount do
        local e = S.RouteThreats[j]
        local r,h = threatRisk(e,x,y,frame,sw,sh)
        local t = e.tr
        if not h and t and frame>0 then
            local sr,shard = sweptTrackRisk(t,t.shape,prevX,prevY,x,y,frame,t.w or 8,t.h or 8)
            if sr>r then r,h=sr,shard end
        end
        if r>0 then total=total+math.min(r,HARD*2)*urgency end
        if h then hardCount=hardCount+1 end
    end
    for j=1,S.RouteSpecialCount do
        local e = S.RouteSpecials[j]
        local r,h = specialRisk(e,x,y,sw,sh,frame)
        local t = e.tr
        if not h and t and frame>0 then
            local sr,shard = sweptTrackRisk(t,e.shape,prevX,prevY,x,y,frame,e.w,e.h)
            if sr>r then r,h=sr,shard end
        end
        if r>0 then total=total+math.min(r,HARD*2)*urgency end
        if h then hardCount=hardCount+1 end
    end
    if not S.BoxFree and S.BoxData.valid then
        local l,b,r,t = boxAt(S.BoxData,frame)
        if l then
            local edge = math.min(x-l,r-x,y-b,t-y)
            if edge<28 then total=total+(28-math.max(0,edge))*9 end
        end
    end
    return total,hardCount
end

local function buildRouteThreats(soul,depth,speed)
    local rt,rs = S.RouteThreats,S.RouteSpecials
    table.clear(rt)
    table.clear(rs)
    local sx,sy = num(raw(soul,"X"),0),num(raw(soul,"Y"),0)
    local reach = speed*depth + math.max(S.SoulW,S.SoulH)*0.5 + 38
    local reachAim = reach + STATIONARY_AIM_MAX_SPEED*depth
    for i=1,S.ThreatCount do
        local e = S.Threats[i]
        local t = e.tr
        local relevant = t and t.preAim or false
        if not relevant and t then
            for f=1,depth+1 do
                local x,y=t.px[f],t.py[f]
                if finite(x) and finite(y) then
                    local w,h=t.pw[f] or t.w or 8,t.ph[f] or t.h or 8
                    local r=t.shape=="Circle" and (t.r or w) or math.sqrt(w*w+h*h)*0.5
                    local limit=reach+r+S.SoulSizeR+24
                    if dist2(x,y,sx,sy)<=limit*limit then
                        relevant=true
                        break
                    end
                end
            end
        end
        if relevant then
            rt[#rt+1]=e
        elseif t and (t.preAim or dist2(t.x,t.y,sx,sy)<=reachAim*reachAim and math.abs(t.vx or 0)+math.abs(t.vy or 0)<0.5) then
            rt[#rt+1]=e
        end
    end
    for i=1,S.SpecialCount do
        local e = S.SpecialThreats[i]
        local t = e.tr
        local relevant = t and t.preAim or false
        if not relevant and t then
            for f=1,depth+1 do
                local x,y=t.px[f],t.py[f]
                if finite(x) and finite(y) then
                    local w,h=t.pw[f] or e.w or 8,t.ph[f] or e.h or 8
                    local r=e.shape=="Circle" and math.max(t.r or 0,w*0.5) or math.sqrt(w*w+h*h)*0.5
                    local limit=reach+r+S.SoulSizeR+24
                    if dist2(x,y,sx,sy)<=limit*limit then
                        relevant=true
                        break
                    end
                end
            end
        elseif not t then
            local r=math.sqrt((e.w or 8)^2+(e.h or 8)^2)*0.5
            local limit=reach+r+S.SoulSizeR+24
            relevant=dist2(e.x,e.y,sx,sy)<=limit*limit
        end
        if relevant then
            rs[#rs+1]=e
        end
    end
    S.RouteThreatCount=#rt
    S.RouteSpecialCount=#rs
end

local function nodeLess(a,b)
    if a.score==b.score then
        if a.hits==b.hits then return a.depth>b.depth end
        return a.hits<b.hits
    end
    return a.score<b.score
end

local function routeOptions(dir)
    return PLAN_OPTIONS[dir<=1 and 1 or dir]
end

local function decide(battle,soul)
    readSoulGeometry(soul)
    local sxNow,syNow = num(raw(soul,"X"),0),num(raw(soul,"Y"),0)
    local previousDirX,previousDirY = S.DirX,S.DirY
    if finite(S.LastSoulX) and finite(S.LastSoulY) then
        local moved2 = dist2(sxNow,syNow,S.LastSoulX,S.LastSoulY)
        if (previousDirX ~= 0 or previousDirY ~= 0) and moved2 < 1.0 then
            S.StuckCount = math.min(S.StuckCount + 1,4)
            S.StuckDirX,S.StuckDirY = previousDirX,previousDirY
        elseif moved2 > 2.25 or (previousDirX == 0 and previousDirY == 0) then
            S.StuckCount = 0
        end
    end
    S.LastSoulX,S.LastSoulY = sxNow,syNow
    local horizon = math.min(S.Fast and FAST_HORIZON or NORMAL_HORIZON,ROUTE_DEPTH+(S.Fast and 2 or 0))
    prepareBox(battle,horizon)
    gatherThreats(battle,soul,horizon)
    gatherSpecialThreats(horizon)
    gatherGmSceneThreats(battle,soul,horizon)
    scanDirectSpecials(battle)
    gatherDirectSpecialThreats(battle,soul,horizon)

    local speed = num(raw(soul,"SpeedOverride"),0)
    if speed<=0 and type(Config)=="table" and type(Config.Soul)=="table" then
        speed=num(raw(Config.Soul,"Speed"),4)
    end
    if speed<=0 then speed=4 end

    local depthLimit = math.min(ROUTE_DEPTH,horizon)
    buildRouteThreats(soul,depthLimit,speed)
    if S.RouteThreatCount==0 and S.RouteSpecialCount==0 then
        local shieldX,shieldY,shieldUrgency=shieldDirection()
        S.DirX,S.DirY=0,0
        S.ShieldX,S.ShieldY=shieldX,shieldY
        S.Fast=shieldUrgency and shieldUrgency>220 or false
        return
    end
    local startX,startY = num(raw(soul,"X"),0),num(raw(soul,"Y"),0)
    local root = PLAN_ROOT
    root.x,root.y,root.score=startX,startY,0
    root.dir,root.firstX,root.firstY,root.hits,root.depth=0,0,0,0,0
    local beamA,beamB,childRefs = PLAN_BEAM_A,PLAN_BEAM_B,PLAN_CHILD_REFS
    table.clear(beamA)
    table.clear(beamB)
    table.clear(childRefs)
    beamA[1]=root
    local poolA,poolB = PLAN_POOL_A,PLAN_POOL_B
    local currentBeam,nextBeam = beamA,beamB

    for depth=1,depthLimit do
        table.clear(childRefs)
        local pool = depth%2==1 and poolA or poolB
        local childIndex = 0
        for bi=1,#currentBeam do
            local parent = currentBeam[bi]
            local options = routeOptions(parent.dir)
            for oi=1,#options do
                local direction = options[oi]
                local d = PLAN_DIRS[direction]
                local nx,ny = planPosition(parent.x,parent.y,d[1],d[2],depth,speed)
                local risk,hitsHere = positionRisk(soul,nx,ny,parent.x,parent.y,depth,S.SoulW,S.SoulH)
                local score = parent.score + risk
                local moveCost = (d[1]~=0 or d[2]~=0) and 0 or 0.55
                score = score + moveCost
                local turnCost = 0
                if parent.dir>=2 and direction>=2 then
                    local oldAngle,newAngle = parent.dir-2,direction-2
                    local diff = math.abs(oldAngle-newAngle)
                    diff = math.min(diff,8-diff)
                    turnCost = diff*0.26
                    if diff>=4 then turnCost=turnCost+0.85 end
                elseif parent.dir>=2 and direction==1 then
                    turnCost=0.22
                end
                score = score + turnCost
                local firstX,firstY = parent.firstX,parent.firstY
                if depth==1 then firstX,firstY=d[1],d[2] end
                if depth==1 and S.StuckCount>0 and firstX==S.StuckDirX and firstY==S.StuckDirY then
                    score = score + math.min(S.StuckCount,3)*65000
                end
                if depth==1 and (firstX~=S.DirX or firstY~=S.DirY) then
                    local reverse = firstX==-S.DirX and firstY==-S.DirY and (firstX~=0 or firstY~=0)
                    score = score + (reverse and 0.65 or 0.24)
                end
                if hitsHere>0 then
                    score = score + hitsHere*220000
                end
                childIndex=childIndex+1
                local n=pool[childIndex]
                n.x,n.y,n.score,n.dir=nx,ny,score,direction
                n.firstX,n.firstY=firstX,firstY
                n.hits=parent.hits+hitsHere
                n.depth=depth
                childRefs[#childRefs+1]=n
            end
        end
        if #childRefs==0 then break end
        table.sort(childRefs,nodeLess)
        table.clear(nextBeam)
        for i=1,#childRefs do
            local candidateNode=childRefs[i]
            local duplicate=false
            for j=1,#nextBeam do
                local kept=nextBeam[j]
                if kept.dir==candidateNode.dir and math.abs(kept.x-candidateNode.x)<6 and math.abs(kept.y-candidateNode.y)<6 then
                    duplicate=true
                    break
                end
            end
            if not duplicate then
                nextBeam[#nextBeam+1]=candidateNode
                if #nextBeam>=ROUTE_BEAM then break end
            end
        end
        if #nextBeam==0 then break end
        currentBeam,nextBeam=nextBeam,currentBeam
    end

    local best=currentBeam[1]
    if best then
        S.DirX=clamp(num(best.firstX,0),-1,1)
        S.DirY=clamp(num(best.firstY,0),-1,1)
    else
        S.DirX,S.DirY=0,0
    end
    local shieldX,shieldY,shieldUrgency=shieldDirection()
    S.ShieldX,S.ShieldY=shieldX,shieldY
    S.Fast=(best and best.hits>0 or false) or (shieldUrgency and shieldUrgency>220 or false)
end

local function chooseImmediateFallback(soul)
    if S.DirX ~= 0 or S.DirY ~= 0 then return false end
    if S.RouteThreatCount == 0 and S.RouteSpecialCount == 0 then return false end
    local sx,sy=num(raw(soul,"X"),0),num(raw(soul,"Y"),0)
    local speed=num(raw(soul,"SpeedOverride"),0)
    if speed<=0 and type(Config)=="table" and type(Config.Soul)=="table" then
        speed=num(raw(Config.Soul,"Speed"),4)
    end
    if speed<=0 then speed=4 end
    local baseRisk,baseHits=positionRisk(soul,sx,sy,sx,sy,1,S.SoulW,S.SoulH)
    local baseScore=baseRisk+baseHits*HARD*2
    local bestScore=baseScore
    local bestX,bestY=0,0
    for i=2,9 do
        local d=PLAN_DIRS[i]
        local nx,ny=planPosition(sx,sy,d[1],d[2],1,speed)
        local risk,hits=positionRisk(soul,nx,ny,sx,sy,1,S.SoulW,S.SoulH)
        local score=risk+hits*HARD*2+0.12
        if score < bestScore then
            bestScore=score
            bestX,bestY=d[1],d[2]
        end
    end
    if bestX~=0 or bestY~=0 then
        S.DirX,S.DirY=bestX,bestY
        S.FallbackUsed=true
        return true
    end
    return false
end

local function mutateInput(input)
    if type(input) ~= "table" then
        return input
    end

    local moveActive = S.DirX ~= 0 or S.DirY ~= 0
    local shieldActive = S.ShieldX ~= 0 or S.ShieldY ~= 0
    if not moveActive and not shieldActive then
        return input
    end

    local out = {}
    for k,v in pairs(input) do
        out[k] = v
    end

    if moveActive then
        out.Left = S.DirX < 0
        out.Right = S.DirX > 0
        out.Up = S.DirY < 0
        out.Down = S.DirY > 0
        out.StickX = S.DirX
        out.StickY = -S.DirY
        out.Slow = false
    end

    if shieldActive then
        local p = out.Pressed
        if type(p) ~= "table" then
            p = {}
        else
            local copy = {}
            for k,v in pairs(p) do
                copy[k] = v
            end
            p = copy
        end
        p.Left = S.ShieldX < 0
        p.Right = S.ShieldX > 0
        p.Up = S.ShieldY < 0
        p.Down = S.ShieldY > 0
        out.Pressed = p
    end

    return out
end

local BattleScanArmed = true
local SoulBattleCache = setmetatable({}, {__mode = "k"})
local SoulClassPatched = false
local SoulClass = nil
local OriginalSoulStep = nil
local SoulStepWrapper = nil
local LastDiagPrint = 0

local function emergencyDirection(soul)
    local box = raw(soul,"Box")
    local sx = num(raw(soul,"X"),0)
    local sy = num(raw(soul,"Y"),0)

    if type(box) == "table" then
        local cx = raw(box,"CenterX")
        local cy = raw(box,"CenterY")
        if finite(cx) and finite(cy) then
            local dx = cx - sx
            local dy = cy - sy
            if math.abs(dx) > 10 or math.abs(dy) > 10 then
                if math.abs(dx) >= math.abs(dy) then
                    return sign(dx),0
                end
                return 0,sign(dy)
            end
        end
    end

    local frame = 0
    local cachedBattle = SoulBattleCache[soul]
    if type(cachedBattle) == "table" then
        frame = num(raw(cachedBattle,"Frame"),0)
    end

    frame = frame % 32
    if frame < 8 then return 1,0 end
    if frame < 16 then return 0,1 end
    if frame < 24 then return -1,0 end
    return 0,-1
end

local function findBattleForSoul(soul)
    if type(soul) ~= "table" then
        return nil
    end

    if type(S.Battle) ~= "table" or raw(S.Battle,"Running") ~= true then
        BattleScanArmed = true
    end

    local cached = SoulBattleCache[soul]
    if type(cached) == "table" and raw(cached,"Running") == true then
        return cached
    end

    if type(cached) == "table" and raw(cached,"Running") ~= true then
        SoulBattleCache[soul] = nil
        BattleScanArmed = true
    end

    if S.Soul == soul and type(S.Battle) == "table" and raw(S.Battle,"Running") == true then
        SoulBattleCache[soul] = S.Battle
        return S.Battle
    end

    if not BattleScanArmed or type(getgc) ~= "function" then
        return nil
    end

    BattleScanArmed = false

    local ok,list = pcall(getgc,true)
    if not ok or type(list) ~= "table" then
        ok,list = pcall(getgc)
    end
    if not ok or type(list) ~= "table" then
        BattleScanArmed = true
        return nil
    end

    local box = raw(soul,"Box")

    for i = 1,#list do
        local v = list[i]
        if type(v) == "table" and raw(v,"Running") == true then
            if raw(v,"Soul") == soul then
                SoulBattleCache[soul] = v
                return v
            end

            local souls = raw(v,"Souls")
            if type(souls) == "table" then
                for j = 1,#souls do
                    if souls[j] == soul then
                        SoulBattleCache[soul] = v
                        return v
                    end
                end
            end

            if box ~= nil and raw(v,"Box") == box and type(raw(v,"Input")) == "table" then
                SoulBattleCache[soul] = v
                return v
            end
        end
    end

    BattleScanArmed = true
    return nil
end

local function resetBattleState(battle)
    if S.Battle ~= battle then
        S.SpecialObjects = {}
        S.DirectObjects = {}
        S.GcScanList = nil
        S.GcScanIndex = 1
        S.GcScanFound = {}
        S.GcScanSeen = setmetatable({}, {__mode = "k"})
        S.LastSoulX,S.LastSoulY = nil,nil
        S.StuckCount = 0
        S.StuckDirX,S.StuckDirY = 0,0
        S.SpecialLists = {}
        S.SpecialSeen = setmetatable({}, {__mode = "k"})
        S.WaveFns = setmetatable({}, {__mode = "k"})
        S.Tracks = setmetatable({}, {__mode = "k"})
        S.SpecialTracks = setmetatable({}, {__mode = "k"})
        S.ThreatCount = 0
        S.RouteThreatCount = 0
        S.SpecialCount = 0
        S.RouteSpecialCount = 0
        S.DirX = 0
        S.DirY = 0
        S.ShieldX = 0
        S.ShieldY = 0
        S.Fast = false
        S.LastFrame = -1
        S.LastDecision = -100
        S.LastWaveRefresh = -100
        S.LastGcSpecialScan = os.clock()
    end
end

local function registerBattle(battle,soul)
    if type(battle) ~= "table" or type(soul) ~= "table" then
        return false
    end

    resetBattleState(battle)
    S.Battle = battle
    S.Soul = soul
    SoulBattleCache[soul] = battle
    BattleScanArmed = false
    return true
end

local function writeMethod(target,key,value)
    local ok = pcall(function()
        rawset(target,key,value)
    end)

    if ok and rawget(target,key) == value then
        return true
    end

    if type(setreadonly) == "function" then
        local changed = false

        pcall(function()
            setreadonly(target,false)
            changed = true
            rawset(target,key,value)
        end)

        if changed then
            pcall(function()
                setreadonly(target,true)
            end)
        end

        if rawget(target,key) == value then
            return true
        end
    end

    return false
end

local function getSoulClassFromNew()
    local newFn = raw(SoulModule,"New")
    if type(newFn) ~= "function" then
        return nil
    end

    local ups = getUpvalues(newFn)
    if type(ups) ~= "table" then
        return nil
    end

    for _,v in pairs(ups) do
        if type(v) == "table" and type(raw(v,"Step")) == "function" then
            if raw(v,"__index") == v then
                return v
            end
        end
    end

    return nil
end

local function getExistingSoul()
    if type(getgc) ~= "function" then
        return nil
    end

    local ok,list = pcall(getgc,true)
    if not ok or type(list) ~= "table" then
        ok,list = pcall(getgc)
    end

    if not ok or type(list) ~= "table" then
        return nil
    end

    for i = 1,#list do
        local v = list[i]
        if type(v) == "table"
            and type(raw(v,"X")) == "number"
            and type(raw(v,"Y")) == "number"
            and type(raw(v,"Box")) == "table"
            and type(getMethod(v,"Step")) == "function" then
            return v
        end
    end

    return nil
end

local function patchSoulClass()
    if SoulClassPatched then
        return true
    end

    local class = getSoulClassFromNew()
    local sampleSoul = nil

    if not class then
        sampleSoul = getExistingSoul()
        if sampleSoul then
            local mt = getmetatable(sampleSoul)
            if type(mt) == "table" then
                local idx = raw(mt,"__index")
                if type(idx) == "table" and type(raw(idx,"Step")) == "function" then
                    class = idx
                elseif type(raw(mt,"Step")) == "function" then
                    class = mt
                end
            end
        end
    end

    if type(class) ~= "table" then
        return false
    end

    local original = raw(class,"Step")
    if type(original) ~= "function" then
        return false
    end

    if original == SoulStepWrapper then
        SoulClass = class
        OriginalSoulStep = OriginalSoulStep or original
        SoulClassPatched = true
        return true
    end

    local wrapper
    wrapper = function(self,input,frame,...)
        if type(self) ~= "table" or type(input) ~= "table" then
            return original(self,input,frame,...)
        end

        if raw(self,"Active") == false or raw(self,"Puppet") == true then
            return original(self,input,frame,...)
        end

        if raw(self,"Frozen") == true then
            return original(self,input,frame,...)
        end

        local battle = findBattleForSoul(self)

        if battle and raw(battle,"Running") == true then
            registerBattle(battle,self)

            local currentFrame = num(frame,raw(battle,"Frame") or 0)
            runDecision(battle,self,currentFrame)
            input = mutateInput(input)
        else
            S.DirX,S.DirY,S.ShieldX,S.ShieldY = 0,0,0,0
            S.Fast = false
        end

        local nowClock = os.clock()
        if nowClock - LastDiagPrint >= 1.5 then
            LastDiagPrint = nowClock
            local b = findBattleForSoul(self)
            local posX = num(raw(self,"X"),-99999)
            local posY = num(raw(self,"Y"),-99999)
            local inputType = type(input)
            local ctrl = b and raw(b,"Controller")
            local phase = type(ctrl)=="table" and raw(ctrl,"State")=="Enemy" and raw(b,"Running")==true and raw(b,"SoulActive")==true and "ENEMY" or "IDLE"
            local ix = inputType == "table" and num(raw(input,"StickX"),0) or 0
            local iy = inputType == "table" and num(raw(input,"StickY"),0) or 0
            print("[FUNHOUSE Auto-Dodge v27] SoulStep=YES | Battle=" .. (b and "FOUND" or "NONE") .. " | Phase=" .. phase .. " | Pos=" .. tostring(math.floor(posX*10)/10) .. "," .. tostring(math.floor(posY*10)/10) .. " | Dir=" .. tostring(S.DirX) .. "," .. tostring(S.DirY) .. " | Threats=" .. tostring(S.RouteThreatCount) .. "/" .. tostring(S.RouteSpecialCount) .. " | Input=" .. inputType .. "(" .. tostring(ix) .. "," .. tostring(iy) .. ")")
        end
        return original(self,input,frame,...)
    end

    local ok = writeMethod(class,"Step",wrapper)

    if not ok and type(hookfunction) == "function" then
        local hookOk,old = pcall(function()
            return hookfunction(original,wrapper)
        end)

        if hookOk and type(old) == "function" then
            OriginalSoulStep = old
            SoulStepWrapper = wrapper
            SoulClass = class
            SoulClassPatched = true
            return true
        end

        return false
    end

    SoulClass = class
    OriginalSoulStep = original
    SoulStepWrapper = wrapper
    SoulClassPatched = true
    return true
end

local function scanExistingWaves(battle)
    local waves = raw(battle,"Waves")
    if type(waves) ~= "table" then
        return
    end

    if type(debug) ~= "table" or type(debug.info) ~= "function" then
        return
    end

    for i = 1,#waves do
        local thread = raw(waves[i],"Thread")
        if thread then
            local ok,fn = pcall(debug.info,thread,1,"f")
            if ok and type(fn) == "function" then
                scanWaveFunction(fn)
            end
        end
    end
end

local function findExistingBattle()
    if type(getgc) ~= "function" then
        return nil
    end

    local ok,list = pcall(getgc,true)
    if not ok or type(list) ~= "table" then
        ok,list = pcall(getgc)
    end

    if not ok or type(list) ~= "table" then
        return nil
    end

    for i = 1,#list do
        local v = list[i]

        if type(v) == "table" and raw(v,"Running") == true then
            local soul = getSoul(v)

            if soul then
                return v,soul
            end
        end
    end
end

local function refreshActiveWaveStates(battle)
    local waves = raw(battle,"Waves")
    if type(waves) ~= "table" or type(debug) ~= "table" or type(debug.info) ~= "function" then return end
    for i = 1,#waves do
        local wave = waves[i]
        if type(wave) == "table" then
            local thread = raw(wave,"Thread")
            if thread then
                local ok,fn = pcall(debug.info,thread,1,"f")
                if ok and type(fn) == "function" then
                    local ups = getUpvalues(fn)
                    if type(ups) == "table" then
                        local seen = {}
                        for _,v in pairs(ups) do if type(v) == "table" then walkWaveState(v,0,seen) end end
                    end
                end
            end
        end
    end
end

local function runDecision(battle,soul,frame)
    local gap = S.Fast and FAST_GAP or NORMAL_GAP
    if frame == S.LastFrame and frame - S.LastDecision < gap then
        return
    end
    S.LastFrame = frame
    if frame - S.LastDecision < gap then
        return
    end
    S.LastDecision = frame
    if frame - S.LastWaveRefresh >= 8 then
        S.LastWaveRefresh = frame
        pcall(refreshActiveWaveStates,battle)
    end
    local ok = pcall(decide,battle,soul)
    if not ok then
        S.DirX = 0
        S.DirY = 0
        S.ShieldX = 0
        S.ShieldY = 0
        S.Fast = false
    end
end

local function writeBattleMethod(target,key,value)
    local ok=pcall(function() rawset(target,key,value) end)
    if ok and rawget(target,key)==value then return true end
    if type(setreadonly)=="function" then
        local changed=false
        pcall(function()
            setreadonly(target,false)
            changed=true
            rawset(target,key,value)
        end)
        if changed then pcall(function() setreadonly(target,true) end) end
        if rawget(target,key)==value then return true end
    end
    return false
end

local function getBattleClass(battle)
    if type(battle)=="table" then
        local mt=getmetatable(battle)
        if type(mt)=="table" then
            local idx=raw(mt,"__index")
            if type(idx)=="table" and idx==mt then
                if type(raw(idx,"ControllerInput"))=="function" and type(raw(idx,"Step"))=="function" then
                    return idx
                end
            elseif type(idx)=="table" and type(raw(idx,"ControllerInput"))=="function" and type(raw(idx,"Step"))=="function" then
                return idx
            end
        end
    end
    local newFn=raw(BattleModule,"New")
    if type(newFn)~="function" then return nil end
    local ups=getUpvalues(newFn)
    if type(ups)~="table" then return nil end
    for _,v in pairs(ups) do
        if type(v)=="table" and raw(v,"__index")==v and type(raw(v,"ControllerInput"))=="function" and type(raw(v,"Step"))=="function" then
            return v
        end
    end
    return nil
end

local function isEnemyDodgePhase(battle,soul)
    if type(battle)~="table" or type(soul)~="table" then return false end
    if raw(battle,"Running")~=true or raw(battle,"SoulActive")~=true then return false end
    if raw(soul,"Active")==false or raw(soul,"Puppet")==true or raw(soul,"Frozen")==true then return false end
    local controller=raw(battle,"Controller")
    return type(controller)=="table" and raw(controller,"State")=="Enemy"
end

local LastControllerDiag = 0

local function stopAutoInput()
    S.DirX,S.DirY,S.ShieldX,S.ShieldY=0,0,0,0
    S.Fast=false
end

local function patchBattleController(battle)
    if type(battle)~="table" then return false end
    local class=getBattleClass(battle)
    if type(class)~="table" then
        return false
    end
    local current=raw(class,"ControllerInput")
    if type(current)~="function" then
        return false
    end
    local holder=S.BattleHolders[class]
    if holder and current==holder.wrapper then
        pcall(function() rawset(battle,"ControllerInput",nil) end)
        return true
    end
    local original=current
    local wrapper=function(self,owner,...)
        local result=original(self,owner,...)
        if self~=battle and S.Battle~=self then
            return result
        end
        local soul=getSoul(self)
        if not isEnemyDodgePhase(self,soul) then
            if self==S.Battle then stopAutoInput() end
            return result
        end
        S.Battle=self
        S.Soul=soul
        local frame=num(raw(self,"Frame"),0)
        local decisionGap = S.Fast and FAST_GAP or NORMAL_GAP
        if frame~=S.LastFrame and frame-S.LastDecision>=decisionGap then
            S.LastFrame=frame
            S.LastDecision=frame
            S.FallbackUsed=false
            local ok,err=pcall(decide,self,soul)
            S.DecisionOk=ok
            if ok then
                S.DecisionError=""
            else
                S.DecisionError=tostring(err)
                stopAutoInput()
                S.StuckCount = 0
            end
            if S.DirX==0 and S.DirY==0 then
                pcall(chooseImmediateFallback,soul)
            end
        end
        local output = mutateInput(result)
        local clockNow = os.clock()
        if clockNow - LastControllerDiag >= 1.5 then
            LastControllerDiag = clockNow
            local inX = type(result) == "table" and num(raw(result,"StickX"),0) or 0
            local inY = type(result) == "table" and num(raw(result,"StickY"),0) or 0
            local outX = type(output) == "table" and num(raw(output,"StickX"),0) or 0
            local outY = type(output) == "table" and num(raw(output,"StickY"),0) or 0
            local inKeys = type(result) == "table" and (tostring(raw(result,"Left")) .. "/" .. tostring(raw(result,"Right")) .. "/" .. tostring(raw(result,"Up")) .. "/" .. tostring(raw(result,"Down"))) or "-"
            local outKeys = type(output) == "table" and (tostring(raw(output,"Left")) .. "/" .. tostring(raw(output,"Right")) .. "/" .. tostring(raw(output,"Up")) .. "/" .. tostring(raw(output,"Down"))) or "-"
            local decisionLabel=S.DecisionOk and "OK" or (S.DecisionError~="" and ("ERROR="..string.sub(S.DecisionError,1,110)) or "PENDING")
            print("[FUNHOUSE Auto-Dodge v27] InputHook=YES | Decision=" .. decisionLabel .. " | Fallback=" .. tostring(S.FallbackUsed) .. " | Dir=" .. tostring(S.DirX) .. "," .. tostring(S.DirY) .. " | Threats=" .. tostring(S.RouteThreatCount) .. "/" .. tostring(S.RouteSpecialCount) .. " | Input=" .. type(result) .. "(" .. tostring(inX) .. "," .. tostring(inY) .. ";" .. inKeys .. ") | Output=" .. type(output) .. "(" .. tostring(outX) .. "," .. tostring(outY) .. ";" .. outKeys .. ")")
        end
        return output
    end
    if not writeBattleMethod(class,"ControllerInput",wrapper) then
        return false
    end
    pcall(function() rawset(battle,"ControllerInput",nil) end)
    S.BattleHolders[class]={original=original,wrapper=wrapper}
    S.Battle=battle
    S.Soul=getSoul(battle)
    return true
end

local function isControllerPatched(battle)
    local class=getBattleClass(battle)
    local holder=type(class)=="table" and S.BattleHolders[class]
    return holder and raw(class,"ControllerInput")==holder.wrapper
end

local Updater={Connection=nil,Alive=true,LastScan=0,Status="WAITING",RunningBattle=nil,RunningSoul=nil,ScanGap=0.45}

local function now()
    return os.clock()
end

local function findActiveBattleCached()
    local t=now()
    if Updater.RunningBattle and raw(Updater.RunningBattle,"Running")==true then
        local soul=getSoul(Updater.RunningBattle)
        if soul then
            Updater.RunningSoul=soul
            return Updater.RunningBattle,soul
        end
    end
    if t-Updater.LastScan<Updater.ScanGap then return nil,nil end
    Updater.LastScan=t
    local battle,soul=findExistingBattle()
    if battle and soul then
        Updater.RunningBattle=battle
        Updater.RunningSoul=soul
        registerBattle(battle,soul)
        hookGmScenes()
        scanGmScenesOnce(battle)
        scanExistingWaves(battle)
        patchBattleController(battle)
        return battle,soul
    end
    Updater.RunningBattle=nil
    Updater.RunningSoul=nil
    return nil,nil
end

local function update()
    if not Updater.Alive then return end
    local battle,soul=findActiveBattleCached()
    if not battle or not soul then
        if Updater.Status~="WAITING" then
            Updater.Status="WAITING"
            print("[FUNHOUSE Auto-Dodge v27] Battle=WAITING")
        end
        return
    end
    if raw(battle,"Running")~=true then
        Updater.RunningBattle=nil
        Updater.RunningSoul=nil
        if Updater.Status~="WAITING" then
            Updater.Status="WAITING"
            print("[FUNHOUSE Auto-Dodge v27] Battle=WAITING")
        end
        return
    end
    if not isControllerPatched(battle) then
        patchBattleController(battle)
    end
    local enemy=isEnemyDodgePhase(battle,soul)
    local status=enemy and "ENEMY" or "IDLE"
    if Updater.Status~=status then
        Updater.Status=status
        if enemy then
            print("[FUNHOUSE Auto-Dodge v27] Battle=FOUND | Phase=ENEMY | Controller=PATCHED")
        else
            print("[FUNHOUSE Auto-Dodge v27] Battle=FOUND | Phase=IDLE | AutoMove=OFF")
        end
    end
end

hookGmScenes()

local RunService = game:GetService("RunService")
local connected = false
if RunService then
    local ok,connection = pcall(function()
        return RunService.Heartbeat:Connect(function() pcall(update) end)
    end)
    if ok and connection then
        Updater.Connection = connection
        connected = true
    end
end

if not connected and RunService then
    local ok,connection = pcall(function()
        return RunService.RenderStepped:Connect(function() pcall(update) end)
    end)
    if ok and connection then
        Updater.Connection = connection
        connected = true
    end
end

print("[FUNHOUSE Auto-Dodge v27] Loaded | Updater=" .. (connected and "OK" or "FAILED") .. " | Battle=WAITING")
