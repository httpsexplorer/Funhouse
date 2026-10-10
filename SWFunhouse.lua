local VERSION = "2.2.0"
if not table.clear then
	function table.clear(t)
		for k in pairs(t) do t[k] = nil end
	end
end

local HUB_NAME = "Pink bomb's | FUNHOUSE"
local ASSETS = {
	Icon = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/Bomb.png",
	Error = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/Error.png",
	Notify = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/Notify.png",
}

local function errLog(tag, ...)
	local parts = { "[FUNHOUSE][ERROR][" .. tostring(tag) .. "]" }
	for i = 1, select("#", ...) do
		parts[#parts + 1] = tostring(select(i, ...))
	end
	warn(table.concat(parts, " "))
end

local function safeCall(name, fn)
	local ok, err = pcall(fn)
	if not ok then errLog(name, err) end
	return ok, err
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local GuiService = game:GetService("GuiService")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")

local cref = (type(cloneref) == "function" and cloneref) or function(x) return x end
local UIS = cref(UserInputService)
local RS = cref(ReplicatedStorage)
local CS = cref(CollectionService)
local Me = Players.LocalPlayer
if not Me then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	Me = Players.LocalPlayer
end

local IsMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled
local OnTV = GuiService:IsTenFootInterface()

local WindUI
local loadFails = {}

local function toast(msg, ok)
	pcall(function()
		if WindUI and type(WindUI.Notify) == "function" then
			WindUI:Notify({
				Title = ok and "Pink bomb's" or "Pink bomb's Error",
				Content = tostring(msg),
				Duration = ok and 2 or 6,
				Icon = ok and ASSETS.Notify or ASSETS.Error,
			})
			return
		end
		if not ok then warn("[Pink bomb's]", tostring(msg)) end
	end)
end

local function tryWind(url)
	local ok, res = pcall(function()
		local src = game:HttpGet(url)
		assert(type(src) == "string" and #src > 200, "empty")
		local fn, err = loadstring(src)
		assert(fn, tostring(err))
		local lib = fn()
		assert(type(lib) == "table" and type(lib.CreateWindow) == "function", "bad lib")
		return lib
	end)
	if ok then return res end
	table.insert(loadFails, tostring(res))
	return nil
end

WindUI = tryWind("https://github.com/Footagesus/WindUI/releases/download/1.6.66/main.lua")
	or tryWind("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua")
	or tryWind("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua")
	or tryWind("https://cdn.jsdelivr.net/gh/Footagesus/WindUI@main/dist/main.lua")

if not WindUI then
	toast("WindUI failed\n" .. table.concat(loadFails, "\n"), false)
	return
end

pcall(function()
	if WindUI.SetFont then
		WindUI:SetFont("rbxassetid://12187371840")
	end
end)

if IsMobile and WindUI.SetNotificationLower then
	pcall(function() WindUI:SetNotificationLower(true) end)
end

local function Ping(title, content, dur)
	pcall(function()
		WindUI:Notify({ Title = title, Content = content, Duration = dur or 3, Icon = ASSETS.Notify })
	end)
end

local Loops = {}
local Conns = {}

local function Loop(key, pred, fn, waitTime)
	if Loops[key] then return end
	Loops[key] = true
	task.spawn(function()
		while Loops[key] do
			if not pred() then break end
			pcall(fn)
			if not Loops[key] then break end
			local w = waitTime
			if type(w) == "function" then
				local ok, v = pcall(w)
				w = ok and v or 0.6
			end
			task.wait(math.max(0.08, tonumber(w) or 0.6))
		end
		Loops[key] = nil
	end)
end

local function Stop(key) Loops[key] = nil end
local function StopAllLoops() for k in pairs(Loops) do Loops[k] = nil end end

local function Conn(key, connection)
	if not connection then return end
	Conns[key] = Conns[key] or {}
	table.insert(Conns[key], connection)
	return connection
end

local function DisconnectKey(key)
	local list = Conns[key]
	if not list then return end
	for _, c in ipairs(list) do pcall(function() c:Disconnect() end) end
	Conns[key] = nil
end

local function DisconnectAll()
	for k in pairs(Conns) do DisconnectKey(k) end
end

local CharState = { Character = nil, Humanoid = nil, Root = nil }

local function refreshChar(char)
	char = char or Me.Character
	CharState.Character = char
	CharState.Humanoid = char and char:FindFirstChildOfClass("Humanoid") or nil
	CharState.Root = char and char:FindFirstChild("HumanoidRootPart") or nil
	if not CharState.Root and char then
		CharState.Root = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
	end
end

refreshChar(Me.Character)
Conn("core", Me.CharacterAdded:Connect(function(c)
	task.wait(0.15)
	refreshChar(c)
end))
Conn("core", Me.CharacterRemoving:Connect(function()
	CharState.Character = nil
	CharState.Humanoid = nil
	CharState.Root = nil
end))

local function Char()
	local c = Me.Character
	if c ~= CharState.Character then refreshChar(c) end
	return CharState.Character
end

local function Hum()
	local c = Char()
	if not c then return nil end
	if not CharState.Humanoid or CharState.Humanoid.Parent ~= c then
		CharState.Humanoid = c:FindFirstChildOfClass("Humanoid")
	end
	return CharState.Humanoid
end

local function Root()
	local c = Char()
	if not c then return nil end
	if not CharState.Root or CharState.Root.Parent ~= c then
		CharState.Root = c:FindFirstChild("HumanoidRootPart")
			or c:FindFirstChild("Torso")
			or c:FindFirstChild("UpperTorso")
	end
	return CharState.Root
end

local function Hearts()
	local c = Char()
	return c and (tonumber(c:GetAttribute("hearts")) or 0) or 0
end

local function Alive()
	local c = Char()
	if not c then return false end
	local h = Hum()
	if h and h.Health <= 0 and Hearts() <= 0 then return false end
	if Me:GetAttribute("IsDead") == true and Hearts() <= 0 then return false end
	if Root() then
		if Hearts() > 0 then return true end
		if h and h.Health > 0 then return true end
		return true
	end
	return false
end

local function CharName()
	local c = Char()
	if not c then return "" end
	return string.lower(tostring(c:GetAttribute("CharacterName") or ""))
end

local function IsPal(name)
	return CharName():find(name, 1, true) ~= nil
end

local function Rem(name)
	local r = RS:FindFirstChild(name)
	if r and (r:IsA("RemoteEvent") or r:IsA("RemoteFunction")) then return r end
	return nil
end

local function Part(x)
	if not x then return nil end
	if x:IsA("BasePart") then return x end
	if x:IsA("Model") then
		if x.PrimaryPart then return x.PrimaryPart end
		return x:FindFirstChild("HumanoidRootPart") or x:FindFirstChildWhichIsA("BasePart", true)
	end
	return x:FindFirstChildWhichIsA("BasePart", true)
end

local function IsPlayerChar(m)
	if not m then return false end
	return Players:GetPlayerFromCharacter(m) ~= nil
end

local function IsDone(obj)
	if not obj then return true end
	if obj:GetAttribute("Used") == true then return true end
	local a = obj:GetAttribute("Activated")
	if a == 1 or a == true then return true end
	local d = obj:GetAttribute("Completed") or obj:GetAttribute("Done")
	if d == true or d == 1 then return true end
	local root = obj
	pcall(function()
		local p = obj.Parent
		if p and p:IsA("Model") then root = p end
	end)
	if root ~= obj then
		if root:GetAttribute("Used") == true then return true end
		local a2 = root:GetAttribute("Activated")
		if a2 == 1 or a2 == true then return true end
	end
	return false
end

local function isSanePos(pos, maxMag)
	if typeof(pos) ~= "Vector3" then return false end
	if pos ~= pos then return false end
	local lim = maxMag or 8000
	return math.abs(pos.X) < lim and math.abs(pos.Y) < lim and math.abs(pos.Z) < lim
end

local MANNY_WANDER = "100596528077771"
local cryptidCache = {}
local cryptidCacheAt = 0

local function IsMabel(m)
	if not m then return false end
	local n = string.lower(m.Name)
	if n:find("mabel", 1, true) then return true end
	local cn = string.lower(tostring(m:GetAttribute("CharacterName") or ""))
	return cn:find("mabel", 1, true) ~= nil
end

local function IsPassiveManny(m)
	if not m then return false end
	local n = string.lower(m.Name)
	if not (n:find("manny", 1, true) or n:find("cryptidmanny", 1, true)) then return false end
	local awake, wander = false, false
	pcall(function()
		local hum = m:FindFirstChildOfClass("Humanoid")
		local anim = hum and hum:FindFirstChildOfClass("Animator")
		if not anim then return end
		for _, t in ipairs(anim:GetPlayingAnimationTracks()) do
			local id = ""
			pcall(function() id = tostring(t.Animation and t.Animation.AnimationId or "") end)
			local low = string.lower(id)
			if low:find("awakening", 1, true) then awake = true end
			if low:find(MANNY_WANDER, 1, true) or low:find("wandering", 1, true) then wander = true end
		end
	end)
	if awake then return false end
	if wander then return true end
	return false
end

local function IsCryptid(m)
	if not m or not m.Parent then return false end
	if IsPlayerChar(m) then return false end
	local n = string.lower(m.Name)
	if n == "fan" or n:find("stargil", 1, true) then return true end
	if n:find("cryptid", 1, true) then return true end
	if m:GetAttribute("IsCryptid") == true then return true end
	local cn = string.lower(tostring(m:GetAttribute("CharacterName") or ""))
	if cn:find("cryptid", 1, true) then return true end
	return false
end

local function IsThreat(m)
	if not m or IsPlayerChar(m) then return false end
	if IsMabel(m) then return false end
	if IsPassiveManny(m) then return false end
	return IsCryptid(m)
end

local function refreshCryptids(force)
	local now = os.clock()
	if not force and now - cryptidCacheAt < 1.4 then return end
	cryptidCacheAt = now
	table.clear(cryptidCache)
	local seen = {}
	local function add(o)
		if not o or not o.Parent or seen[o] then return end
		if IsCryptid(o) then
			seen[o] = true
			table.insert(cryptidCache, o)
		end
	end
	pcall(function()
		for _, tag in ipairs({ "Cryptid", "Chaser", "Entity" }) do
			for _, o in ipairs(CS:GetTagged(tag)) do add(o) end
		end
	end)
	local function walk(root, depth)
		if depth > 3 or not root then return end
		for _, c in ipairs(root:GetChildren()) do
			add(c)
			if c:IsA("Model") or c:IsA("Folder") then walk(c, depth + 1) end
		end
	end
	for _, o in ipairs(Workspace:GetChildren()) do
		add(o)
		walk(o, 1)
	end
end

local function CryptidNear(pos, rad, force)
	if not pos then return false end
	rad = (rad or 56) + 4
	refreshCryptids(force == true)
	local me = Char()
	if me and me:GetAttribute("Chased") == true then rad = rad * 1.35 end
	local samples = {
		pos,
		pos + Vector3.new(5, 0, 0),
		pos + Vector3.new(-5, 0, 0),
		pos + Vector3.new(0, 0, 5),
		pos + Vector3.new(0, 0, -5),
		pos + Vector3.new(0, 3, 0),
	}
	for _, o in ipairs(cryptidCache) do
		if o.Parent and IsThreat(o) then
			local p = Part(o)
			if p then
				for _, s in ipairs(samples) do
					if (p.Position - s).Magnitude <= rad then
						return true, o, p.Position
					end
				end
			end
		end
	end
	return false
end

local machineFail = {}
local machineScanCache = nil
local machineScanCacheAt = 0
local machineScanBusy = false

local function machineRoot(o)
	if not o then return nil end
	local cur, best = o, o:IsA("Model") and o or nil
	while cur and cur ~= Workspace do
		if cur:IsA("Model") then
			local low = string.lower(cur.Name)
			if low:find("arcade", 1, true) or low:find("arcane", 1, true)
				or low:find("storage", 1, true) or low:find("corey", 1, true)
				or low:find("tree", 1, true) then
				best = cur
			end
		end
		cur = cur.Parent
	end
	return best or (o:IsA("Model") and o) or o
end

local function prettyMachineName(obj)
	local n = tostring(obj and obj.Name or "")
	local low = string.lower(n)
	if low:find("double", 1, true) and (low:find("arcane", 1, true) or low:find("arcade", 1, true)) then
		return "Double Arcane"
	end
	if low:find("arcade", 1, true) or low:find("arcane", 1, true) then return "Arcane" end
	if low:find("storage", 1, true) then return "Storage" end
	if low:find("corey", 1, true) or low:find("tree", 1, true) then return "Tree" end
	return n:gsub("%d+$", "")
end

local function GetMachines()
	local now = os.clock()
	if machineScanCache and now - machineScanCacheAt < 0.9 then return machineScanCache end
	if machineScanBusy then return machineScanCache or {} end
	machineScanBusy = true
	local out, seen, seenPos = {}, {}, {}
	local function posKey(pos)
		if not pos then return nil end
		return string.format("%d_%d_%d", math.floor(pos.X / 4), math.floor(pos.Y / 4), math.floor(pos.Z / 4))
	end
	local function push(tag, typeName, o)
		local root = machineRoot(o) or o
		if not root or not root.Parent or seen[root] then return end
		local p = Part(root)
		local pos = p and p.Position
		local pk = posKey(pos)
		if pk and seenPos[pk] then return end
		seen[root] = true
		if pk then seenPos[pk] = true end
		local look = p and p.CFrame.LookVector
		table.insert(out, {
			Instance = root,
			Tagged = o,
			Type = typeName,
			Tag = tag,
			Done = IsDone(root) or IsDone(o),
			Position = pos,
			Front = pos and look and (pos + look * 4 + Vector3.new(0, 2, 0)) or pos,
		})
	end
	for _, o in ipairs(CS:GetTagged("ArcadeMachine")) do push("ArcadeMachine", "Arcade", o) end
	for _, o in ipairs(CS:GetTagged("StorageMachine")) do push("StorageMachine", "Storage", o) end
	for _, o in ipairs(CS:GetTagged("CoreyMachine")) do push("CoreyMachine", "Corey", o) end
	machineScanBusy = false
	machineScanCache = out
	machineScanCacheAt = os.clock()
	return out
end

local function markMachineFail(obj, sec)
	if obj then machineFail[obj] = os.clock() + (sec or 4) end
end

local function isMachineFailed(obj)
	local t = machineFail[obj]
	return t and os.clock() < t
end

local Settings = {
	wallCheck = true,
	checkCryptid = true,
	safeDist = 52,
	exitCd = 2.2,
	exitY = 2.5,
	machCd = 1.6,
	pace = 1.0,
	delayMs = 100,
	farmType = "Teleport", -- Teleport | Bring
}

local Util = {
	fullbright = false,
	nofog = false,
	antilag = false,
	noRender = false,
	unlockCam = false,
	protectNames = false,
	fovOn = false,
	fov = 70,
	maxZoom = 128,
	minZoom = 0.5,
	fly = false,
	flySpeed = 50,
	noclip = false,
	tpwalk = false,
	tpwalkSpeed = 3,
	afk = false,
	maxStam = false,
	alwaysRun = false,
	runSpeed = 20,
	noBusy = false,
	deleteCollisions = false,
	autoVote = "Off",
	autoMach = false,
	autoExit = false,
	autoEscape = false,
}

local lastExitTry = 0
local fleeLockUntil = 0

local function SafeTP(target, lookAt, rad)
	local r = Root()
	if not r or not r.Parent then return false end
	local pos = typeof(target) == "Vector3" and target or nil
	if typeof(target) == "Instance" then
		local p = Part(target)
		pos = p and p.Position
	end
	if not pos or not isSanePos(pos) then return false end
	rad = rad or Settings.safeDist
	if Settings.wallCheck and Settings.checkCryptid then
		if CryptidNear(pos, rad, true) then return false end
	end
	local cf
	if lookAt then
		cf = CFrame.lookAt(pos, Vector3.new(lookAt.X, pos.Y, lookAt.Z))
	else
		cf = CFrame.new(pos)
	end
	pcall(function()
		r.AssemblyLinearVelocity = Vector3.zero
		r.AssemblyAngularVelocity = Vector3.zero
		r.CFrame = cf
		r.AssemblyLinearVelocity = Vector3.zero
		r.AssemblyAngularVelocity = Vector3.zero
	end)
	return true
end

local function remoteNameForTag(tag)
	if tag == "ArcadeMachine" then return "ArcadeMachineUse" end
	return "StorageMachineUse"
end

local function CompleteRemoteOnly(tag)
	local remName = remoteNameForTag(tag)
	local rem = Rem(remName)
	if not rem then return end
	for _, m in ipairs(CS:GetTagged(tag)) do
		if m and m.Parent then
			pcall(function() rem:FireServer(m, "complete") end)
		end
	end
	for _, m in ipairs(GetMachines()) do
		if m.Tag == tag and m.Instance and m.Instance.Parent then
			local target = m.Tagged or m.Instance
			pcall(function() rem:FireServer(target, "complete") end)
		end
	end
end

local function FireCompleteOne(obj, tag)
	if not obj or not obj.Parent then return end
	local rem = Rem(remoteNameForTag(tag or "StorageMachine"))
	if not rem then return end
	pcall(function() rem:FireServer(obj, "complete") end)
	if tag then
		for _, m in ipairs(CS:GetTagged(tag)) do
			if m and m.Parent and (m == obj or m:IsDescendantOf(obj) or obj:IsDescendantOf(m)) then
				pcall(function() rem:FireServer(m, "complete") end)
			end
		end
	end
end

local function FirePrompt(obj)
	if not obj then return false end
	local prompt = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
	if not prompt then return false end
	if type(fireproximityprompt) == "function" then
		local ok = pcall(function() fireproximityprompt(prompt) end)
		if ok then return true end
	end
	local ok = pcall(function()
		prompt.Enabled = true
		local hold = tonumber(prompt.HoldDuration) or 0
		prompt:InputHoldBegin()
		task.wait(math.clamp(hold, 0.08, 1.2))
		prompt:InputHoldEnd()
	end)
	return ok
end

local savedExitPart = nil
local exitReady = false

pcall(function()
	local ev = RS:FindFirstChild("RoundEnderReady")
	if ev and ev:IsA("RemoteEvent") then
		Conn("exit", ev.OnClientEvent:Connect(function(part)
			if typeof(part) == "Instance" then
				savedExitPart = Part(part) or part
				exitReady = true
			end
		end))
	end
end)

local function findExitPart()
	if savedExitPart and savedExitPart.Parent then return savedExitPart end
	local function hasTouch(o)
		if not o then return false end
		if o:FindFirstChild("TouchInterest") then return true end
		for _, d in ipairs(o:GetDescendants()) do
			if d:IsA("TouchTransmitter") or d.Name == "TouchInterest" then return true end
		end
		return false
	end
	local function scan(root, depth)
		if depth > 6 or not root then return nil end
		for _, c in ipairs(root:GetChildren()) do
			local low = string.lower(c.Name)
			if low:find("roundender", 1, true) or low == "exit" or low:find("escape", 1, true) then
				if hasTouch(c) then return Part(c) or c end
				local p = Part(c)
				if p then return p end
			end
			if c:IsA("Model") or c:IsA("Folder") then
				local f = scan(c, depth + 1)
				if f then return f end
			end
		end
		return nil
	end
	for _, name in ipairs({ "PartyRoom", "CaveMap", "CurrentMap" }) do
		local f = Workspace:FindFirstChild(name)
		if f then
			local e = scan(f, 1)
			if e then return e end
		end
	end
	return scan(Workspace, 1)
end

local function doExit(force)
	if not force and os.clock() - lastExitTry < Settings.exitCd then return false end
	if not force and os.clock() < fleeLockUntil then return false end
	lastExitTry = os.clock()
	local part = findExitPart()
	if not part then return false end
	local p = Part(part) or part
	if not p or not p:IsA("BasePart") then return false end
	local dest = p.Position + Vector3.new(0, Settings.exitY, 0)
	if not force and Settings.wallCheck and CryptidNear(dest, 40, true) then return false end
	if SafeTP(dest, nil, force and 1 or 40) then
		exitReady = false
		return true
	end
	return false
end

local function getSafePos()
	local mapY = Workspace:FindFirstChild("IntermissionMapYes")
	if not mapY then return nil end
	local mapCenter = Part(mapY)
	for _, n in ipairs({ "SpawnLocation", "Spawn" }) do
		for _, o in ipairs(mapY:GetChildren()) do
			if o.Name == n then
				local p = Part(o)
				if p and isSanePos(p.Position, 4000) then
					local okDist = true
					if mapCenter and (p.Position - mapCenter.Position).Magnitude > 500 then
						okDist = false
					end
					if okDist then return p.Position + Vector3.new(0, 3, 0) end
				end
			end
		end
	end
	return nil
end

local function isIntermission()
	local mapSv = RS:FindFirstChild("CurrentMap")
	local mapName = mapSv and string.lower(tostring(mapSv.Value or "")) or ""
	if mapName:find("tutorial", 1, true) then return false end
	if mapName:find("intermission", 1, true) or mapName:find("waiting", 1, true) then return true end
	local area = RS:FindFirstChild("Area")
	if area then
		local a = string.lower(tostring(area.Value or ""))
		if a:find("intermission", 1, true) or a:find("waiting", 1, true) then return true end
		if a:find("tutorial", 1, true) then return false end
	end
	return false
end

local function isCoreyArea()
	local mapSv = RS:FindFirstChild("CurrentMap")
	local mapName = mapSv and string.lower(tostring(mapSv.Value or "")) or ""
	local area = RS:FindFirstChild("Area")
	local a = area and string.lower(tostring(area.Value or "")) or ""
	return mapName:find("corey", 1, true) or a:find("corey", 1, true)
end

local function goSafe()
	if isIntermission() then return false end
	local pos = getSafePos()
	if not pos then return false end
	fleeLockUntil = os.clock() + 0.9
	return SafeTP(pos, nil, 1)
end

local lightSnap = nil

local function snapLighting()
	lightSnap = {
		Brightness = Lighting.Brightness,
		ClockTime = Lighting.ClockTime,
		FogEnd = Lighting.FogEnd,
		FogStart = Lighting.FogStart,
		GlobalShadows = Lighting.GlobalShadows,
		OutdoorAmbient = Lighting.OutdoorAmbient,
		Ambient = Lighting.Ambient,
	}
end

local function applyFullbright()
	pcall(function()
		Lighting.Brightness = 2
		Lighting.ClockTime = 14
		Lighting.FogEnd = 100000
		Lighting.GlobalShadows = false
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		Lighting.Ambient = Color3.fromRGB(128, 128, 128)
	end)
end

local function applyNoFog()
	pcall(function()
		Lighting.FogEnd = 100000
		Lighting.FogStart = 0
	end)
end

local function restoreLighting()
	if not lightSnap then return end
	pcall(function()
		for k, v in pairs(lightSnap) do
			Lighting[k] = v
		end
	end)
end

local function restoreFog()
	if not lightSnap then return end
	pcall(function()
		Lighting.FogEnd = lightSnap.FogEnd
		Lighting.FogStart = lightSnap.FogStart
	end)
end

local flyWant = false
local flyBV, flyBG

local function stopFly()
	flyWant = false
	pcall(function() if flyBV then flyBV:Destroy() end end)
	pcall(function() if flyBG then flyBG:Destroy() end end)
	flyBV, flyBG = nil, nil
	Stop("Fly")
end

local function SetFly(on)
	if not on then
		stopFly()
		Util.fly = false
		return
	end
	Util.fly = true
	flyWant = true
	local r = Root()
	if not r then return end
	pcall(function()
		flyBV = Instance.new("BodyVelocity")
		flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		flyBV.Velocity = Vector3.zero
		flyBV.Parent = r
		flyBG = Instance.new("BodyGyro")
		flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
		flyBG.P = 9e4
		flyBG.Parent = r
	end)
	Loop("Fly", function() return flyWant end, function()
		local r2 = Root()
		local cam = Workspace.CurrentCamera
		if not r2 or not cam or not flyBV then return end
		local dir = Vector3.zero
		if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
		if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0, 1, 0) end
		if dir.Magnitude > 0 then dir = dir.Unit * (Util.flySpeed or 50) end
		flyBV.Velocity = dir
		flyBG.CFrame = cam.CFrame
	end, 0.03)
end

local function setNoclip(on)
	local c = Char()
	if not c then return end
	for _, p in ipairs(c:GetDescendants()) do
		if p:IsA("BasePart") then
			p.CanCollide = not on
		end
	end
end

local TW = { on = false, speed = 3, conn = nil }

local function stopTPWalk()
	TW.on = false
	if TW.conn then pcall(function() TW.conn:Disconnect() end) TW.conn = nil end
end

local function startTPWalk()
	stopTPWalk()
	TW.on = true
	TW.conn = RunService.Heartbeat:Connect(function(dt)
		if not TW.on then return end
		local r = Root()
		local h = Hum()
		if not r or not h then return end
		local move = h.MoveDirection
		if move.Magnitude > 0.05 then
			r.CFrame = r.CFrame + move * TW.speed * (dt * 60)
		end
	end)
end

local function staminaTick()
	local c = Char()
	if not c then return end
	for _, attr in ipairs({ "Stamina", "stamina", "CurrentStamina", "MaxStamina" }) do
		pcall(function()
			local v = c:GetAttribute(attr)
			if typeof(v) == "number" then
				c:SetAttribute(attr, 100)
			end
		end)
	end
	local h = Hum()
	if h then
		pcall(function()
			if h:GetAttribute("Stamina") then h:SetAttribute("Stamina", 100) end
		end)
	end
end

local function busyTick()
	local c = Char()
	if not c then return end
	pcall(function()
		c:SetAttribute("Busy", false)
		c:SetAttribute("IsBusy", false)
		c:SetAttribute("busy", false)
	end)
end

local Debuff = { RottenBanana = false, Butter = false, Puddle = false }
local debuffConns = {}

local function setDebuff(name, on)
	Debuff[name] = on == true
	if not (Debuff.RottenBanana or Debuff.Butter or Debuff.Puddle) then
		Stop("Debuff")
		for _, c in pairs(debuffConns) do pcall(function() c:Disconnect() end) end
		table.clear(debuffConns)
		return
	end
	Loop("Debuff", function() return Debuff.RottenBanana or Debuff.Butter or Debuff.Puddle end, function()
		local c = Char()
		if not c then return end
		if Debuff.RottenBanana then
			pcall(function()
				c:SetAttribute("RottenBanana", false)
				c:SetAttribute("Slowed", false)
			end)
		end
		if Debuff.Butter then
			pcall(function() c:SetAttribute("Butter", false) end)
		end
		if Debuff.Puddle then
			pcall(function() c:SetAttribute("Puddle", false) end)
		end
	end, 0.12)
end

local function stopDebuffWatch()
	Stop("Debuff")
	for _, c in pairs(debuffConns) do pcall(function() c:Disconnect() end) end
	table.clear(debuffConns)
end

local Immunity = { Snuggles = false, Triplets = false, Dolly = false, StarGirl = false }
local immStarConn, immFanConn
local fanWindParts = {}

local function isStarGirlModel(inst)
	if not inst then return false end
	local n = string.lower(inst.Name)
	return n == "stargirl" or n:find("stargil", 1, true) ~= nil
end

local function isFanModel(inst)
	if not inst then return false end
	return string.lower(inst.Name) == "fan"
end

local function stripStarGirlHitboxes()
	if not Immunity.StarGirl then return end
	for _, obj in ipairs(Workspace:GetDescendants()) do
		if obj:IsA("Model") and isStarGirlModel(obj) then
			for _, d in ipairs(obj:GetDescendants()) do
				if d:IsA("BasePart") then
					local n = string.lower(d.Name)
					if n == "hitbox" or n:find("hitbox", 1, true) then
						pcall(function() d:Destroy() end)
					end
				end
			end
		end
	end
end

local function stripImm()
	if Immunity.Triplets then
		pcall(function()
			local r = RS:FindFirstChild("TripletAlert")
			if r then r:Destroy() end
		end)
	end
	if Immunity.Snuggles or Immunity.Dolly then
		pcall(function()
			local r = RS:FindFirstChild("SnugglesAlert")
			if r then r:Destroy() end
		end)
	end
end

local function startImmunityObservers()
	if Immunity.StarGirl and not immStarConn then
		immStarConn = Workspace.DescendantAdded:Connect(function(obj)
			if not Immunity.StarGirl or not obj:IsA("BasePart") then return end
			local n = string.lower(obj.Name)
			local model = obj:FindFirstAncestorWhichIsA("Model")
			if model and isStarGirlModel(model) and (n == "hitbox" or n:find("hitbox", 1, true)) then
				pcall(function() obj:Destroy() end)
			end
		end)
	end
end

local function stopImmunityObservers()
	if immStarConn then immStarConn:Disconnect() immStarConn = nil end
	if immFanConn then immFanConn:Disconnect() immFanConn = nil end
	table.clear(fanWindParts)
end

local function setImmunity(name, on)
	if Immunity[name] == nil then return end
	Immunity[name] = on == true
	if not (Immunity.Snuggles or Immunity.Triplets or Immunity.Dolly or Immunity.StarGirl) then
		Stop("Imm")
		stopImmunityObservers()
		return
	end
	if Immunity.StarGirl then stripStarGirlHitboxes() end
	startImmunityObservers()
	stripImm()
	Loop("Imm", function()
		return Immunity.Snuggles or Immunity.Triplets or Immunity.Dolly or Immunity.StarGirl
	end, stripImm, 0.15)
end

local function godModeOneRound()
	local c = Char()
	if not c then return end
	pcall(function()
		local h = Hum()
		if h then
			h.MaxHealth = math.huge
			h.Health = math.huge
		end
		c:SetAttribute("hearts", 99)
	end)
	Ping("God Mode", "Active for this round only.", 3)
end

local function instantDie()
	local h = Hum()
	if h then
		pcall(function() h.Health = 0 end)
	end
	pcall(function()
		local c = Char()
		if c then c:SetAttribute("hearts", 0) end
	end)
end

local function doAutoVote()
	if Util.autoVote == "Off" or Util.autoVote == "" then return end
	local ev = Rem("CardVoteEvent")
	if not ev then return end
	pcall(function() ev:FireServer(Util.autoVote) end)
end

local ESP = {
	on = {
		Cryptids = false,
		Outcast = false,
		Pals = false,
		Items = false,
		Machines = false,
	},
	bl = {
		Anton = false, Manny = false, Split = false, Freddie = false,
		Mabel = false, Dusty = false, Stargil = false,
		Snuggles = false, Dolly = false, Windy = false, Fan = false, Triplets = false, CoreyOutcast = false,
		Corey = false, Storage = false, Arcane = false,
		Items = false,
	},
	blItem = {},
	colors = {
		Cryptids = Color3.fromRGB(255, 60, 60),
		Outcast = Color3.fromRGB(255, 140, 0),
		Pals = Color3.fromRGB(80, 180, 255),
		Items = Color3.fromRGB(100, 255, 120),
		Machines = Color3.fromRGB(200, 160, 80),
	},
	folder = nil,
	hooked = false,
}

local ESPCategories = {
	{
		key = "Cryptids",
		label = "Cryptids",
		color = Color3.fromRGB(255, 60, 60),
		modelsOnly = true,
		match = function(obj)
			if IsPlayerChar(obj) then return false end
			local low = string.lower(obj.Name or "")
			local cn = string.lower(tostring(obj:GetAttribute("CharacterName") or ""))
			if low:find("snuggles", 1, true) or cn:find("snuggles", 1, true) then return false end
			if low:find("dolly", 1, true) or cn:find("dolly", 1, true) then return false end
			if low:find("windy", 1, true) or cn:find("windy", 1, true) then return false end
			if low:find("triplets", 1, true) or cn:find("triplets", 1, true) then return false end
			if low == "fan" or low:find("gil", 1, true) or cn:find("gil", 1, true) then return false end
			if low:find("corey", 1, true) and not low:find("machine", 1, true) then return false end
			if low:find("spawn", 1, true) or low:find("spawner", 1, true) or low == "cryptidspawn" then return false end
			return IsCryptid(obj)
		end,
		blacklist = function(obj)
			local low = string.lower(obj.Name or "")
			if low:find("spawn", 1, true) or low:find("spawner", 1, true) or low == "cryptidspawn" or low:find("placeholder", 1, true) then
				return true
			end
			if low:find("anton", 1, true) and ESP.bl.Anton then return true end
			if low:find("manny", 1, true) and ESP.bl.Manny then return true end
			if low:find("split", 1, true) and ESP.bl.Split then return true end
			if low:find("freddie", 1, true) and ESP.bl.Freddie then return true end
			if low:find("mabel", 1, true) and ESP.bl.Mabel then return true end
			if low:find("dusty", 1, true) and ESP.bl.Dusty then return true end
			if low:find("stargil", 1, true) and ESP.bl.Stargil then return true end
			return false
		end,
	},
	{
		key = "Outcast",
		label = "Outcast",
		color = Color3.fromRGB(255, 140, 0),
		modelsOnly = true,
		match = function(obj)
			if IsPlayerChar(obj) then return false end
			local low = string.lower(obj.Name or "")
			local cn = string.lower(tostring(obj:GetAttribute("CharacterName") or ""))
			if low:find("snuggles", 1, true) or cn:find("snuggles", 1, true) then return true end
			if low:find("dolly", 1, true) or cn:find("dolly", 1, true) then return true end
			if low:find("windy", 1, true) or cn:find("windy", 1, true) then return true end
			if low:find("triplets", 1, true) or cn:find("triplets", 1, true) then return true end
			if low == "fan" or (low:find("fan", 1, true) and #low <= 8) then return true end
			if low:find("gil", 1, true) or cn:find("gil", 1, true) then return true end
			if low:find("corey", 1, true) and not low:find("machine", 1, true) then return true end
			if low:find("outcast", 1, true) or cn:find("outcast", 1, true) then return true end
			return false
		end,
		blacklist = function(obj)
			local low = string.lower(obj.Name or "")
			if low:find("snuggles", 1, true) and ESP.bl.Snuggles then return true end
			if low:find("dolly", 1, true) and ESP.bl.Dolly then return true end
			if low:find("windy", 1, true) and ESP.bl.Windy then return true end
			if (low == "fan" or (low:find("fan", 1, true) and #low <= 8) or low:find("gil", 1, true)) and ESP.bl.Fan then return true end
			if low:find("triplets", 1, true) and ESP.bl.Triplets then return true end
			if low:find("corey", 1, true) and not low:find("machine", 1, true) and ESP.bl.CoreyOutcast then return true end
			return false
		end,
	},
	{
		key = "Machines",
		label = "Machines",
		color = Color3.fromRGB(200, 160, 80),
		modelsOnly = true,
		match = function(obj)
			local low = string.lower(obj.Name or "")
			if low:find("arcade", 1, true) or low:find("arcane", 1, true) then
				return not ESP.bl.Arcane
			end
			if low:find("storage", 1, true) then
				return not ESP.bl.Storage
			end
			if low:find("corey", 1, true) and low:find("machine", 1, true) then
				return not ESP.bl.Corey
			end
			local ok = false
			pcall(function()
				ok = CS:HasTag(obj, "ArcadeMachine") or CS:HasTag(obj, "StorageMachine") or CS:HasTag(obj, "CoreyMachine")
			end)
			if ok then
				if CS:HasTag(obj, "ArcadeMachine") and ESP.bl.Arcane then return false end
				if CS:HasTag(obj, "StorageMachine") and ESP.bl.Storage then return false end
				if CS:HasTag(obj, "CoreyMachine") and ESP.bl.Corey then return false end
				return true
			end
			return false
		end,
		blacklist = function() return false end,
	},
	{
		key = "Items",
		label = "Items",
		color = Color3.fromRGB(100, 255, 120),
		modelsOnly = false,
		match = function(obj)
			if ESP.bl.Items then return false end
			local low = string.lower(obj.Name or "")
			if low:find("fleshtrap", 1, true) then return false end
			if ESP.blItem and next(ESP.blItem) then
				for key in pairs(ESP.blItem) do
					if key ~= "all items" and low:find(key, 1, true) then return false end
				end
			end
			local tagged = false
			pcall(function()
				tagged = CS:HasTag(obj, "Spawneditem") or CS:HasTag(obj, "SpawnedItem")
			end)
			return tagged
		end,
		blacklist = function() return false end,
	},
	{
		key = "Pals",
		label = "Players",
		color = Color3.fromRGB(80, 180, 255),
		modelsOnly = true,
		match = function(obj)
			return IsPlayerChar(obj) and Players:GetPlayerFromCharacter(obj) ~= Me
		end,
		blacklist = function() return false end,
	},
}

for _, cat in ipairs(ESPCategories) do
	cat.enabled = false
	cat.highlights = {}
end

local function ensureESPFolder()
	local pg = Me:FindFirstChildOfClass("PlayerGui")
	if not pg then return nil end
	local f = pg:FindFirstChild("EC_ESP")
	if not f then
		f = Instance.new("Folder")
		f.Name = "EC_ESP"
		f.Parent = pg
	end
	ESP.folder = f
	return f
end

local function anyESP()
	for _, cat in ipairs(ESPCategories) do
		if cat.enabled then return true end
	end
	for _, v in pairs(ESP.on) do
		if v then return true end
	end
	return false
end

local function clearESP()
	for _, cat in ipairs(ESPCategories) do
		for obj, h in pairs(cat.highlights) do
			pcall(function() h:Destroy() end)
		end
		table.clear(cat.highlights)
	end
	local f = ensureESPFolder()
	if f then pcall(function() f:ClearAllChildren() end) end
end

local function removeHighlight(obj)
	for _, cat in ipairs(ESPCategories) do
		local h = cat.highlights[obj]
		if h then
			pcall(function() h:Destroy() end)
			cat.highlights[obj] = nil
		end
	end
end

local function addHighlight(obj)
	if not obj or not obj.Parent then return end
	local folder = ensureESPFolder()
	if not folder then return end
	for _, cat in ipairs(ESPCategories) do
		if not cat.highlights[obj] then
			local valid = obj:IsA("Model") or (not cat.modelsOnly and obj:IsA("BasePart"))
			if valid then
				local matched = false
				local ok, res = pcall(function() return cat.match(obj) end)
				if ok and res then matched = true end
				local blocked = false
				if matched and cat.blacklist then
					local ok2, res2 = pcall(function() return cat.blacklist(obj) end)
					if ok2 and res2 then blocked = true end
				end
				if matched and not blocked then
					local h = Instance.new("Highlight")
					h.Name = "EC_HL"
					h.Adornee = obj
					h.FillColor = ESP.colors[cat.key] or cat.color
					h.FillTransparency = 0.5
					h.OutlineColor = Color3.new(1, 1, 1)
					h.OutlineTransparency = 0.1
					h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					h.Enabled = cat.enabled
					h.Parent = folder
					cat.highlights[obj] = h
				end
			end
		end
	end
end

local function setCategoryEnabled(key, state)
	ESP.on[key] = state == true
	for _, cat in ipairs(ESPCategories) do
		if cat.key == key then
			cat.enabled = state == true
			for _, h in pairs(cat.highlights) do
				h.Enabled = cat.enabled
			end
			break
		end
	end
	if anyESP() then
		if not ESP.hooked then
			ESP.hooked = true
			task.spawn(function()
				for _, obj in ipairs(Workspace:GetDescendants()) do
					pcall(addHighlight, obj)
				end
			end)
			Conn("espAdd", Workspace.DescendantAdded:Connect(function(obj)
				task.defer(function()
					pcall(addHighlight, obj)
				end)
			end))
			Conn("espRem", Workspace.DescendantRemoving:Connect(removeHighlight))
		end
		Loop("ESP", anyESP, function()
			for _, cat in ipairs(ESPCategories) do
				for obj, h in pairs(cat.highlights) do
					if not obj or not obj.Parent then
						pcall(function() h:Destroy() end)
						cat.highlights[obj] = nil
					else
						h.Enabled = cat.enabled
						h.FillColor = ESP.colors[cat.key] or cat.color
					end
				end
			end
		end, 1.5)
	else
		Stop("ESP")
		DisconnectKey("espAdd")
		DisconnectKey("espRem")
		ESP.hooked = false
		clearESP()
	end
end

local function startESPLoop()
	if not anyESP() then
		Stop("ESP")
		DisconnectKey("espAdd")
		DisconnectKey("espRem")
		ESP.hooked = false
		clearESP()
		return
	end
	for key, on in pairs(ESP.on) do
		if on then setCategoryEnabled(key, true) end
	end
end

local Farm = {
	on = false,
	state = "IDLE",
	status = "Idle",
	lastMach = 0,
	empty = 0,
	start = 0,
	floors = 0,
}

local FloorTrack = {
	passed = 0,
	startFloor = nil,
	lastFloorNum = nil,
	lastMap = "",
	exitCounted = false,
	current = nil,
}

local function setFarmStatus(s) Farm.status = s end

local function readFloorNumber()
	for _, attr in ipairs({ "Floor", "floor", "CurrentFloor", "FloorNumber", "Floors" }) do
		local v = Me:GetAttribute(attr)
		if typeof(v) == "number" then return math.floor(v) end
		if typeof(v) == "string" then
			local n = tonumber(v:match("%d+"))
			if n then return n end
		end
	end
	for _, name in ipairs({ "Floor", "CurrentFloor", "FloorNumber", "Floors" }) do
		local o = RS:FindFirstChild(name)
		if o then
			if o:IsA("IntValue") or o:IsA("NumberValue") then return math.floor(o.Value) end
			if o:IsA("StringValue") then
				local n = tonumber(tostring(o.Value):match("%d+"))
				if n then return n end
			end
		end
	end
	return nil
end

local function onMapMaybeChanged()
	local mapSv = RS:FindFirstChild("CurrentMap")
	local mapName = mapSv and tostring(mapSv.Value or "") or ""
	if mapName ~= "" and mapName ~= FloorTrack.lastMap then
		FloorTrack.lastMap = mapName
		FloorTrack.exitCounted = false
		local cur = readFloorNumber()
		FloorTrack.current = cur
		if typeof(cur) == "number" then
			if FloorTrack.startFloor == nil then FloorTrack.startFloor = cur end
			FloorTrack.lastFloorNum = cur
		end
	end
end

local function countFloorPass()
	onMapMaybeChanged()
	if FloorTrack.exitCounted then return false end
	local cur = readFloorNumber()
	FloorTrack.exitCounted = true
	FloorTrack.current = cur
	if typeof(cur) == "number" then
		if FloorTrack.startFloor == nil then FloorTrack.startFloor = cur end
		FloorTrack.lastFloorNum = cur
		FloorTrack.passed = math.max(0, cur - FloorTrack.startFloor)
	else
		FloorTrack.passed = FloorTrack.passed + 1
	end
	return true
end

local FarmCorey = { phase = 0, didOne = false }

local function pickMachine()
	local r = Root()
	if not r then return nil end
	local inCorey = isCoreyArea()
	if not inCorey then
		FarmCorey.phase = 0
		FarmCorey.didOne = false
	elseif FarmCorey.phase == 0 then
		FarmCorey.phase = 1
		FarmCorey.didOne = false
	end
	local best, bestD = nil, 1e9
	for _, m in ipairs(GetMachines()) do
		if not m.Done and m.Position and not isMachineFailed(m.Instance) then
			local allow = true
			if inCorey then
				if FarmCorey.phase == 1 and not FarmCorey.didOne then
					allow = (m.Type == "Arcade" or m.Type == "Storage")
				elseif FarmCorey.phase == 2 or (FarmCorey.phase == 1 and FarmCorey.didOne) then
					allow = m.Type == "Corey"
					FarmCorey.phase = 2
				end
			end
			if allow then
				local d = (m.Position - r.Position).Magnitude
				if d < bestD then bestD = d; best = m end
			end
		end
	end
	return best
end

local function farmDoMachine()
	if os.clock() - Farm.lastMach < Settings.machCd then return false end
	local m = pickMachine()
	if not m or not m.Front then
		Farm.empty = Farm.empty + 1
		return false
	end
	if CryptidNear(m.Front, Settings.safeDist, true) then
		setFarmStatus("Waiting Safe")
		if Util.autoEscape then goSafe() end
		return false
	end
	setFarmStatus("Going Machine")
	if not SafeTP(m.Front, m.Position, Settings.safeDist) then
		markMachineFail(m.Instance, 3)
		return false
	end
	Farm.lastMach = os.clock()
	task.wait(0.15)
	if CryptidNear(Root() and Root().Position or m.Front, 36, true) then
		setFarmStatus("Fleeing")
		if Util.autoEscape then goSafe() end
		return false
	end
	setFarmStatus("Completing")
	local target = m.Tagged or m.Instance
	FirePrompt(m.Instance)
	FireCompleteOne(target, m.Tag)
	task.wait(0.2)
	if not IsDone(m.Instance) and not IsDone(target) then
		FireCompleteOne(target, m.Tag)
		if not IsDone(m.Instance) then markMachineFail(m.Instance, 5) end
	end
	local completed = IsDone(m.Instance)
	if completed then
		Farm.empty = 0
		if isCoreyArea() and FarmCorey.phase == 1 and (m.Type == "Arcade" or m.Type == "Storage") then
			FarmCorey.didOne = true
			FarmCorey.phase = 2
		end
	else
		Farm.empty = Farm.empty + 1
	end
	return completed
end

local forceBring
forceBring = function(obj, dest)
	if not obj or not dest then return false end
	local root = machineRoot(obj) or obj
	local ok = false
	pcall(function()
		local target = Vector3.new(dest.X, dest.Y, dest.Z)
		if root:IsA("Model") then
			local delta = target - root:GetPivot().Position
			for _, d in ipairs(root:GetDescendants()) do
				if d:IsA("BasePart") then
					d.Anchored = true
					d.CanCollide = false
					d.CFrame = d.CFrame + delta
					d.AssemblyLinearVelocity = Vector3.zero
					d.AssemblyAngularVelocity = Vector3.zero
				end
			end
			root:PivotTo(CFrame.new(target))
			ok = true
		else
			local p = Part(root)
			if p then
				p.Anchored = true
				p.CanCollide = false
				p.CFrame = CFrame.new(target)
				p.AssemblyLinearVelocity = Vector3.zero
				p.AssemblyAngularVelocity = Vector3.zero
				ok = true
			end
		end
	end)
	return ok
end

local function bringOneMachine(m, safe)
	if not m or not m.Instance or not m.Instance.Parent or IsDone(m.Instance) then return false end
	refreshChar(Me.Character)
	if isCoreyArea() then
		if CryptidNear(m.Front, Settings.safeDist or 42, true) then return false end
		if not SafeTP(m.Front, m.Position, Settings.safeDist or 42) then
			markMachineFail(m.Instance, 3)
			return false
		end
		task.wait(0.15)
		for _ = 1, 8 do
			if not m.Instance or not m.Instance.Parent then break end
			if IsDone(m.Instance) then return true end
			FirePrompt(m.Instance)
			FireCompleteOne(m.Tagged or m.Instance, m.Tag)
			task.wait(0.25)
		end
		return m.Instance and m.Instance.Parent and IsDone(m.Instance) == true
	end
	local safePos = safe or getSafePos()
	if not safePos then return false end
	local r = Root()
	if not r then return false end
	if (r.Position - safePos).Magnitude > 14 then
		SafeTP(safePos, nil, 1)
		task.wait(0.12)
		r = Root()
		if not r then return false end
	end
	local bringDest = safePos + Vector3.new(0, 6, 4)
	forceBring(m.Instance, bringDest)
	task.wait(0.2)
	r = Root()
	if not r or not m.Instance or not m.Instance.Parent then return false end
	local mp = Part(m.Instance)
	if mp then
		local stand = mp.Position + Vector3.new(0, 4.5, 0)
		if (stand - safePos).Magnitude > 40 then stand = safePos + Vector3.new(0, 5, 2) end
		pcall(function()
			r.CFrame = CFrame.lookAt(stand, mp.Position)
			r.AssemblyLinearVelocity = Vector3.zero
		end)
	end
	task.wait(0.15)
	for _ = 1, 6 do
		if not m.Instance or not m.Instance.Parent then break end
		if IsDone(m.Instance) then return true end
		FirePrompt(m.Instance)
		FireCompleteOne(m.Tagged or m.Instance, m.Tag)
		task.wait(0.22)
	end
	return m.Instance and m.Instance.Parent and IsDone(m.Instance) == true
end

local function farmTick()
	if not Farm.on then
		Farm.state = "IDLE"
		return
	end
	if not Alive() then
		setFarmStatus("Dead")
		Farm.state = "WAIT"
		return
	end
	if isIntermission() then
		setFarmStatus("Intermission")
		Farm.state = "WAIT"
		if Hearts() <= 2 then
			local ev = Rem("CardVoteEvent")
			if ev then pcall(function() ev:FireServer("Heartplus") end) end
		end
		doAutoVote()
		return
	end

	local r = Root()
	if r and Util.autoEscape and CryptidNear(r.Position, 34, false) then
		setFarmStatus("Fleeing")
		goSafe()
		Farm.state = "WAIT"
		return
	end

	if Util.autoMach or Settings.farmType ~= "" then
		Farm.state = "MACHINE"
		local left = 0
		for _, m in ipairs(GetMachines()) do
			if not m.Done then left = left + 1 end
		end
		if left > 0 then
			if Settings.farmType == "Bring" then
				local m = pickMachine()
				if m then
					local safe = getSafePos()
					if bringOneMachine(m, safe) then return end
				end
			else
				if farmDoMachine() then return end
			end
			setFarmStatus("Waiting Safe")
			return
		end
	end

	if Util.autoExit then
		Farm.state = "EXIT"
		if exitReady or Farm.empty >= 3 then
			setFarmStatus("Going Exit")
			if doExit(exitReady) then
				countFloorPass()
				Farm.floors = FloorTrack.passed
				Farm.empty = 0
				setFarmStatus("Exit Done")
				if isCoreyArea() then
					FarmCorey.phase = 3
				else
					FarmCorey.phase = 0
					FarmCorey.didOne = false
				end
			else
				setFarmStatus("Waiting Exit")
			end
		else
			Farm.empty = Farm.empty + 1
			setFarmStatus("Machines Done")
		end
		return
	end

	Farm.state = "CHECK"
	setFarmStatus("Idle")
end

local CFG_FOLDER = "PinkBombs_Funhouse_CFGS"
local AUTOLOAD_FILE = CFG_FOLDER .. "/_autoload.ec"

local function cfgPath(name)
	return CFG_FOLDER .. "/" .. tostring(name) .. ".ec"
end

local function ensureCfgFolder()
	if isfolder and not isfolder(CFG_FOLDER) then
		pcall(function() makefolder(CFG_FOLDER) end)
	end
end

local function listConfigs()
	ensureCfgFolder()
	local out = {}
	pcall(function()
		if not listfiles then return end
		for _, path in ipairs(listfiles(CFG_FOLDER)) do
			local name = tostring(path):gsub("\\", "/"):match("([^/]+)%.ec$")
			if name and name ~= "_autoload" then table.insert(out, name) end
		end
	end)
	table.sort(out)
	if #out == 0 then table.insert(out, "default") end
	return out
end

local function readAutoLoad()
	local ok, raw = pcall(function() return readfile(AUTOLOAD_FILE) end)
	if not ok or not raw or raw == "" then return false, nil end
	local name = tostring(raw):match("^%s*(.-)%s*$")
	if not name or name == "" then return false, nil end
	return true, name
end

local function serializeSettings()
	return {
		ESP = { on = ESP.on, bl = ESP.bl, colors = ESP.colors },
		Settings = Settings,
		Util = {
			flySpeed = Util.flySpeed,
			tpwalkSpeed = Util.tpwalkSpeed,
			maxZoom = Util.maxZoom,
			minZoom = Util.minZoom,
			fov = Util.fov,
			runSpeed = Util.runSpeed,
		},
		Farm = { on = false },
	}
end

local function applyConfig(data)
	if type(data) ~= "table" then return end
	if data.Settings then
		for k, v in pairs(data.Settings) do
			if Settings[k] ~= nil then Settings[k] = v end
		end
	end
	if data.Util then
		for k, v in pairs(data.Util) do
			if Util[k] ~= nil then Util[k] = v end
		end
	end
	if data.ESP and data.ESP.on then
		for k, v in pairs(data.ESP.on) do
			if ESP.on[k] ~= nil then ESP.on[k] = v end
		end
	end
	if data.ESP and data.ESP.bl then
		for k, v in pairs(data.ESP.bl) do
			if ESP.bl[k] ~= nil then ESP.bl[k] = v end
		end
	end
end

local maskMode = "Off"
local savedNames = {}

local function applyMask()
	local pg = Me:FindFirstChildOfClass("PlayerGui")
	if not pg then return end
	local function handle(label, isSelf)
		if not label or not label:IsA("TextLabel") then return end
		if not savedNames[label] then savedNames[label] = label.Text end
		if maskMode == "Off" then
			label.Text = savedNames[label]
		elseif maskMode == "Hide" and isSelf then
			label.Text = ""
		elseif maskMode == "Self" and isSelf then
			label.Text = "???"
		elseif maskMode == "Everyone" then
			label.Text = "???"
		end
	end
	local function walk(node)
		for _, d in ipairs(node:GetDescendants()) do
			if d.Name == "Username" and d:IsA("TextLabel") then
				local self = false
				local cur = d
				for _ = 1, 6 do
					if not cur then break end
					local n = tostring(cur.Name)
					if n:find(tostring(Me.UserId), 1, true) or n:lower():find(Me.Name:lower(), 1, true) then
						self = true
						break
					end
					cur = cur.Parent
				end
				if tostring(savedNames[d] or d.Text) == Me.Name or d.Text == Me.DisplayName then
					self = true
				end
				handle(d, self)
			end
		end
	end
	local mt = pg:FindFirstChild("MemberTab")
	if mt then walk(mt) end
	local sp = pg:FindFirstChild("Spectate") or game:GetService("StarterGui"):FindFirstChild("Spectate")
	if sp then walk(sp) end
end

local Green  = Color3.fromHex("#10C550")
local Red    = Color3.fromHex("#EF4F1D")
local Orange = Color3.fromHex("#F97316")

local function SafeCreate(callback, title)
	local ok, err = pcall(callback)
	if not ok then warn("[FUNHOUSE SafeCreate]", title, err) end
	return ok
end

local Window = WindUI:CreateWindow({
	NewElements = true,
	Title = HUB_NAME,
	Icon = ASSETS.Icon,
	Folder = "PinkBombsFunhouse",
	Size = UDim2.fromOffset(IsMobile and 480 or 640, IsMobile and 480 or 520),
	MinSize = Vector2.new(IsMobile and 360 or 520, IsMobile and 320 or 360),
	MaxSize = Vector2.new(1100, 800),
	ToggleKey = Enum.KeyCode.LeftShift,
	Theme = "Dark",
	Resizable = true,
	SideBarWidth = IsMobile and 180 or 210,
	HideSearchBar = false,
	ScrollBarEnabled = true,
	OpenButton = {
		Title = HUB_NAME,
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
		Title = VERSION,
		Icon = "wrench",
		Color = Orange,
		Border = true,
	})
end)

local MainSection = Window:Section({ Title = "Main", Opened = true })
local FeaturesSection = Window:Section({ Title = "Features", Opened = true })
local SettingsSection = Window:Section({ Title = "Settings", Opened = true })

SafeCreate(function()
	local Tab = MainSection:Tab({
		Title = "Home",
		Icon = "home",
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
		Title = "Server !!",
		Desc = "Join our Discord Server!\nhttps://discord.gg/y3cHAw6Bb4",
		Image = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/IconServer.png",
		ImageSize = 48,
		Buttons = {
			{
				Title = "Copy Link Server",
				Icon = "copy",
				Callback = function()
					if type(setclipboard) == "function" then
						setclipboard("https://discord.gg/y3cHAw6Bb4")
					end
				end,
			},
		},
	})
end, "Home")

SafeCreate(function()
	local Tab = FeaturesSection:Tab({
		Title = "Visual",
		Icon = "eye",
	})

	local Gen = Tab:Section({ Title = "General", Opened = true })

	Gen:Toggle({
		Title = "Fullbright",
		Value = false,
		Callback = function(v)
			Util.fullbright = v
			if v then
				if not lightSnap then snapLighting() end
				Loop("FB", function() return Util.fullbright end, applyFullbright, 0.35)
			else
				Stop("FB")
				restoreLighting()
			end
		end,
	})

	Gen:Toggle({
		Title = "No-fog",
		Value = false,
		Callback = function(v)
			Util.nofog = v
			if v then
				if not lightSnap then snapLighting() end
				Loop("Fog", function() return Util.nofog end, applyNoFog, 0.35)
			else
				Stop("Fog")
				restoreFog()
			end
		end,
	})

	Gen:Toggle({
		Title = "Anti-lag",
		Value = false,
		Callback = function(v)
			Util.antilag = v
			if v then
				Loop("AntiLag", function() return Util.antilag end, function()
					pcall(function()
						settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
					end)
				end, 2)
			else
				Stop("AntiLag")
			end
		end,
	})

	Gen:Toggle({
		Title = "Disable rendering",
		Value = false,
		Callback = function(v)
			Util.noRender = v
			pcall(function()
				RunService:Set3dRenderingEnabled(not v)
			end)
		end,
	})

	Gen:Toggle({
		Title = "Unlock Camera",
		Value = false,
		Callback = function(v)
			Util.unlockCam = v
			if v then
				pcall(function()
					Me.CameraMinZoomDistance = Util.minZoom or 0.5
					Me.CameraMaxZoomDistance = Util.maxZoom or 128
					Me.CameraMode = Enum.CameraMode.Classic
				end)
			end
		end,
	})

	Gen:Toggle({
		Title = "Protect Usernames",
		Value = false,
		Callback = function(v)
			Util.protectNames = v
			maskMode = v and "Self" or "Off"
			if v then
				applyMask()
				Loop("Mask", function() return maskMode ~= "Off" end, applyMask, 1.5)
			else
				Stop("Mask")
				applyMask()
			end
		end,
	})

	Gen:Toggle({
		Title = "Field of View",
		Value = false,
		Callback = function(v)
			Util.fovOn = v
			if v then
				Loop("FOV", function() return Util.fovOn end, function()
					pcall(function()
						Workspace.CurrentCamera.FieldOfView = Util.fov or 70
					end)
				end, 0.2)
			else
				Stop("FOV")
				pcall(function() Workspace.CurrentCamera.FieldOfView = 70 end)
			end
		end,
	})

	Gen:Slider({
		Title = "Max camera zoom",
		Value = { Min = 10, Max = 500, Default = 128 },
		Step = 1,
		Callback = function(v)
			Util.maxZoom = tonumber(v) or 128
			if Util.unlockCam then
				pcall(function() Me.CameraMaxZoomDistance = Util.maxZoom end)
			end
		end,
	})

	Gen:Slider({
		Title = "Min camera zoom",
		Value = { Min = 0.5, Max = 20, Default = 0.5 },
		Step = 0.5,
		Callback = function(v)
			Util.minZoom = tonumber(v) or 0.5
			if Util.unlockCam then
				pcall(function() Me.CameraMinZoomDistance = Util.minZoom end)
			end
		end,
	})

	Tab:Space()
	Tab:Divider()

	local Vis = Tab:Section({ Title = "Visual", Opened = true })

	local function toggleESP(key, v)
		setCategoryEnabled(key, v == true)
	end

	Vis:Toggle({ Title = "Cryptids", Value = false, Callback = function(v) toggleESP("Cryptids", v) end })
	Vis:Toggle({ Title = "Outcast", Value = false, Callback = function(v) toggleESP("Outcast", v) end })
	Vis:Toggle({ Title = "Players", Value = false, Callback = function(v) toggleESP("Pals", v) end })
	Vis:Toggle({ Title = "Items", Value = false, Callback = function(v) toggleESP("Items", v) end })
	Vis:Toggle({ Title = "Machines", Value = false, Callback = function(v) toggleESP("Machines", v) end })

	Tab:Space()
	Tab:Divider()

	local Bl = Tab:Section({ Title = "Blacklist", Opened = true })

	local function selectedList(v)
		if type(v) == "table" then return v end
		if type(v) == "string" and v ~= "" then return { v } end
		return {}
	end

	Bl:Dropdown({
		Title = "Cryptids Blacklist",
		Values = { "Anton", "Manny", "Split", "Freddie", "Mabel", "Dusty", "Stargil" },
		Value = {},
		Multi = true,
		AllowNone = true,
		Callback = function(v)
			local set = {}
			for _, name in ipairs(selectedList(v)) do set[tostring(name)] = true end
			ESP.bl.Anton = set["Anton"] == true
			ESP.bl.Manny = set["Manny"] == true
			ESP.bl.Split = set["Split"] == true
			ESP.bl.Freddie = set["Freddie"] == true
			ESP.bl.Mabel = set["Mabel"] == true
			ESP.bl.Dusty = set["Dusty"] == true
			ESP.bl.Stargil = set["Stargil"] == true
		end,
	})

	Bl:Dropdown({
		Title = "Outcast Blacklist",
		Values = { "Snuggles", "Dolly", "Windy", "Fan", "Triplets", "Corey" },
		Value = {},
		Multi = true,
		AllowNone = true,
		Callback = function(v)
			local set = {}
			for _, name in ipairs(selectedList(v)) do set[tostring(name)] = true end
			ESP.bl.Snuggles = set["Snuggles"] == true
			ESP.bl.Dolly = set["Dolly"] == true
			ESP.bl.Windy = set["Windy"] == true
			ESP.bl.Fan = set["Fan"] == true
			ESP.bl.Triplets = set["Triplets"] == true
			ESP.bl.CoreyOutcast = set["Corey"] == true
		end,
	})

	Bl:Dropdown({
		Title = "Machines Blacklist",
		Values = { "Corey", "Storage", "Arcane" },
		Value = {},
		Multi = true,
		AllowNone = true,
		Callback = function(v)
			local set = {}
			for _, name in ipairs(selectedList(v)) do set[tostring(name)] = true end
			ESP.bl.Corey = set["Corey"] == true
			ESP.bl.Storage = set["Storage"] == true
			ESP.bl.Arcane = set["Arcane"] == true
		end,
	})

	Bl:Dropdown({
		Title = "Items Blacklist",
		Values = {
			"All Items", "Bananas", "Chomp-a-Chino", "Crazed Marshmallows", "Medkit",
			"Bandage", "Mystery Box", "Corndog", "Firework", "Flesh", "Funco", "Soup",
			"Noisy Clock", "Guide Detector", "Remnant", "Grappling", "Remote", "Patch",
		},
		Value = {},
		Multi = true,
		AllowNone = true,
		Callback = function(v)
			ESP.blItem = {}
			local set = {}
			for _, name in ipairs(selectedList(v)) do
				set[tostring(name)] = true
				ESP.blItem[string.lower(tostring(name))] = true
			end
			ESP.bl.Items = set["All Items"] == true
		end,
	})

	Tab:Space()
	Tab:Divider()

	local Cols = Tab:Section({ Title = "Colors", Opened = true })

	local function setEspColor(key, c)
		ESP.colors[key] = c
		for _, cat in ipairs(ESPCategories) do
			if cat.key == key then
				cat.color = c
				for _, h in pairs(cat.highlights) do
					h.FillColor = c
				end
				break
			end
		end
	end

	Cols:Colorpicker({
		Title = "Cryptids",
		Default = ESP.colors.Cryptids,
		Callback = function(c) setEspColor("Cryptids", c) end,
	})
	Cols:Colorpicker({
		Title = "Outcast",
		Default = ESP.colors.Outcast,
		Callback = function(c) setEspColor("Outcast", c) end,
	})
	Cols:Colorpicker({
		Title = "Pals",
		Default = ESP.colors.Pals,
		Callback = function(c) setEspColor("Pals", c) end,
	})
	Cols:Colorpicker({
		Title = "Items",
		Default = ESP.colors.Items,
		Callback = function(c) setEspColor("Items", c) end,
	})
	Cols:Colorpicker({
		Title = "Machines",
		Default = ESP.colors.Machines,
		Callback = function(c) setEspColor("Machines", c) end,
	})
end, "Visual")

SafeCreate(function()
	local Tab = FeaturesSection:Tab({
		Title = "Automatic",
		Icon = "zap",
	})

	local Gen = Tab:Section({ Title = "General", Opened = true })

	Gen:Toggle({
		Title = "Fly",
		Value = false,
		Callback = function(v) SetFly(v == true) end,
	})

	Gen:Toggle({
		Title = "Noclip",
		Value = false,
		Callback = function(v)
			Util.noclip = v
			if not v then
				Stop("Noclip")
				DisconnectKey("noclip")
				setNoclip(false)
				return
			end
			setNoclip(true)
			Conn("noclip", RunService.Heartbeat:Connect(function()
				if Util.noclip then setNoclip(true) end
			end))
			Conn("noclip", Me.CharacterAdded:Connect(function()
				task.wait(0.3)
				if Util.noclip then setNoclip(true) end
			end))
		end,
	})

	Gen:Toggle({
		Title = "TeleportWalk",
		Value = false,
		Callback = function(v)
			TW.on = v == true
			if not TW.on then stopTPWalk() return end
			startTPWalk()
		end,
	})

	Gen:Slider({
		Title = "TeleportWalk Speed",
		Value = { Min = 1, Max = 15, Default = 3 },
		Step = 0.5,
		Callback = function(v) TW.speed = math.clamp(tonumber(v) or 3, 1, 15) end,
	})

	Gen:Toggle({
		Title = "Anti-AFK",
		Value = false,
		Callback = function(v)
			Util.afk = v
			DisconnectKey("afk")
			if not v then return end
			Conn("afk", Me.Idled:Connect(function()
				pcall(function()
					VirtualUser:CaptureController()
					VirtualUser:ClickButton2(Vector2.new())
				end)
			end))
		end,
	})

	Gen:Toggle({
		Title = "Delete Collisions on Machine",
		Value = false,
		Callback = function(v)
			Util.deleteCollisions = v
			if v then
				Loop("DelCol", function() return Util.deleteCollisions end, function()
					for _, m in ipairs(GetMachines()) do
						if m.Instance then
							for _, d in ipairs(m.Instance:GetDescendants()) do
								if d:IsA("BasePart") then
									pcall(function() d.CanCollide = false end)
								end
							end
						end
					end
				end, 1.2)
			else
				Stop("DelCol")
			end
		end,
	})

	Gen:Toggle({
		Title = "Infinite Stamina",
		Value = false,
		Callback = function(v)
			Util.maxStam = v
			DisconnectKey("stamAttr")
			if not v then Stop("Stam") return end
			staminaTick()
			local c = Char()
			if c then
				for _, attr in ipairs({ "Stamina", "stamina", "CurrentStamina" }) do
					pcall(function()
						Conn("stamAttr", c:GetAttributeChangedSignal(attr):Connect(function()
							if Util.maxStam then staminaTick() end
						end))
					end)
				end
			end
			Conn("stamAttr", Me.CharacterAdded:Connect(function(ch)
				task.wait(0.3)
				if not Util.maxStam then return end
				staminaTick()
			end))
			Loop("Stam", function() return Util.maxStam end, staminaTick, 0.18)
		end,
	})

	Gen:Toggle({
		Title = "Always run",
		Value = false,
		Callback = function(v)
			Util.alwaysRun = v
			if v then
				Loop("Run", function() return Util.alwaysRun end, function()
					local h = Hum()
					if h then
						pcall(function()
							h.WalkSpeed = Util.runSpeed or 20
						end)
					end
				end, 0.2)
			else
				Stop("Run")
			end
		end,
	})

	Gen:Slider({
		Title = "Run Speed",
		Value = { Min = 16, Max = 50, Default = 20 },
		Step = 1,
		Callback = function(v) Util.runSpeed = tonumber(v) or 20 end,
	})

	Gen:Button({
		Title = "Instant Die",
		Callback = function() instantDie() end,
	})

	Gen:Toggle({
		Title = "No Busy Lock",
		Value = false,
		Callback = function(v)
			Util.noBusy = v
			if not v then Stop("Busy") return end
			Loop("Busy", function() return Util.noBusy end, busyTick, 0.15)
		end,
	})

	Gen:Dropdown({
		Title = "Auto Vote Card",
		Values = { "Off", "Heartplus", "Speed", "Stamina", "Damage" },
		Value = "Off",
		Callback = function(v)
			Util.autoVote = tostring(v or "Off")
		end,
	})

	Gen:Toggle({
		Title = "Auto Machines",
		Value = false,
		Callback = function(v) Util.autoMach = v end,
	})

	Gen:Toggle({
		Title = "Auto Exit",
		Value = false,
		Callback = function(v) Util.autoExit = v end,
	})

	Gen:Toggle({
		Title = "Auto Escape Cryptids",
		Value = false,
		Callback = function(v) Util.autoEscape = v end,
	})

	Tab:Space()
	Tab:Divider()

	local Mach = Tab:Section({ Title = "Machines", Opened = true })

	local acA, acS, acC = false, false, false

	Mach:Toggle({
		Title = "Instant Complete Arcane",
		Value = false,
		Callback = function(v)
			acA = v
			if not v then Stop("AC_A") return end
			Loop("AC_A", function() return acA end, function()
				CompleteRemoteOnly("ArcadeMachine")
			end, 0.45)
		end,
	})

	Mach:Toggle({
		Title = "Instant Complete Storage",
		Value = false,
		Callback = function(v)
			acS = v
			if not v then Stop("AC_S") return end
			Loop("AC_S", function() return acS end, function()
				CompleteRemoteOnly("StorageMachine")
			end, 0.4)
		end,
	})

	Mach:Toggle({
		Title = "Instant Complete Tree",
		Value = false,
		Callback = function(v)
			acC = v
			if not v then Stop("AC_C") return end
			Loop("AC_C", function() return acC end, function()
				CompleteRemoteOnly("CoreyMachine")
			end, 0.4)
		end,
	})

	Mach:Button({
		Title = "Instant Complete Arcane",
		Callback = function() CompleteRemoteOnly("ArcadeMachine") end,
	})
	Mach:Button({
		Title = "Instant Complete Storage",
		Callback = function() CompleteRemoteOnly("StorageMachine") end,
	})
	Mach:Button({
		Title = "Instant Complete Tree",
		Callback = function() CompleteRemoteOnly("CoreyMachine") end,
	})

	Tab:Space()
	Tab:Divider()

	local Deb = Tab:Section({ Title = "Debuffs", Opened = true })

	Deb:Toggle({
		Title = "Anti Rotten Banana",
		Value = false,
		Callback = function(v) setDebuff("RottenBanana", v) end,
	})
	Deb:Toggle({
		Title = "Anti Butter",
		Value = false,
		Callback = function(v) setDebuff("Butter", v) end,
	})
	Deb:Toggle({
		Title = "Anti Puddle",
		Value = false,
		Callback = function(v) setDebuff("Puddle", v) end,
	})

	Tab:Space()
	Tab:Divider()

	local Ent = Tab:Section({ Title = "Entities", Opened = true })

	Ent:Toggle({
		Title = "Immunity Snuggles",
		Value = false,
		Callback = function(v) setImmunity("Snuggles", v) end,
	})
	Ent:Toggle({
		Title = "Immunity Triplets",
		Value = false,
		Callback = function(v) setImmunity("Triplets", v) end,
	})
	Ent:Toggle({
		Title = "Immunity Dolly",
		Value = false,
		Callback = function(v) setImmunity("Dolly", v) end,
	})
	Ent:Toggle({
		Title = "Immunity Stargil",
		Value = false,
		Callback = function(v) setImmunity("StarGirl", v) end,
	})
end, "Automatic")

SafeCreate(function()
	local Tab = FeaturesSection:Tab({
		Title = "Auto-Farm",
		Icon = "gamepad-2",
	})

	local Gen = Tab:Section({ Title = "General", Opened = true })

	local stats = Gen:Paragraph({
		Title = "Farm Stats",
		Desc = "Runtime: 00:00:00\nCurrent Floor: ?\nFloors Passed: 0\nStatus: Idle",
	})

	local function refreshStats()
		if not stats or not stats.SetDesc then return end
		local rt = Farm.start > 0 and math.floor(os.clock() - Farm.start) or 0
		local h = math.floor(rt / 3600)
		local m = math.floor((rt % 3600) / 60)
		local s = rt % 60
		pcall(function()
			stats:SetDesc(string.format(
				"Runtime: %02d:%02d:%02d\nCurrent Floor: %s\nFloors Passed: %d\nState: %s\nStatus: %s",
				h, m, s, tostring(FloorTrack.current or "?"), FloorTrack.passed, Farm.state, Farm.status
			))
		end)
	end

	Gen:Toggle({
		Title = "Auto-Farm",
		Desc = "Full auto farm. Some rare maps may still act weird.",
		Value = false,
		Callback = function(v)
			Farm.on = v
			if not v then
				Stop("Farm")
				Farm.state = "IDLE"
				setFarmStatus("Idle")
				refreshStats()
				return
			end
			Farm.start = os.clock()
			Farm.floors = 0
			Farm.empty = 0
			FloorTrack.passed = 0
			FloorTrack.startFloor = readFloorNumber()
			FloorTrack.lastFloorNum = FloorTrack.startFloor
			FloorTrack.exitCounted = false
			FloorTrack.current = FloorTrack.startFloor
			FloorTrack.lastMap = ""
			onMapMaybeChanged()
			setFarmStatus("Starting")
			Loop("Farm", function() return Farm.on end, function()
				farmTick()
				refreshStats()
			end, function() return Settings.pace end)
		end,
	})

	Gen:Dropdown({
		Title = "Type",
		Values = { "Teleport", "Bring" },
		Value = "Teleport",
		Callback = function(v)
			Settings.farmType = tostring(v or "Teleport")
		end,
	})

	Gen:Toggle({
		Title = "Wall Check Cryptid",
		Value = true,
		Callback = function(v) Settings.wallCheck = v end,
	})

	Gen:Toggle({
		Title = "Check Cryptid",
		Value = true,
		Callback = function(v) Settings.checkCryptid = v end,
	})

	Tab:Space()
	Tab:Divider()

	local Set = Tab:Section({ Title = "Settings", Opened = true })

	Set:Slider({
		Title = "Delay MS",
		Value = { Min = 50, Max = 500, Default = 100 },
		Step = 10,
		Callback = function(v) Settings.delayMs = tonumber(v) or 100 end,
	})

	Set:Slider({
		Title = "Farm Speed",
		Value = { Min = 0.4, Max = 2.5, Default = 1.0 },
		Step = 0.1,
		Callback = function(v) Settings.pace = tonumber(v) or 1 end,
	})

	Set:Slider({
		Title = "Machine Delay",
		Value = { Min = 0.5, Max = 4, Default = 1.6 },
		Step = 0.1,
		Callback = function(v) Settings.machCd = tonumber(v) or 1.6 end,
	})

	Set:Slider({
		Title = "Exit Delay",
		Value = { Min = 1, Max = 5, Default = 2.2 },
		Step = 0.1,
		Callback = function(v) Settings.exitCd = tonumber(v) or 2.2 end,
	})

	Set:Slider({
		Title = "Cryptid Distance",
		Value = { Min = 24, Max = 90, Default = 52 },
		Step = 2,
		Callback = function(v) Settings.safeDist = tonumber(v) or 52 end,
	})

	Set:Slider({
		Title = "Distance Height",
		Value = { Min = 0, Max = 6, Default = 2.5 },
		Step = 0.5,
		Callback = function(v) Settings.exitY = tonumber(v) or 2.5 end,
	})
end, "Auto-Farm")

SafeCreate(function()
	local Tab = FeaturesSection:Tab({
		Title = "Keybinds",
		Icon = "keyboard",
	})

	local Kb = Tab:Section({ Title = "Keybinds", Opened = true })

	local function addKb(title, flag, defaultKey)
		Kb:Keybind({
			Title = title,
			Value = defaultKey or "None",
			Callback = function(key)
			end,
		})
	end

	Kb:Paragraph({ Title = "Visual", Desc = "Camera & rendering keybinds" })
	Kb:Toggle({ Title = "Disable rendering", Value = false, Callback = function(v)
		Util.noRender = v
		pcall(function() RunService:Set3dRenderingEnabled(not v) end)
	end })
	Kb:Toggle({ Title = "Unlock Camera", Value = false, Callback = function(v)
		Util.unlockCam = v
		if v then
			pcall(function()
				Me.CameraMinZoomDistance = Util.minZoom or 0.5
				Me.CameraMaxZoomDistance = Util.maxZoom or 128
				Me.CameraMode = Enum.CameraMode.Classic
			end)
		end
	end })
	Kb:Toggle({ Title = "Protect Usernames", Value = false, Callback = function(v)
		Util.protectNames = v
		maskMode = v and "Self" or "Off"
		if v then
			applyMask()
			Loop("Mask", function() return maskMode ~= "Off" end, applyMask, 1.5)
		else
			Stop("Mask")
			applyMask()
		end
	end })

	Tab:Space()
	Tab:Divider()

	Kb:Paragraph({ Title = "Movement", Desc = "Fly / Noclip / Walk" })
	Kb:Toggle({ Title = "Fly", Value = false, Callback = function(v) SetFly(v == true) end })
	Kb:Toggle({ Title = "Noclip", Value = false, Callback = function(v)
		Util.noclip = v
		if not v then
			Stop("Noclip")
			DisconnectKey("noclip")
			setNoclip(false)
			return
		end
		setNoclip(true)
		Conn("noclip", RunService.Heartbeat:Connect(function()
			if Util.noclip then setNoclip(true) end
		end))
	end })
	Kb:Toggle({ Title = "TeleportWalk", Value = false, Callback = function(v)
		TW.on = v == true
		if not TW.on then stopTPWalk() return end
		startTPWalk()
	end })
	Kb:Toggle({ Title = "Anti-AFK", Value = false, Callback = function(v)
		Util.afk = v
		DisconnectKey("afk")
		if not v then return end
		Conn("afk", Me.Idled:Connect(function()
			pcall(function()
				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new())
			end)
		end))
	end })
	Kb:Toggle({ Title = "Infinite Stamina", Value = false, Callback = function(v)
		Util.maxStam = v
		if not v then Stop("Stam") return end
		Loop("Stam", function() return Util.maxStam end, staminaTick, 0.18)
	end })
	Kb:Toggle({ Title = "Always Run", Value = false, Callback = function(v)
		Util.alwaysRun = v
		if v then
			Loop("Run", function() return Util.alwaysRun end, function()
				local h = Hum()
				if h then pcall(function() h.WalkSpeed = Util.runSpeed or 20 end) end
			end, 0.2)
		else
			Stop("Run")
		end
	end })
	Kb:Toggle({ Title = "Instant Die", Value = false, Callback = function(v)
		if v then instantDie() end
	end })
	Kb:Toggle({ Title = "No Busy Lock", Value = false, Callback = function(v)
		Util.noBusy = v
		if not v then Stop("Busy") return end
		Loop("Busy", function() return Util.noBusy end, busyTick, 0.15)
	end })

	Tab:Space()
	Tab:Divider()

	Kb:Paragraph({ Title = "Auto systems", Desc = "Farm & machines" })
	Kb:Toggle({ Title = "Auto Vote Card", Value = false, Callback = function(v)
		if v then doAutoVote() end
	end })
	Kb:Toggle({ Title = "Auto Machines", Value = false, Callback = function(v) Util.autoMach = v end })
	Kb:Toggle({ Title = "Auto Exit", Value = false, Callback = function(v) Util.autoExit = v end })
	Kb:Toggle({ Title = "Auto Escape Cryptids", Value = false, Callback = function(v) Util.autoEscape = v end })
	Kb:Toggle({ Title = "Instant Complete Arcane", Value = false, Callback = function(v)
		if v then
			Loop("AC_A_kb", function() return true end, function() CompleteRemoteOnly("ArcadeMachine") end, 0.45)
		else
			Stop("AC_A_kb")
		end
	end })
	Kb:Toggle({ Title = "Instant Complete Storage", Value = false, Callback = function(v)
		if v then
			Loop("AC_S_kb", function() return true end, function() CompleteRemoteOnly("StorageMachine") end, 0.4)
		else
			Stop("AC_S_kb")
		end
	end })
	Kb:Toggle({ Title = "Instant Complete Tree", Value = false, Callback = function(v)
		if v then
			Loop("AC_C_kb", function() return true end, function() CompleteRemoteOnly("CoreyMachine") end, 0.4)
		else
			Stop("AC_C_kb")
		end
	end })

	Tab:Space()
	Tab:Divider()

	Kb:Paragraph({ Title = "Immunity", Desc = "Entity immunity toggles" })
	Kb:Toggle({ Title = "Immunity Snuggles", Value = false, Callback = function(v) setImmunity("Snuggles", v) end })
	Kb:Toggle({ Title = "Immunity Triplets", Value = false, Callback = function(v) setImmunity("Triplets", v) end })
	Kb:Toggle({ Title = "Immunity Dolly", Value = false, Callback = function(v) setImmunity("Dolly", v) end })
	Kb:Toggle({ Title = "Immunity Stargil", Value = false, Callback = function(v) setImmunity("StarGirl", v) end })
	Kb:Toggle({ Title = "Auto-Farm", Value = false, Callback = function(v)
		Farm.on = v
		if not v then
			Stop("Farm")
			Farm.state = "IDLE"
			setFarmStatus("Idle")
			return
		end
		Farm.start = os.clock()
		FloorTrack.passed = 0
		FloorTrack.startFloor = readFloorNumber()
		FloorTrack.current = FloorTrack.startFloor
		setFarmStatus("Starting")
		Loop("Farm", function() return Farm.on end, farmTick, function() return Settings.pace end)
	end })
end, "Keybinds")

SafeCreate(function()
	local Tab = SettingsSection:Tab({
		Title = "Settings",
		Icon = "settings",
	})

	local Saves = Tab:Section({ Title = "Saves", Opened = true })

	local cfgName = "default"
	local cfgList = listConfigs()
	local autoLoadOn = false
	local okA, nameA = readAutoLoad()
	if okA and nameA then
		autoLoadOn = true
		cfgName = nameA
	end

	Saves:Input({
		Title = "Name",
		Value = cfgName,
		Placeholder = "Config name...",
		Callback = function(v) cfgName = tostring(v or "default") end,
	})

	local drop = Saves:Dropdown({
		Title = "File",
		Values = cfgList,
		Value = cfgName,
		Callback = function(v)
			if type(v) == "string" and v ~= "" then cfgName = v end
		end,
	})

	Saves:Button({
		Title = "Save",
		Callback = function()
			ensureCfgFolder()
			local data = serializeSettings()
			local ok = pcall(function()
				writefile(cfgPath(cfgName), HttpService:JSONEncode(data))
			end)
			if autoLoadOn then
				pcall(function() writefile(AUTOLOAD_FILE, cfgName) end)
			end
			Ping("Config", ok and "Saved." or "Save failed.", 2)
		end,
	})

	Saves:Button({
		Title = "Load",
		Callback = function()
			local ok, raw = pcall(function() return readfile(cfgPath(cfgName)) end)
			if not ok or not raw then
				Ping("Config", "Not found.", 2)
				return
			end
			local ok2, data = pcall(function() return HttpService:JSONDecode(raw) end)
			if ok2 and data then
				applyConfig(data)
				Ping("Config", "Loaded.", 2)
			else
				Ping("Config", "Corrupt config ignored.", 2)
			end
		end,
	})

	Saves:Button({
		Title = "Delete",
		Callback = function()
			pcall(function() delfile(cfgPath(cfgName)) end)
			Ping("Config", "Deleted.", 2)
		end,
	})

	Tab:Space()
	Tab:Divider()

	local UI = Tab:Section({ Title = "UI", Opened = true })

	UI:Dropdown({
		Title = "UI Color",
		Values = {
			"Dark", "Light", "Rose", "Plant", "Indigo",
			"Sky", "Violet", "Amber",
		},
		Value = "Dark",
		Callback = function(theme)
			pcall(function() WindUI:SetTheme(theme) end)
		end,
	})
end, "Settings")

task.defer(function()
	local ok, name = readAutoLoad()
	if not ok or not name then return end
	local ok2, raw = pcall(function() return readfile(cfgPath(name)) end)
	if not ok2 or not raw then return end
	local ok3, data = pcall(function() return HttpService:JSONDecode(raw) end)
	if ok3 and data then
		applyConfig(data)
		Ping("Config", "Auto-loaded " .. tostring(name), 2)
	end
end)

pcall(function()
	if Window and Window.OnClose then
		Window.OnClose = function()
			StopAllLoops()
			DisconnectAll()
			clearESP()
			stopFly()
			setNoclip(false)
			stopDebuffWatch()
			stopImmunityObservers()
		end
	end
end)

pcall(function()
	if type(Window.SelectTab) == "function" then
		Window:SelectTab(1)
	end
end)

Ping("Pink bomb's", "v" .. VERSION .. " ready", 2)
