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
if GEN.__FUNHOUSE_AUTODODGE_V20 then
    return
end
GEN.__FUNHOUSE_AUTODODGE_V20 = true

local PI = math.pi
local PI2 = PI * 2
local DIAG = 0.7071067811865476
local EPS = 0.000001
local MAX_BULLETS = 180
local MAX_THREATS = 64
local MAX_SPECIAL = 56
local MAX_SPECIAL_LISTS = 8
local NORMAL_GAP = 1
local FAST_GAP = 1
local NORMAL_HORIZON = 30
local FAST_HORIZON = 45
local MARGIN = 3.0
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
    SpecialLists = {},
    SpecialSeen = setmetatable({}, {__mode = "k"}),
    Threats = {},
    ThreatCount = 0,
    SpecialThreats = {},
    SpecialCount = 0,
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
    SceneHooked = false
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
                    if type(o) == "table" and raw(o,"Alive") ~= false and raw(o,"Bullet") == true and raw(o,"Active") == 1 and num(raw(o,"Damage"),0) > 0 then
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
                            for f=0,horizon do
                                local px,py = x,y
                                local vx,vy = tr.vx,tr.vy
                                if f>0 then
                                    if tr.preAim then
                                        local dx,dy = sx-px,sy-py
                                        local dl = math.sqrt(dx*dx+dy*dy)
                                        if dl>0 then
                                            local sp = math.min(STATIONARY_AIM_MAX_SPEED,math.max(86,math.sqrt(vx*vx+vy*vy)))
                                            vx,vy = dx/dl*sp,dy/dl*sp
                                        end
                                    else
                                        vx += tr.ax
                                        vy += tr.ay
                                        local turn = clamp(tr.turn,-1.2,1.2)
                                        if turn ~= 0 then
                                            local c,ss=math.cos(turn),math.sin(turn)
                                            vx,vy=vx*c-vy*ss,vx*ss+vy*c
                                        end
                                    end
                                    x,y=px+vx,py+vy
                                end
                                tr.px[f+1],tr.py[f+1]=x,y
                                tr.pa[f+1],tr.pw[f+1],tr.ph[f+1]=a,w,h
                            end
                            if added < MAX_SPECIAL then
                                added += 1
                                local e=S.SpecialThreats[math.min(S.SpecialCount+added,MAX_SPECIAL)]
                                e.x,e.y,e.w,e.h,e.a,e.shape,e.tr,e.obj=x,y,w,h,a,shape,tr,o
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
    local tnow=os.clock()
    if tnow-S.LastGcSpecialScan < 0.35 then
        return
    end
    S.LastGcSpecialScan=tnow
    local ok,list=pcall(getgc,true)
    if not ok or type(list)~="table" then ok,list=pcall(getgc) end
    if not ok or type(list)~="table" then return end
    local soul=S.Soul
    local sx,sy=num(raw(soul,"X"),0),num(raw(soul,"Y"),0)
    local added=0
    for i=1,#list do
        local v=list[i]
        if type(v)=="table" and raw(v,"Alive")~=false then
            local bx,by=raw(v,"X"),raw(v,"Y")
            local w,h,a=raw(v,"Width"),raw(v,"Height"),raw(v,"Angle")
            local damage=num(raw(v,"Damage"),0)
            local direction=raw(v,"Direction")
            local len=raw(v,"Len")
            if finite(bx) and finite(by) and damage>0 and ((finite(w) and finite(h)) or finite(len) or finite(direction)) then
                local near=dist2(bx,by,sx,sy) <= (OUTSIDE_RANGE+220)^2
                if near or finite(len) or finite(direction) then
                    local shape="Rect"
                    if finite(a) then shape="OrientedRect" end
                    if finite(len) and finite(direction) then
                        w=math.max(math.abs(num(w,8)),math.abs(len))
                        h=math.max(math.abs(num(h,8)),8)
                        a=math.rad(num(direction,0))
                        shape="OrientedRect"
                    else
                        w=math.abs(num(w,12)); h=math.abs(num(h,12)); a=num(a,0)
                    end
                    if added<18 then
                        added+=1
                        local e=S.SpecialThreats[math.min(S.SpecialCount+added,MAX_SPECIAL)]
                        e.x,e.y,e.w,e.h,e.a,e.shape,e.tr,e.obj=bx,by,w,h,a,shape,nil,v
                    end
                end
            end
        end
    end
    if added>0 then S.SpecialCount=math.min(MAX_SPECIAL,S.SpecialCount+added) end
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
                    if S.SpecialCount < MAX_SPECIAL then
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

local function candidate(soul,dx,dy,frame,speed)
    local sx = num(raw(soul,"X"),0)
    local sy = num(raw(soul,"Y"),0)
    local x,y = sx,sy
    local mx,my = dx,dy
    if mx ~= 0 and my ~= 0 then
        mx *= DIAG
        my *= DIAG
    end
    x += mx * speed * frame
    y += my * speed * frame

    if not S.BoxFree and S.BoxData.valid then
        local l,b,r,t = boxAt(S.BoxData,frame)
        if l then
            local px = S.SoulW * 0.5 + math.abs(S.SoulOX) + 1
            local py = S.SoulH * 0.5 + math.abs(S.SoulOY) + 1
            if r - l > px * 2 then
                x = clamp(x,l + px,r - px)
            end
            if t - b > py * 2 then
                y = clamp(y,b + py,t - py)
            end
        end
    end
    return x,y
end

local function blockedAt(x,y)
    if S.BoxFree or type(S.BlockFn) ~= "function" then
        return false
    end
    return S.BlockFn(S.Soul,x,y) == true
end

local function threatRisk(e,x,y,f,sw,sh)
    local t = e.tr

    if t.preAim and t.stationaryAge >= 1 and f > 0 then
        local dx,dy = x - t.x,y - t.y
        local len = math.sqrt(dx * dx + dy * dy)

        if len > 0 then
            local nx,ny = dx / len,dy / len
            local r = t.shape == "Circle" and t.r or math.sqrt(t.w * t.w + t.h * t.h) * 0.5
            local slowSpeed = t.preAimSpeed
            local fastSpeed = math.min(STATIONARY_AIM_MAX_SPEED,slowSpeed * 1.65)

            local px = t.x + nx * slowSpeed * f
            local py = t.y + ny * slowSpeed * f
            if hazardHit(t.shape,px,py,t.w,t.h,t.angle,r,x,y,sw,sh) then
                return HARD * 1.8 + (FAST_HORIZON - math.min(f,FAST_HORIZON)) * 23000,true
            end

            px = t.x + nx * fastSpeed * f
            py = t.y + ny * fastSpeed * f
            if hazardHit(t.shape,px,py,t.w,t.h,t.angle,r,x,y,sw,sh) then
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

    if not px then
        return 0,false
    end

    local r = t.shape == "Circle" and pw or math.sqrt(pw * pw + ph * ph) * 0.5
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

local function evaluate(soul,dx,dy,horizon,sw,sh,speed)
    local score = 0
    local hard = false
    local earliest = horizon + 1

    for f = 0,horizon do
        local x,y = candidate(soul,dx,dy,f,speed)

        if blockedAt(x,y) then
            score += 30000 + (horizon - f) * 1800
            if f <= 1 then
                return HARD * 1.5,true,f
            end
        end

        for j = 1,S.ThreatCount do
            local r,h = threatRisk(S.Threats[j],x,y,f,sw,sh)
            score += r * (1 + (horizon - f) * 0.055)

            if h then
                hard = true
                if f < earliest then
                    earliest = f
                end
                if f <= 2 then
                    return HARD * 3.2,true,earliest
                end
            end
        end

        for j = 1,S.SpecialCount do
            local r,h = specialRisk(S.SpecialThreats[j],x,y,sw,sh,f)
            score += r * (1 + (horizon - f) * 0.045)

            if h then
                hard = true
                if f < earliest then
                    earliest = f
                end
                if f <= 2 then
                    return HARD * 4.2,true,earliest
                end
            end
        end
    end

    local nx,ny = candidate(soul,dx,dy,1,speed)
    local sx = num(raw(soul,"X"),0)
    local sy = num(raw(soul,"Y"),0)

    score += dist2(nx,ny,sx,sy) * 0.010

    if dx == S.DirX and dy == S.DirY then
        score -= 90
    end

    if dx == 0 and dy == 0 then
        score += 50
    end

    if hard then
        score += 25000
    end

    score += earliest * -520
    return score,hard,earliest
end

local function decide(battle,soul)
    readSoulGeometry(soul)
    local horizon = S.Fast and FAST_HORIZON or NORMAL_HORIZON
    prepareBox(battle,horizon)
    gatherThreats(battle,soul,horizon)
    gatherSpecialThreats(horizon)
    gatherGmSceneThreats(battle,soul,horizon)
    scanDirectSpecials(battle)

    local speed = num(raw(soul,"SpeedOverride"),0)
    if speed <= 0 and type(Config) == "table" and type(Config.Soul) == "table" then
        speed = num(raw(Config.Soul,"Speed"),4)
    end
    if speed <= 0 then speed = 4 end

    local bestX,bestY = 0,0
    local bestScore = math.huge
    local bestHard = false
    local bestEarliest = horizon + 1

    for i = 1,#DIRS do
        local d = DIRS[i]
        local score,hard,earliest = evaluate(soul,d[1],d[2],horizon,S.SoulW,S.SoulH,speed)
        if score < bestScore then
            bestScore = score
            bestX = d[1]
            bestY = d[2]
            bestHard = hard
            bestEarliest = earliest
        end
    end

    local shieldX,shieldY,shieldU = shieldDirection()
    if shieldU and shieldU > 220 and bestHard and bestEarliest <= 2 then
        if bestScore > HARD then
            bestX = 0
            bestY = 0
        end
    end

    S.DirX = bestX
    S.DirY = bestY
    S.ShieldX = shieldX
    S.ShieldY = shieldY
    S.Fast = bestHard or bestScore > 180000 or (shieldU and shieldU > 220 or false)
end

local function mutateInput(input)
    if type(input) ~= "table" then
        return input
    end
    local out={}
    for k,v in pairs(input) do
        out[k]=v
    end
    out.Left = S.DirX < 0
    out.Right = S.DirX > 0
    out.Up = S.DirY < 0
    out.Down = S.DirY > 0
    out.StickX = S.DirX
    out.StickY = -S.DirY
    out.Slow = false
    if S.ShieldX ~= 0 or S.ShieldY ~= 0 then
        local p=out.Pressed
        if type(p) ~= "table" then
            p={}
        else
            local copy={}
            for k,v in pairs(p) do
                copy[k]=v
            end
            p=copy
        end
        p.Left = S.ShieldX < 0
        p.Right = S.ShieldX > 0
        p.Up = S.ShieldY < 0
        p.Down = S.ShieldY > 0
        out.Pressed=p
    end
    return out
end


local BattleScanArmed = true
local SoulBattleCache = setmetatable({}, {__mode = "k"})
local SoulClassPatched = false
local SoulClass = nil
local OriginalSoulStep = nil
local SoulStepWrapper = nil

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
        S.SpecialLists = {}
        S.SpecialSeen = setmetatable({}, {__mode = "k"})
        S.WaveFns = setmetatable({}, {__mode = "k"})
        S.Tracks = setmetatable({}, {__mode = "k"})
        S.SpecialTracks = setmetatable({}, {__mode = "k"})
        S.ThreatCount = 0
        S.SpecialCount = 0
        S.DirX = 0
        S.DirY = 0
        S.ShieldX = 0
        S.ShieldY = 0
        S.Fast = false
        S.LastFrame = -1
        S.LastDecision = -100
        S.LastWaveRefresh = -100
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
            local x,y = emergencyDirection(self)

            S.DirX = x
            S.DirY = y
            S.ShieldX = 0
            S.ShieldY = 0

            input.Left = x < 0
            input.Right = x > 0
            input.Up = y < 0
            input.Down = y > 0
            input.StickX = x
            input.StickY = -y
            input.Slow = false
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
    if frame - S.LastWaveRefresh >= 3 then
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
        if frame~=S.LastFrame and frame-S.LastDecision>=NORMAL_GAP then
            S.LastFrame=frame
            S.LastDecision=frame
            local ok=pcall(decide,self,soul)
            if not ok then stopAutoInput() end
        end
        return mutateInput(result)
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
            print("[FUNHOUSE Auto-Dodge v20] Battle=WAITING")
        end
        return
    end
    if raw(battle,"Running")~=true then
        Updater.RunningBattle=nil
        Updater.RunningSoul=nil
        if Updater.Status~="WAITING" then
            Updater.Status="WAITING"
            print("[FUNHOUSE Auto-Dodge v20] Battle=WAITING")
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
            print("[FUNHOUSE Auto-Dodge v20] Battle=FOUND | Phase=ENEMY | Controller=PATCHED")
        else
            print("[FUNHOUSE Auto-Dodge v20] Battle=FOUND | Phase=IDLE | AutoMove=OFF")
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

print("[FUNHOUSE Auto-Dodge v20] Loaded | Updater=" .. (connected and "OK" or "FAILED") .. " | Battle=WAITING")
