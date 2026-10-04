

local VERSION = "2.1.9"
if not table.clear then
	function table.clear(t)
		for k in pairs(t) do t[k] = nil end
	end
end
local HUB_NAME = "Funhouse | SW"

local ASSETS = {
	Icon = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/Bomb.png",
	Error = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/Error.png",
	Notify = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/Notify.png",
}

local function errLog(...)
end

local function safeCall(name, fn)
	local ok, err = pcall(fn)
	return ok, err
end


local WindUI
local loadFails = {}

local function toast(msg, ok)
	pcall(function()
		if WindUI and type(WindUI.Notify) == "function" then
			WindUI:Notify({
				Title = ok and HUB_NAME or HUB_NAME .. " Error",
				Content = tostring(msg),
				Duration = ok and 2 or 6,
				Icon = ok and ASSETS.Notify or ASSETS.Error,
			})
		end
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


local cref = (type(cloneref) == "function" and cloneref) or function(x) return x end
local UIS = cref(game:GetService("UserInputService"))
local GuiService = cref(game:GetService("GuiService"))
local RS = cref(game:GetService("ReplicatedStorage"))
local CS = cref(game:GetService("CollectionService"))
local Players = cref(game:GetService("Players"))
local RunService = cref(game:GetService("RunService"))
local Workspace = cref(game:GetService("Workspace"))
local Lighting = cref(game:GetService("Lighting"))
local VirtualUser = cref(game:GetService("VirtualUser"))

local Me = Players.LocalPlayer
if not Me then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	Me = Players.LocalPlayer
end

local OnPhone = UIS.TouchEnabled and not UIS.KeyboardEnabled
local OnTV = GuiService:IsTenFootInterface()
if OnPhone and WindUI.SetNotificationLower then
	pcall(function() WindUI:SetNotificationLower(true) end)
end


local Loops = {}
local Conns = {}
local ConnGroups = {}

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

local function Stop(key)
	Loops[key] = nil
end

local function StopAllLoops()
	for k in pairs(Loops) do Loops[k] = nil end
end

local Managers = { Loops = {} }
Managers.Loops.Start = Loop
Managers.Loops.Stop = Stop
Managers.Loops.StopAll = StopAllLoops
Managers.Loops.IsRunning = function(key) return Loops[key] == true end
Managers.Loops.Active = function() local n = 0; for _ in pairs(Loops) do n += 1 end; return n end

local function Conn(key, connection)
	if not connection then return end
	Conns[key] = Conns[key] or {}
	table.insert(Conns[key], connection)
	return connection
end

local function DisconnectKey(key)
	local list = Conns[key]
	if not list then return end
	for _, c in ipairs(list) do
		pcall(function() c:Disconnect() end)
	end
	Conns[key] = nil
end

local function DisconnectAll()
	for k in pairs(Conns) do
		DisconnectKey(k)
	end
end


local CharState = {
	Character = nil,
	Humanoid = nil,
	Root = nil,
}

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
	local n = CharName()
	return n:find(name, 1, true) ~= nil
end


local remCache = {}
local function Rem(name)
	if not name then return nil end
	local cached = remCache[name]
	if cached and cached.Parent then return cached end
	local function okRemote(r)
		return r and (r:IsA("RemoteEvent") or r:IsA("RemoteFunction"))
	end
	local r = RS:FindFirstChild(name)
	if okRemote(r) then
		remCache[name] = r
		return r
	end
	r = RS:FindFirstChild(name, true)
	if okRemote(r) then
		remCache[name] = r
		return r
	end
	for _, d in ipairs(RS:GetDescendants()) do
		if d.Name == name and okRemote(d) then
			remCache[name] = d
			return d
		end
	end
	return nil
end

local function RemAny(names)
	for _, n in ipairs(names) do
		local r = Rem(n)
		if r then return r, n end
	end
	return nil, nil
end

local function Part(x)
	if not x then return nil end
	if x:IsA("BasePart") then return x end
	if x:IsA("Model") then
		if x.PrimaryPart then return x.PrimaryPart end
		return x:FindFirstChild("HumanoidRootPart")
			or x:FindFirstChildWhichIsA("BasePart", true)
	end
	return x:FindFirstChildWhichIsA("BasePart", true)
end

local function IsPlayerChar(m)
	if not m then return false end
	local pl = Players:GetPlayerFromCharacter(m)
	if pl then return true end
	if m:IsA("Model") and m:FindFirstChildOfClass("Humanoid") and Players:GetPlayerFromCharacter(m) then
		return true
	end
	return false
end

local function IsDone(obj)
	if not obj then return true end
	local function check(o)
		if not o then return false end
		if o:GetAttribute("Used") == true then return true end
		local a = o:GetAttribute("Activated")
		if a == 1 or a == true then return true end
		local d = o:GetAttribute("Completed") or o:GetAttribute("Done")
		if d == true or d == 1 then return true end
		local prog = tonumber(o:GetAttribute("Progress"))
		local need = tonumber(o:GetAttribute("HowMuch"))
		if prog and need and need > 0 and prog >= need then return true end
		return false
	end
	if check(obj) then return true end
	local root = obj
	pcall(function()
		local p = obj.Parent
		if p and p:IsA("Model") then root = p end
	end)
	if root ~= obj and check(root) then return true end
	return false
end

local function isSanePos(pos, maxMag)
	if typeof(pos) ~= "Vector3" then return false end
	if pos ~= pos then return false end
	local lim = maxMag or 8000
	return math.abs(pos.X) < lim and math.abs(pos.Y) < lim and math.abs(pos.Z) < lim
end

local function Ping(title, content, dur)
	pcall(function()
		if WindUI and type(WindUI.Notify) == "function" then
			WindUI:Notify({ Title = title, Content = content, Duration = dur or 3, Icon = ASSETS.Notify })
		end
	end)
end
local Notify = Ping


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
	if not (n:find("manny", 1, true) or n:find("cryptidmanny", 1, true)) then
		return false
	end
	local awake = false
	local wander = false
	pcall(function()
		local hum = m:FindFirstChildOfClass("Humanoid")
		local anim = hum and hum:FindFirstChildOfClass("Animator")
		if not anim then return end
		for _, t in ipairs(anim:GetPlayingAnimationTracks()) do
			local id = ""
			pcall(function()
				id = tostring(t.Animation and t.Animation.AnimationId or "")
			end)
			local low = string.lower(id)
			if low:find("awakening", 1, true) or low:find("100596") == nil and low:find("awaken", 1, true) then

			end
			if low:find("awakening", 1, true) then awake = true end
			if low:find(MANNY_WANDER, 1, true) or low:find("wandering", 1, true) then
				wander = true
			end
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
	local cd = OnPhone and 2.0 or 1.4
	if not force and now - cryptidCacheAt < cd then return end
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
			for _, o in ipairs(CS:GetTagged(tag)) do
				add(o)
			end
		end
	end)
	local maxDepth = OnPhone and 1 or 2
	local function walk(root, depth)
		if depth > maxDepth or not root then return end
		for _, c in ipairs(root:GetChildren()) do
			add(c)
			if c:IsA("Model") or c:IsA("Folder") then
				walk(c, depth + 1)
			end
		end
	end
	for _, o in ipairs(Workspace:GetChildren()) do
		add(o)
		walk(o, 1)
	end
end

local function CryptidNear(pos, rad, force)
	if Settings.checkCryptid == false then return false end
	if not pos then return false end
	rad = (rad or 56) + 4
	refreshCryptids(force == true)
	local me = Char()
	if me and me:GetAttribute("Chased") == true then
		rad = rad * 1.35
	end
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

local function machineRoot(o)
	if not o then return nil end
	local cur, best = o, o:IsA("Model") and o or nil
	while cur and cur ~= Workspace do
		if cur:IsA("Model") then
			local low = string.lower(cur.Name)
			if low:find("arcade", 1, true) or low:find("arcane", 1, true)
				or low:find("storage", 1, true) or low:find("corey", 1, true) then
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
	if low:find("corey", 1, true) then return "Corey" end
	return n:gsub("%d+$", "")
end

local machineScanCache = nil
local machineScanCacheAt = 0
local machineScanBusy = false

local function GetMachines()
	local now = os.clock()
	if machineScanCache and now - machineScanCacheAt < 0.9 then
		return machineScanCache
	end
	if machineScanBusy then
		return machineScanCache or {}
	end
	machineScanBusy = true

	local out = {}
	local seen = {}
	local seenPos = {}
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
	pcall(function()
		for _, o in ipairs(CS:GetTagged("ArcadeMachine")) do push("ArcadeMachine", "Arcade", o) end
		for _, o in ipairs(CS:GetTagged("StorageMachine")) do push("StorageMachine", "Storage", o) end
		for _, o in ipairs(CS:GetTagged("CoreyMachine")) do push("CoreyMachine", "Corey", o) end
	end)
	local hasA, hasS, hasC = false, false, false
	for _, m in ipairs(out) do
		if m.Type == "Arcade" then hasA = true end
		if m.Type == "Storage" then hasS = true end
		if m.Type == "Corey" then hasC = true end
	end
	if not (hasA and hasS and hasC) then
		local function walk(node, depth)
			if depth > 6 or not node then return end
			for _, c in ipairs(node:GetChildren()) do
				if c:IsA("Model") then
					local low = string.lower(c.Name)
					if not hasC and (low:find("coreymachine", 1, true)
						or (low:find("corey", 1, true) and low:find("machine", 1, true))) then
						push("CoreyMachine", "Corey", c)
					elseif not hasA and (low:find("arcademachine", 1, true)
						or low:find("arcanemachine", 1, true)
						or (low:find("arcane", 1, true) and not low:find("spawn", 1, true))) then
						if low:find("machine", 1, true) or low == "arcane" or low:find("arcade", 1, true) then
							push("ArcadeMachine", "Arcade", c)
						end
					elseif not hasS and low:find("storage", 1, true) then
						push("StorageMachine", "Storage", c)
					end
				end
				if c:IsA("Folder") or c:IsA("Model") then
					walk(c, depth + 1)
				end
			end
		end
		pcall(function() walk(Workspace, 0) end)
	end
	machineScanBusy = false
	machineScanCache = out
	machineScanCacheAt = os.clock()
	return out
end

local MachineManager = { CacheTime = 0.35 }
function MachineManager.Get() return GetMachines() end
function MachineManager.Clear() machineScanCache, machineScanCacheAt = nil, 0 end
Managers.Machines = MachineManager

local function markMachineFail(obj, sec)
	if obj then machineFail[obj] = os.clock() + (sec or 4) end
end

local function isMachineFailed(obj)
	local t = machineFail[obj]
	return t and os.clock() < t
end


local Settings = {
	wallCheck = true,
	safeDist = 52,
	exitCd = 2.2,
	exitY = 2.5,
	machCd = 1.6,
	pace = 1.0,
	lootCd = 1.2,
	checkCryptid = true,
	delayMs = 0,
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
	if Settings.wallCheck then
		local near = CryptidNear(pos, rad, true)
		if near then
			return false
		end
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


local function remoteForMachineTag(tag)
	if tag == "ArcadeMachine" then
		local r = Rem("ArcadeMachineUse") or Rem("ArcadeUse") or Rem("ArcaneMachineUse")
		if r then return r end
	else
		local r = Rem("StorageMachineUse") or Rem("StorageUse") or Rem("CoreyMachineUse")
		if r then return r end
	end
	local want = tag == "ArcadeMachine" and "arcade" or "storage"
	local found
	pcall(function()
		for _, d in ipairs(RS:GetDescendants()) do
			if d:IsA("RemoteEvent") then
				local n = string.lower(d.Name)
				if n:find("use", 1, true) then
					if want == "arcade" and (n:find("arcade", 1, true) or n:find("arcane", 1, true)) then
						found = d
						break
					end
					if want == "storage" and (n:find("storage", 1, true) or n:find("corey", 1, true)) then
						found = d
						break
					end
				end
			end
		end
	end)
	return found
end

local function CompleteRemoteOnly(tag)
	local rem = remoteForMachineTag(tag)
	if not rem then return end
	local fired = {}
	local function fire(m)
		if not m or not m.Parent or fired[m] then return end
		fired[m] = true
		pcall(function() rem:FireServer(m, "complete") end)
	end
	pcall(function()
		for _, m in ipairs(CS:GetTagged(tag)) do
			fire(m)
		end
	end)
	MachineManager.Clear()
	for _, m in ipairs(GetMachines()) do
		local match = (m.Tag == tag)
			or (tag == "ArcadeMachine" and m.Type == "Arcade")
			or (tag == "StorageMachine" and m.Type == "Storage")
			or (tag == "CoreyMachine" and m.Type == "Corey")
		if match then
			fire(m.Tagged)
			fire(m.Instance)
		end
	end
end

local function FireCompleteOne(obj, tag)
	if not obj or not obj.Parent then return end
	local rem = remoteForMachineTag(tag or "StorageMachine")
	if not rem then return end
	pcall(function() rem:FireServer(obj, "complete") end)
	local root = machineRoot(obj)
	if root and root ~= obj and root.Parent then
		pcall(function() rem:FireServer(root, "complete") end)
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


local lastInvFullWarn = 0
local function warnInvFull()
	if os.clock() - lastInvFullWarn < 4 then return end
	lastInvFullWarn = os.clock()
	Ping("Inventory", "Inventory is full.", 2)
end

local function invFull()
	local c = Char()
	if not c then return false end
	local filled = 0
	for i = 1, 3 do
		local v = c:GetAttribute("Inv" .. i)
		if v and tostring(v) ~= "" then filled = filled + 1 end
	end
	return filled >= 3
end


local function isRemnantOrFlesh(o)
	if not o or not o.Parent then return false end
	local low = string.lower(o.Name or "")
	if low:find("fleshtrap", 1, true) then return false end
	if low:find("remnant", 1, true) or low:find("remmant", 1, true) or low:find("remant", 1, true) then
		return true
	end
	if low:find("flesh", 1, true) and not low:find("trap", 1, true) then
		return true
	end
	return false
end

local function collectLootTargets()
	local list = {}
	local seen = {}
	local function add(o)
		if not o or seen[o] or not isRemnantOrFlesh(o) then return end
		local p = Part(o)
		if not p or p.Transparency >= 0.95 then return end
		seen[o] = true
		table.insert(list, o)
	end
	pcall(function()
		for _, tag in ipairs({ "Spawneditem", "SpawnedItem" }) do
			for _, o in ipairs(CS:GetTagged(tag)) do
				add(o)
			end
		end
	end)
	for _, o in ipairs(Workspace:GetChildren()) do
		add(o)
	end
	return list
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
	if savedExitPart and savedExitPart.Parent then
		return savedExitPart
	end
	local function hasTouch(o)
		if not o then return false end
		if o:FindFirstChild("TouchInterest") then return true end
		local ok = false
		pcall(function()
			for _, d in ipairs(o:GetDescendants()) do
				if d:IsA("TouchTransmitter") or d.Name == "TouchInterest" then
					ok = true
					break
				end
			end
		end)
		return ok
	end
	local bestTouch, bestAny
	local function consider(c)
		local low = string.lower(c.Name)
		if not (low:find("roundender", 1, true) or low == "exit" or low:find("escape", 1, true) or low:find("ender", 1, true)) then
			return
		end
		local p = Part(c)
		if not p then return end
		if hasTouch(c) then
			bestTouch = bestTouch or p
		else
			bestAny = bestAny or p
		end
	end
	local function scan(root, depth)
		if depth > 7 or not root then return end
		for _, c in ipairs(root:GetChildren()) do
			consider(c)
			if c:IsA("Model") or c:IsA("Folder") then
				scan(c, depth + 1)
			end
		end
	end
	for _, name in ipairs({ "PartyRoom", "CaveMap", "CurrentMap", "Map" }) do
		local f = Workspace:FindFirstChild(name)
		if f then scan(f, 1) end
	end
	if not bestTouch and not bestAny then
		scan(Workspace, 1)
	end
	return bestTouch or bestAny
end

local function doExit(force)
	if not force and os.clock() - lastExitTry < Settings.exitCd then
		return false
	end
	if not force and os.clock() < fleeLockUntil then
		return false
	end
	lastExitTry = os.clock()
	local part = findExitPart()
	if not part then
		return false
	end
	local p = Part(part) or part
	if not p or not p:IsA("BasePart") then return false end
	local dest = p.Position + Vector3.new(0, Settings.exitY, 0)
	if not force and Settings.wallCheck and CryptidNear(dest, 40, true) then
		return false
	end
	if SafeTP(dest, nil, force and 1 or 40) then
		exitReady = false
		savedExitPart = p
		return true
	end
	pcall(function()
		local r = Root()
		if r then
			r.CFrame = CFrame.new(dest)
			r.AssemblyLinearVelocity = Vector3.zero
		end
	end)
	exitReady = false
	return true
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
					if okDist then
						return p.Position + Vector3.new(0, 3, 0)
					end
				end
			end
		end
	end
	return nil
end

local function goSafe()
	if isIntermission() then
		return false
	end
	local pos = getSafePos()
	if not pos then
		return false
	end
	fleeLockUntil = os.clock() + 0.9
	local ok = SafeTP(pos, nil, 1)
	return ok
end

local function isIntermission()
	local mapSv = RS:FindFirstChild("CurrentMap")
	local mapName = mapSv and string.lower(tostring(mapSv.Value or "")) or ""
	if mapName:find("tutorial", 1, true) then return false end
	if mapName:find("intermission", 1, true) or mapName:find("waiting", 1, true) then
		return true
	end
	local area = RS:FindFirstChild("Area")
	if area then
		local a = string.lower(tostring(area.Value or ""))
		if a:find("intermission", 1, true) or a:find("waiting", 1, true) then
			return true
		end
		if a:find("tutorial", 1, true) then return false end
	end
	return false
end

local function isCoreyArea()
	local mapSv = RS:FindFirstChild("CurrentMap")
	local mapName = mapSv and string.lower(tostring(mapSv.Value or "")) or ""
	local area = RS:FindFirstChild("Area")
	local a = area and string.lower(tostring(area.Value or "")) or ""
	if mapName:find("corey", 1, true) or a:find("corey", 1, true) then
		return true
	end
	local gs = RS:FindFirstChild("Gamestate")
	if gs then
		local g = string.lower(tostring(gs.Value or ""))
		if g:find("corey", 1, true) then return true end
	end
	return false
end

local FloorSession = {
	mode = nil,
	cryptids = {},
	items = {},
}

local FarmLogs = {
	keys = {},
	byKey = {},
	uiDrop = nil,
	uiPara = nil,
	uiList = nil,
	selected = nil,
	seq = 0,
}

local function prettyCryptidLogName(o)
	if not o then return nil end
	local n = tostring(o.Name or "")
	local low = string.lower(n)
	if low:find("spawn", 1, true) or low:find("spawner", 1, true) then return nil end
	if low == "fan" then return "Fan" end
	if low:find("stargil", 1, true) then return "Stargil" end
	if low:find("anton", 1, true) then return "Anton" end
	if low:find("mabel", 1, true) then return "Mabel" end
	if low:find("manny", 1, true) then return "Manny" end
	if low:find("split", 1, true) then return "Split" end
	if low:find("freddie", 1, true) then return "Freddie" end
	if low:find("dusty", 1, true) then return "Dusty" end
	if low:find("corey", 1, true) then return "Corey" end
	return n
end

local function sessionNoteCryptids()
	pcall(function()
		refreshCryptids(false)
		for _, o in ipairs(cryptidCache) do
			local name = prettyCryptidLogName(o)
			if name then FloorSession.cryptids[name] = true end
		end
	end)
end

local function sessionNoteItems()
	pcall(function()
		local function scan(node, depth)
			if depth > 5 or not node then return end
			local tagged = false
			pcall(function()
				tagged = CS:HasTag(node, "Spawneditem") or CS:HasTag(node, "SpawnedItem")
			end)
			local low = string.lower(tostring(node.Name or ""))
			if tagged then
				if not low:find("fleshtrap", 1, true) and not low:find("rotten", 1, true) then
					local label = tostring(node.Name)
					if #label > 0 then FloorSession.items[label] = true end
				end
			end
			if node:IsA("Model") or node:IsA("Folder") then
				for _, c in ipairs(node:GetChildren()) do
					scan(c, depth + 1)
				end
			end
		end
		for _, o in ipairs(Workspace:GetChildren()) do
			scan(o, 1)
		end
	end)
end

local function sessionReset(mode)
	FloorSession.mode = mode
	FloorSession.cryptids = {}
	FloorSession.items = {}
end

local function sessionKeysSorted(map)
	local list = {}
	for k in pairs(map) do table.insert(list, k) end
	table.sort(list)
	return list
end

local function commitFloorLog(_)
end

local FloorTrack = {
	passed = 0,
	startFloor = nil,
	lastFloorNum = nil,
	lastMap = "",
	exitCounted = false,
	current = nil,
}

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
	local c = Char()
	if c then
		for _, attr in ipairs({ "Floor", "floor", "CurrentFloor" }) do
			local v = c:GetAttribute(attr)
			if typeof(v) == "number" then return math.floor(v) end
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
			if FloorTrack.startFloor == nil then
				FloorTrack.startFloor = cur
			end
			FloorTrack.lastFloorNum = cur
		end

	end
end

local function countFloorPass()
	onMapMaybeChanged()
	if FloorTrack.exitCounted then
		return false
	end

	local cur = readFloorNumber()
	FloorTrack.exitCounted = true
	FloorTrack.current = cur

	if typeof(cur) == "number" then
		if FloorTrack.startFloor == nil then
			FloorTrack.startFloor = cur
		end

		FloorTrack.lastFloorNum = cur
		FloorTrack.passed = math.max(0, cur - FloorTrack.startFloor)
	else

		FloorTrack.passed = FloorTrack.passed + 1
	end

	return true
end

pcall(function()
	local mapSv = RS:FindFirstChild("CurrentMap")
	if mapSv then
		local lastPlayMap = tostring(mapSv.Value or "")
		Conn("floorMap", mapSv:GetPropertyChangedSignal("Value"):Connect(function()
			local prev = lastPlayMap
			lastPlayMap = tostring(mapSv.Value or "")
			onMapMaybeChanged()
			local wasPlay = prev ~= "" and not string.lower(prev):find("wait", 1, true) and not string.lower(prev):find("intermission", 1, true)
			if wasPlay and isIntermission() then
				if Farm.on then
					commitFloorLog("Auto-Farm")
				elseif Bring.on then
					commitFloorLog("Bring")
				end
			end
		end))
	end
end)


local Farm = {
	on = false,
	state = "IDLE",
	doMach = false,
	doExit = false,
	doSafe = false,
	doArc = true,
	doSto = true,
	doCor = true,
	doLoot = false,
	floors = 0,
	start = 0,
	status = "Idle",
	lastMach = 0,
	empty = 0,
	camLock = false,
}

local function setFarmStatus(s)
	Farm.status = s
end

local forceBring

local function itemBlacklisted(o)
	if not o then return true end
	local low = string.lower(o.Name or "")
	return low:find("fleshtrap", 1, true) and true or false
end

local function isBringItem(o)
	if not o or not o.Parent then return false end
	local low = string.lower(tostring(o.Name or ""))
	if low == "" or low:find("fleshtrap", 1, true) or low:find("rottenbanana", 1, true) then return false end
	if low:find("rotten", 1, true) and low:find("banana", 1, true) then return false end
	if low:find("banana", 1, true) or low:find("chomp", 1, true) or low:find("crazed", 1, true)
		or low:find("mystery", 1, true) or low:find("corndog", 1, true) or low:find("medkit", 1, true)
		or low:find("bandage", 1, true) or low:find("remote", 1, true) or low:find("clock", 1, true)
		or low:find("soup", 1, true) or low:find("funco", 1, true) or low:find("remnant", 1, true)
		or low:find("flesh", 1, true) then return true end
	local tagged = false
	pcall(function() tagged = CS:HasTag(o, "Spawneditem") or CS:HasTag(o, "SpawnedItem") end)
	return tagged
end

local function bringItemOnce(safe)
	if invFull() then warnInvFull() return false end
	local r = Root()
	if not r then return false end
	local best, bestD
	local seen = {}
	local function consider(o)
		if not o or seen[o] or not isBringItem(o) then return end
		seen[o] = true
		local p = Part(o)
		if not p or p.Transparency >= 0.95 then return end
		local d = (p.Position - r.Position).Magnitude
		if d <= 300 and (not bestD or d < bestD) and not CryptidNear(p.Position, 24, false) then
			best, bestD = o, d
		end
	end
	pcall(function()
		for _, tag in ipairs({ "Spawneditem", "SpawnedItem" }) do
			for _, o in ipairs(CS:GetTagged(tag)) do consider(o) end
		end
	end)
	for _, o in ipairs(Workspace:GetChildren()) do consider(o) end
	if not best then return false end
	local safePos = safe or getSafePos()
	if not safePos then return false end
	if not forceBring(best, safePos + Vector3.new(0, 2.5, 3)) then return false end
	task.wait(0.12)
	FirePrompt(best)
	task.wait(0.08)
	if best.Parent then FirePrompt(best) end
	return true
end

local function farmLootOnce()
	if not Farm.doLoot then return false end
	if invFull() then
		warnInvFull()
		return false
	end
	local r = Root()
	if not r then return false end
	local best, bestD = nil, 250
	for _, o in ipairs(collectLootTargets()) do
		if not itemBlacklisted(o) then
			local p = Part(o)
			if p and p.Transparency < 0.95 then
				local d = (p.Position - r.Position).Magnitude
				if d < bestD and not CryptidNear(p.Position, 24, false) then
					bestD = d
					best = o
				end
			end
		end
	end
	if not best then return false end
	local dest = r.Position + Vector3.new(0, 1, 0)
	pcall(function()
		if best:IsA("Model") then
			for _, d in ipairs(best:GetDescendants()) do
				if d:IsA("BasePart") then
					d.Anchored = true
					d.CanCollide = false
				end
			end
			best:PivotTo(CFrame.new(dest))
		else
			local bp = Part(best)
			if bp then
				bp.Anchored = true
				bp.CanCollide = false
				bp.CFrame = CFrame.new(dest)
			end
		end
	end)
	task.wait(0.12)
	FirePrompt(best)
	task.wait(0.08)
	if best.Parent and best:FindFirstChildWhichIsA("ProximityPrompt", true) then
		local bp = Part(best)
		if bp then
			local origin = r.CFrame
			SafeTP(bp.Position + Vector3.new(0, 2, 0), nil, 12)
			task.wait(0.1)
			FirePrompt(best)
			pcall(function()
				r.CFrame = origin
				r.AssemblyLinearVelocity = Vector3.zero
			end)
		end
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
			local allow = false
			if inCorey then
				if FarmCorey.phase == 1 and not FarmCorey.didOne then
					allow = (m.Type == "Arcade" or m.Type == "Storage")
				elseif FarmCorey.phase == 2 or (FarmCorey.phase == 1 and FarmCorey.didOne) then
					allow = m.Type == "Corey"
					FarmCorey.phase = 2
				end
			else
				allow = (m.Type == "Arcade" and Farm.doArc)
					or (m.Type == "Storage" and Farm.doSto)
					or (m.Type == "Corey" and Farm.doCor)
			end
			if allow then
				local d = (m.Position - r.Position).Magnitude
				if d < bestD then
					bestD = d
					best = m
				end
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
		if Farm.doSafe then goSafe() end
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
		if Farm.doSafe then goSafe() end
		return false
	end
	setFarmStatus("Completing")
	local target = m.Tagged or m.Instance
	for _ = 1, 8 do
		if not m.Instance or not m.Instance.Parent then break end
		if IsDone(m.Instance) or IsDone(target) then break end
		FirePrompt(m.Instance)
		FireCompleteOne(target, m.Tag)
		FireCompleteOne(m.Instance, m.Tag)
		if m.Type == "Corey" then
			CompleteRemoteOnly("CoreyMachine")
		end
		task.wait(0.2)
	end
	local completed = IsDone(m.Instance) or IsDone(target)
	if completed then
		Farm.empty = 0
		if isCoreyArea() and FarmCorey.phase == 1 and (m.Type == "Arcade" or m.Type == "Storage") then
			FarmCorey.didOne = true
			FarmCorey.phase = 2
		end
	else
		markMachineFail(m.Instance, 4)
		Farm.empty = Farm.empty + 1
	end
	return completed
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
		return
	end

	local r = Root()
	if r and Farm.doSafe and CryptidNear(r.Position, 34, false) then
		setFarmStatus("Fleeing")
		goSafe()
		Farm.state = "WAIT"
		return
	end


	if Farm.doLoot then
		Farm.state = "LOOT"
		if farmLootOnce() then
			setFarmStatus("Looting")
			return
		end
	end


	if Farm.doMach then
		Farm.state = "MACHINE"
		local left = 0
		for _, m in ipairs(GetMachines()) do
			if not m.Done then
				if (m.Type == "Arcade" and Farm.doArc)
					or (m.Type == "Storage" and Farm.doSto)
					or (m.Type == "Corey" and Farm.doCor) then
					left = left + 1
				end
			end
		end
		if left > 0 then
			if farmDoMachine() then return end
			setFarmStatus("Waiting Safe")
			return
		end
	end


	if Farm.doExit then
		Farm.state = "EXIT"
		if exitReady or Farm.empty >= 3 then
			setFarmStatus("Going Exit")
			if doExit(exitReady) then
				countFloorPass()
				Farm.floors = FloorTrack.passed
				commitFloorLog("Auto-Farm")
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


local SplitCheer = { on = false, speed = 10 }

local function fireSplitCheer()
	if not IsPal("split") then return false end
	local c = Char()
	if not c then return false end
	local a1 = c:FindFirstChild("Skills") and (c.Skills:FindFirstChild("Ability1") or c.Skills:FindFirstChild("Skill1"))
	if not a1 then
		for _, d in ipairs(c:GetDescendants()) do
			if d.Name == "Ability1" and d:FindFirstChild("activate") then
				a1 = d
				break
			end
		end
	end
	if not a1 then return false end
	local act = a1:FindFirstChild("activate")
	if not act or not act:IsA("RemoteEvent") then return false end
	local solo = true
	local r = Root()
	if r then
		for _, pl in ipairs(Players:GetPlayers()) do
			if pl ~= Me and pl.Character and (pl.Character:GetAttribute("hearts") or 0) > 0 then
				local hr = pl.Character:FindFirstChild("HumanoidRootPart")
				if hr and (hr.Position - r.Position).Magnitude <= 80 then
					solo = false
					break
				end
			end
		end
	end
	return pcall(function() act:FireServer(solo) end)
end


local Bring = {
	on = false,
	tries = 10,
	coreyRoutine = true,
	pace = 1.2,
	floors = 0,
	status = "Idle",
	busy = false,
	coreyPhase = 0, 
	coreyDidOne = false,
	items = false,
}

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

local function completeMachineAtFront(m)
	if not m or not m.Instance or not m.Instance.Parent or IsDone(m.Instance) then
		return false
	end
	if not m.Front then return false end
	if CryptidNear(m.Front, Settings.safeDist or 42, true) then
		return false
	end
	Bring.status = "Corey TP " .. tostring(m.Type)
	if not SafeTP(m.Front, m.Position, Settings.safeDist or 42) then
		markMachineFail(m.Instance, 2.5)
		return false
	end
	task.wait(0.12)
	Bring.status = "Corey Complete " .. tostring(m.Type)
	local target = m.Tagged or m.Instance
	for _ = 1, 12 do
		if not m.Instance or not m.Instance.Parent then break end
		if IsDone(m.Instance) or IsDone(target) then
			return true
		end
		FirePrompt(m.Instance)
		FireCompleteOne(target, m.Tag)
		FireCompleteOne(m.Instance, m.Tag)
		if m.Tag == "CoreyMachine" then
			CompleteRemoteOnly("CoreyMachine")
		end
		task.wait(0.22)
	end
	return IsDone(m.Instance) or IsDone(target)
end

local function bringOneMachine(m, safe)
	if not m or not m.Instance or not m.Instance.Parent or IsDone(m.Instance) then
		return false
	end
	refreshChar(Me.Character)

	if isCoreyArea() then
		return completeMachineAtFront(m)
	end

	Bring.status = "Bring " .. tostring(m.Type)

	local safePos = safe or getSafePos()
	if not safePos then
		return false
	end

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
		if (stand - safePos).Magnitude > 40 then
			stand = safePos + Vector3.new(0, 5, 2)
		end
		pcall(function()
			r.CFrame = CFrame.lookAt(stand, mp.Position)
			r.AssemblyLinearVelocity = Vector3.zero
			r.AssemblyAngularVelocity = Vector3.zero
		end)
		task.wait(0.12)
	end

	Bring.status = "Complete " .. tostring(m.Type)
	for _ = 1, 10 do
		if not m.Instance or not m.Instance.Parent then break end
		if IsDone(m.Instance) then
			goSafe()
			return true
		end
		r = Root()
		if r and (r.Position - safePos).Magnitude > 22 then
			SafeTP(safePos, nil, 1)
			task.wait(0.08)
		end
		FirePrompt(m.Instance)
		FireCompleteOne(m.Tagged or m.Instance, m.Tag)
		task.wait(0.28)
	end

	local done = m.Instance and m.Instance.Parent and IsDone(m.Instance)
	goSafe()
	return done == true
end

local function pickBringMachine()
	local inCorey = isCoreyArea()
	if not inCorey then
		Bring.coreyPhase = 0
		Bring.coreyDidOne = false
	elseif Bring.coreyPhase == 0 then
		Bring.coreyPhase = 1
		Bring.coreyDidOne = false
	end
	local list = GetMachines()
	local function findType(types)
		for _, m in ipairs(list) do
			if not m.Done and not isMachineFailed(m.Instance) then
				for _, ty in ipairs(types) do
					if m.Type == ty then return m end
				end
			end
		end
		return nil
	end
	if inCorey then
		if Bring.coreyPhase == 1 and not Bring.coreyDidOne then
			local m = findType({ "Storage", "Arcade" })
			if m then return m end
			Bring.coreyPhase = 2
			Bring.coreyDidOne = true
		end
		if Bring.coreyPhase >= 2 then
			Bring.coreyPhase = 2
			return findType({ "Corey" })
		end
		return nil
	end

	for _, m in ipairs(list) do
		if not m.Done and not isMachineFailed(m.Instance) then
			return m
		end
	end
	return nil
end

local function bringTick()
	if Bring.busy then return end
	if not Bring.on then
		Bring.status = "Idle"
		return
	end
	refreshChar(Me.Character)
	if not Alive() then
		Bring.status = "Dead"
		return
	end
	if isIntermission() then
		Bring.status = "Intermission"
		onMapMaybeChanged()
		return
	end
	Bring.busy = true
	local ok, err = pcall(function()
		onMapMaybeChanged()
		local safe = getSafePos()
		if not safe then
			Bring.status = "No Safe"
			return
		end
		local r = Root()
		if not r then
			Bring.status = "No Character"
			return
		end
		if (r.Position - safe).Magnitude > 18 then
			Bring.status = "Safe"
			SafeTP(safe, nil, 1)
			return
		end

			local target = pickBringMachine()
		if target then
			local done = bringOneMachine(target, safe)
			if done then
				if isCoreyArea() and Bring.coreyPhase == 1 and (target.Type == "Storage" or target.Type == "Arcade") then
					Bring.coreyDidOne = true
					Bring.coreyPhase = 2
				end
			else
				markMachineFail(target.Instance, 5)
			end
			return
		end


		Bring.status = "Exit"
		local exited = false
		for _ = 1, 3 do
			if doExit(true) then
				exited = true
				break
			end
			task.wait(0.35)
		end
		if exited then
			countFloorPass()
			Bring.floors = FloorTrack.passed
			commitFloorLog("Bring")
			Bring.status = "Floor Done"
			Bring.coreyPhase = 0
			Bring.coreyDidOne = false
		else
			Bring.status = "Exit Wait"
		end
	end)
	Bring.busy = false
	if not ok then errLog("Bring", err) end
end


local function godModeOneRound()
	local farmWas = Farm.on
	local bringWas = Bring.on
	Farm.on = false
	Bring.on = false
	Stop("Farm")
	Stop("Bring")
	task.spawn(function()
		local h = Hum()
		if h then
			pcall(function() h.Health = 0 end)
		end
		task.wait(0.45)
		pcall(function() Me:LoadCharacter() end)
		local newChar = nil
		pcall(function()
			newChar = Me.CharacterAdded:Wait()
		end)
		task.wait(0.35)
		refreshChar(newChar or Me.Character)
		task.wait(0.25)
		refreshChar(Me.Character)
		Ping("God Mode", "Active for this round.", 3)
		if farmWas then
			Farm.on = true
			Farm.start = os.clock()
			Farm.state = "CHECK"
			Loop("Farm", function() return Farm.on end, function()
				farmTick()
			end, function()
				return Settings.pace
			end)
		end
		if bringWas then
			Bring.on = true
			Loop("Bring", function() return Bring.on end, function()
				bringTick()
			end, function()
				return Bring.pace
			end)
		end
	end)
end


local Util = {
	fullbright = false,
	nofog = false,
	noclip = false,
	fly = false,
	flySpeed = 50,
	maxStam = false,
	noBusy = false,
	afk = false,
}

local lightSnap = nil
local fogSnap = nil
local noclipParts = {}
local flyLV, flyAtt
local flyWant = false

local function snapLighting()
	lightSnap = {
		Brightness = Lighting.Brightness,
		Ambient = Lighting.Ambient,
		OutdoorAmbient = Lighting.OutdoorAmbient,
		ClockTime = Lighting.ClockTime,
		FogEnd = Lighting.FogEnd,
		FogStart = Lighting.FogStart,
	}
end

local function applyFullbright()
	pcall(function()
		Lighting.Brightness = 1.25
		Lighting.Ambient = Color3.fromRGB(95, 95, 100)
		Lighting.OutdoorAmbient = Color3.fromRGB(90, 90, 95)
		Lighting.GlobalShadows = true
		if Lighting.ClockTime < 5 or Lighting.ClockTime > 20 then
			Lighting.ClockTime = 12.5
		end
		for _, fx in ipairs(Lighting:GetChildren()) do
			if fx:IsA("ColorCorrectionEffect") then
				if fx.Brightness < -0.2 then fx.Brightness = -0.05 end
			elseif fx:IsA("BloomEffect") then
				fx.Intensity = math.min(fx.Intensity, 0.35)
			elseif fx:IsA("DepthOfFieldEffect") then
				fx.Enabled = false
			end
		end
	end)
end

local function restoreLighting()
	if not lightSnap then return end
	for k, v in pairs(lightSnap) do
		pcall(function() Lighting[k] = v end)
	end
	Lighting.GlobalShadows = true
end

local function applyNoFog()
	pcall(function()
		Lighting.FogEnd = math.max(Lighting.FogEnd, 2200)
		Lighting.FogStart = math.min(Lighting.FogStart, 80)
		for _, fx in ipairs(Lighting:GetChildren()) do
			if fx:IsA("Atmosphere") then
				if not fogSnap then
					fogSnap = { Density = fx.Density, Haze = fx.Haze }
				end
				fx.Density = math.min(fx.Density, 0.18)
				fx.Haze = math.min(fx.Haze, 0.5)
			end
		end
	end)
end

local function restoreFog()
	if fogSnap then
		local at = Lighting:FindFirstChildOfClass("Atmosphere")
		if at then
			at.Density = fogSnap.Density
			at.Haze = fogSnap.Haze
		end
	end
	if lightSnap then
		Lighting.FogEnd = lightSnap.FogEnd
		Lighting.FogStart = lightSnap.FogStart
	end
end

local noclipCharacter, noclipRefreshAt = nil, 0

local function setNoclip(on)
	local c, h = Char(), Hum()
	if not c then return end
	if not on then
		for part, was in pairs(noclipParts) do
			if part and part.Parent then pcall(function() part.CanCollide = was end) end
		end
		table.clear(noclipParts); noclipCharacter = nil
		if h then pcall(function() h.AutoRotate = true; h:ChangeState(Enum.HumanoidStateType.GettingUp) end) end
		local r = Root()
		if r then pcall(function() r.AssemblyAngularVelocity = Vector3.zero end) end
		return
	end
	local now = os.clock()
	if noclipCharacter == c and now - noclipRefreshAt < 0.12 then return end
	noclipRefreshAt = now
	if noclipCharacter ~= c then table.clear(noclipParts); noclipCharacter = c end
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA("BasePart") then
			if noclipParts[d] == nil then noclipParts[d] = d.CanCollide end
			if d.CanCollide then d.CanCollide = false end
		end
	end
end

local flyRebindPending = false

local function stopFly(keepWanted)
	Util.fly = false
	DisconnectKey("fly")
	if flyLV then pcall(function() flyLV:Destroy() end) flyLV = nil end
	if flyAtt then pcall(function() flyAtt:Destroy() end) flyAtt = nil end

	local r = Root()
	if r then
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.zero
			r.AssemblyAngularVelocity = Vector3.zero
		end)
	end

	local h = Hum()
	if h then pcall(function() h.PlatformStand = false; h.AutoRotate = true; h:ChangeState(Enum.HumanoidStateType.GettingUp) end) end

	if not keepWanted then
		flyWant = false
	end
end

local function startFly()
	if flyRebindPending then return end
	flyRebindPending = true
	Util.fly = false; DisconnectKey("fly")
	if flyLV then pcall(function() flyLV:Destroy() end); flyLV = nil end
	if flyAtt then pcall(function() flyAtt:Destroy() end); flyAtt = nil end
	task.defer(function()
		flyRebindPending = false
		if not flyWant then return end
		local r, h, c = Root(), Hum(), Char()
		if not r or not h or not c or h.Health <= 0 then return end
		Util.fly = true
		pcall(function() h.AutoRotate = false; h:ChangeState(Enum.HumanoidStateType.Physics) end)
		flyAtt = Instance.new("Attachment"); flyAtt.Name = "FunhouseFlyAtt"; flyAtt.Parent = r
		flyLV = Instance.new("LinearVelocity")
		flyLV.Name = "FunhouseFlyLV"; flyLV.Attachment0 = flyAtt; flyLV.RelativeTo = Enum.ActuatorRelativeTo.World
		flyLV.MaxForce = math.huge; flyLV.VectorVelocity = Vector3.zero; flyLV.Parent = r
		local bindChar = c
		Conn("fly", RunService.RenderStepped:Connect(function()
			if not flyWant or not Util.fly then return end
			local cur, hum, root, cam = Char(), Hum(), Root(), Workspace.CurrentCamera
			if not cur or not hum or not root or hum.Health <= 0 or not cam then
				Util.fly = false; if flyWant then startFly() end; return
			end
			if cur ~= bindChar or not flyLV or not flyLV.Parent or not flyAtt or not flyAtt.Parent then
				Util.fly = false; if flyWant then startFly() end; return
			end
			local speed = tonumber(Util.flySpeed) or 50
			local input, look = hum.MoveDirection, cam.CFrame.LookVector
			local flatLook = Vector3.new(look.X, 0, look.Z)
			local right = cam.CFrame.RightVector
			if flatLook.Magnitude > 0.01 then flatLook = flatLook.Unit end
			local side, forward = input:Dot(right), input:Dot(flatLook)
			local dir = flatLook * forward + right * side
			if math.abs(look.Y) > 0.05 and math.abs(forward) > 0.05 then dir = Vector3.new(dir.X, look.Y * forward, dir.Z) end
			local up = 0
			if UIS:IsKeyDown(Enum.KeyCode.Space) or UIS:IsKeyDown(Enum.KeyCode.ButtonR2) or UIS:IsKeyDown(Enum.KeyCode.ButtonA) then up += 1 end
			if UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.Q) or UIS:IsKeyDown(Enum.KeyCode.ButtonL2) then up -= 1 end
			if up ~= 0 then
				dir = Vector3.new(dir.X, up, dir.Z)
			end
			if dir.Magnitude > 1 then dir = dir.Unit end
			flyLV.VectorVelocity = dir * speed
			pcall(function() root.AssemblyAngularVelocity = Vector3.zero end)
		end))
	end)
end

local function SetFly(state)
	flyWant = state == true
	if flyWant then startFly() else stopFly(false) end
end


DisconnectKey("flyChar")
Conn("flyChar", Me.CharacterAdded:Connect(function()
	if flyWant then
		task.delay(0.25, function()
			if flyWant then startFly() end
		end)
	end
end))

local function readMaxStamina(c)
	local mx = tonumber(c:GetAttribute("MaxStamina"))
		or tonumber(c:GetAttribute("maxStamina"))
		or tonumber(c:GetAttribute("MaxStam"))
	if mx and mx > 0 then return mx end
	for _, n in ipairs({ "MaxStamina", "maxStamina", "StaminaMax" }) do
		local v = c:FindFirstChild(n, true)
		if v and v:IsA("NumberValue") and v.Value > 0 then return v.Value end
		if v and v:IsA("IntValue") and v.Value > 0 then return v.Value end
	end
	return 100
end

local function staminaTick()
	if not Util.maxStam then return end
	local c = Char()
	if not c then return end
	local maxS = readMaxStamina(c)
	pcall(function()
		c:SetAttribute("Stamina", maxS)
		c:SetAttribute("stamina", maxS)
		c:SetAttribute("Stam", maxS)
		c:SetAttribute("CurrentStamina", maxS)
	end)
	local h = Hum()
	if h then
		pcall(function()
			h:SetAttribute("Stamina", maxS)
		end)
	end
	for _, n in ipairs({ "Stamina", "stamina", "CurrentStamina", "Stam" }) do
		local v = c:FindFirstChild(n, true)
		if v then
			if v:IsA("NumberValue") or v:IsA("IntValue") then
				v.Value = maxS
			end
		end
	end

end

local function busyTick()
	if not Util.noBusy then return end
	local c = Char()
	if c then
		pcall(function() c:SetAttribute("busysorry", 0) end)
	end
end


local Debuff = {
	RottenBanana = false,
	Butter = false,
	Puddle = false,
}

local DebuffProcessed = setmetatable({}, { __mode = "k" })
local debuffConns = {}
local debuffWatchOn = false
local anyDebuffOn
local setDebuff

local function isDebuffEnabled(name)
	return Debuff[name] == true
end

local function removeTouchChildren(inst)
	if not inst or not inst.Parent then return end


	for _, child in ipairs(inst:GetChildren()) do
		if child.Name == "TouchInterest" or child:IsA("TouchTransmitter") then
			child:Destroy()
		end
	end


	
	if inst:IsA("Model") or inst:IsA("Folder") then
		for _, child in ipairs(inst:GetDescendants()) do
			if child:IsA("BasePart") then
				for _, sub in ipairs(child:GetChildren()) do
					if sub.Name == "TouchInterest" or sub:IsA("TouchTransmitter") then
						sub:Destroy()
					end
				end
			end
		end
	end
end

local function processDebuffObject(inst)
	if not inst or not inst.Parent then return end
	local name = inst.Name
	if not isDebuffEnabled(name) then return end
	if DebuffProcessed[inst] then return end

	DebuffProcessed[inst] = true
	removeTouchChildren(inst)
end

local function processExistingDebuff(name)
	if not isDebuffEnabled(name) then return end
	local obj = Workspace:FindFirstChild(name, true)
	if obj then
		processDebuffObject(obj)
	end
end

local function disconnectDebuffWatch()
	for _, c in pairs(debuffConns) do
		pcall(function() c:Disconnect() end)
	end
	table.clear(debuffConns)
	debuffWatchOn = false
end

local function startDebuffWatch()
	if debuffWatchOn then return end
	debuffWatchOn = true


	debuffConns.child = Workspace.DescendantAdded:Connect(function(obj)
		if not anyDebuffOn() then return end

		if Debuff[obj.Name] then
			task.defer(processDebuffObject, obj)
			return
		end


		
		if obj.Name == "TouchInterest" or obj:IsA("TouchTransmitter") then
			local parent = obj.Parent
			while parent and parent ~= Workspace do
				if Debuff[parent.Name] then
					DebuffProcessed[parent] = nil
					processDebuffObject(parent)
					break
				end
				parent = parent.Parent
			end
		end
	end)

	for name, enabled in pairs(Debuff) do
		if enabled then
			processExistingDebuff(name)
		end
	end
end

anyDebuffOn = function()
	return Debuff.RottenBanana or Debuff.Butter or Debuff.Puddle
end

local function stopDebuffWatch()
	disconnectDebuffWatch()
	DebuffProcessed = setmetatable({}, { __mode = "k" })
end

setDebuff = function(name, on)
	if Debuff[name] == nil then return end
	Debuff[name] = on == true

	if Debuff[name] then
		startDebuffWatch()
		processExistingDebuff(name)
	elseif not anyDebuffOn() then
		stopDebuffWatch()
	end
end

Managers.AntiDebuff = { State = Debuff, Set = setDebuff, Start = startDebuffWatch, Stop = stopDebuffWatch, IsOn = anyDebuffOn }

local TW = { on = false, speed = 3 }

local function stopTPWalk()
	TW.on = false
	DisconnectKey("tw")
end

local function twTick(_, dt)
	if not TW.on then return end
	local h = Hum()
	local c = Char()
	if not h or not c or h.Health <= 0 then return end
	local md = h.MoveDirection
	if md.Magnitude < 0.05 then return end
	local spd = tonumber(TW.speed) or 3
	if spd < 1 then spd = 1 end
	if spd > 15 then spd = 15 end
	dt = math.clamp(tonumber(dt) or 0.016, 0.008, 0.05)
	local translation = md * spd * dt * 10
	pcall(function()
		c:TranslateBy(translation)
	end)
end

local function startTPWalk()
	DisconnectKey("tw")
	if not TW.on then return end
	Conn("tw", RunService.Stepped:Connect(function(time, dt)
		twTick(time, dt)
	end))
end

Managers.Movement = { Fly = SetFly, Noclip = setNoclip, TeleportWalk = function(on)
	TW.on = on == true
	if TW.on then startTPWalk() else stopTPWalk() end
end }


local Features = {
	minigameMode = "Force Win",
	minigameOn = false,
	autoMachines = false,
	autoExit = false,
	tpMode = "Cryptid Check",
	losESP = true,
	progressESP = true,
	minigameESP = true,
	abilityBusy = false,
}

local function L(key)
	local en = {
		ready = "ready",
		invFull = "Inventory is full.",
		leave = "Leaving !!",
		complete = "Complete",
		incomplete = "Incomplete",
		minigame = "In minigame",
	}
	return en[key] or key
end

local function hasLOS(fromPos, toPos)
	if not fromPos or not toPos then return true end
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	local filter = {}
	local me = Char()
	if me then table.insert(filter, me) end
	params.FilterDescendantsInstances = filter
	params.IgnoreWater = true
	local dir = toPos - fromPos
	if dir.Magnitude < 1 then return true end
	local hit = Workspace:Raycast(fromPos, dir.Unit * math.min(dir.Magnitude, 400), params)
	if not hit then return true end
	return (hit.Position - toPos).Magnitude < 6
end

local function forceWinMinigames()
	local roots = {
		Me:FindFirstChild("PlayerGui"),
		game:GetService("StarterGui"),
	}
	for _, root in ipairs(roots) do
		if root then
			for _, mod in ipairs(root:GetDescendants()) do
				if mod:IsA("ModuleScript") then
					local n = string.lower(mod.Name)
					if n:find("minigame", 1, true) or n:find("mini", 1, true) then
						pcall(function()
							local m = require(mod)
							if type(m) == "table" and type(m.run) == "function" then
								m.run = function(...)
									return true
								end
							end
						end)
					end
				end
			end
		end
	end
end

local function minigameTick()
	if not Features.minigameOn then return end
	forceWinMinigames()
end

local function autoMachinesTick()
	if not Features.autoMachines then return end
	if isIntermission() or not Alive() then return end
	remCache = {}
	CompleteRemoteOnly("ArcadeMachine")
	CompleteRemoteOnly("StorageMachine")
	CompleteRemoteOnly("CoreyMachine")
	local list = GetMachines()
	local r = Root()
	if not r then return end
	local best, bestD
	for _, m in ipairs(list) do
		if not m.Done and m.Front and not isMachineFailed(m.Instance) then
			if not CryptidNear(m.Front, Settings.safeDist or 42, true) then
				local d = (m.Front - r.Position).Magnitude
				if not bestD or d < bestD then best, bestD = m, d end
			end
		end
	end
	if not best then return end
	if not SafeTP(best.Front, best.Position, Settings.safeDist or 42) then
		FireCompleteOne(best.Tagged or best.Instance, best.Tag)
		FireCompleteOne(best.Instance, best.Tag)
		return
	end
	task.wait(0.1)
	for _ = 1, 4 do
		FirePrompt(best.Instance)
		FireCompleteOne(best.Tagged or best.Instance, best.Tag)
		FireCompleteOne(best.Instance, best.Tag)
		if best.Tag then CompleteRemoteOnly(best.Tag) end
		task.wait(0.12)
		if IsDone(best.Instance) then break end
	end
end

local function autoExitTick()
	if not Features.autoExit then return end
	if isIntermission() or not Alive() then return end
	doExit(true)
end

local function getPalName()
	local c = Char()
	if not c then return "" end
	return string.lower(tostring(c:GetAttribute("CharacterName") or c:GetAttribute("Pal") or ""))
end

local AbilitySupport = {
	anton = { [1] = false, [2] = true },
	manny = { [1] = false, [2] = false },
	split = { [1] = true, [2] = true },
	freddie = { [1] = false, [2] = true },
	mabel = { [1] = true, [2] = true },
}

local function fireAbility(slot)
	if Features.abilityBusy then return end
	local pal = getPalName()
	local key = pal
	for name in pairs(AbilitySupport) do
		if pal:find(name, 1, true) then key = name break end
	end
	local support = AbilitySupport[key]
	if support and support[slot] == false then
		Ping("Ability", "This ability doesn't work for this Pal", 2)
		return
	end
	Features.abilityBusy = true
	task.spawn(function()
		local c = Char()
		if not c then Features.abilityBusy = false return end
		local skills = c:FindFirstChild("Skills")
		local ab = skills and skills:FindFirstChild("Ability" .. tostring(slot))
		if ab then
			local act = ab:FindFirstChild("activate")
			if act and act:IsA("RemoteEvent") then
				pcall(function() act:FireServer() end)
			elseif act and act:IsA("BindableEvent") then
				pcall(function() act:Fire() end)
			end
		end
		local rem = Rem("SkillActivate") or Rem("AbilityActivate")
		if rem then
			pcall(function() rem:FireServer(slot) end)
		end
		task.wait(0.35)
		Features.abilityBusy = false
	end)
end

local function itemStandPos(obj)
	if not obj then return nil, nil end
	local p = nil
	if obj:IsA("Model") then
		p = obj.PrimaryPart
		if not p then
			local best, bestVol = nil, -1
			for _, d in ipairs(obj:GetDescendants()) do
				if d:IsA("BasePart") and d.Transparency < 0.95 then
					local vol = d.Size.X * d.Size.Y * d.Size.Z
					if vol > bestVol then
						bestVol = vol
						best = d
					end
				end
			end
			p = best
		end
	elseif obj:IsA("BasePart") then
		p = obj
	else
		p = Part(obj)
	end
	if not p then return nil, nil end
	local center = p.Position
	local look = p.CFrame.LookVector
	if look.Magnitude < 0.1 then
		look = Vector3.new(0, 0, -1)
	end
	local stand = center - look.Unit * 3.5 + Vector3.new(0, 2.5, 0)
	local r = Root()
	if r then
		local toPlayer = (r.Position - center)
		local flat = Vector3.new(toPlayer.X, 0, toPlayer.Z)
		if flat.Magnitude > 0.5 then
			stand = center + flat.Unit * 3.5 + Vector3.new(0, 2.5, 0)
		end
	end
	return stand, center
end

local function collectTeleportTargets(kind)
	local out = {}
	local usedLabels = {}
	local function uniqueLabel(base)
		base = tostring(base or "Target")
		if not usedLabels[base] then
			usedLabels[base] = 1
			return base
		end
		usedLabels[base] = usedLabels[base] + 1
		return base .. " #" .. tostring(usedLabels[base])
	end
	if kind == "Machines" then
		for _, m in ipairs(GetMachines()) do
			if m.Instance and m.Position then
				local base = prettyMachineName(m.Instance) .. (m.Done and (" (" .. L("complete") .. ")") or (" (" .. L("incomplete") .. ")"))
				local label = uniqueLabel(base)
				table.insert(out, {
					label = label,
					pos = m.Front or (m.Position + Vector3.new(0, 2, 0)),
					look = m.Position,
					inst = m.Instance,
				})
			end
		end
	else
		local seen = {}
		local function add(o)
			if not o or seen[o] or not o.Parent then return end
			local low = string.lower(tostring(o.Name or ""))
			if low:find("fleshtrap", 1, true) or low:find("rottenbanana", 1, true) then return end
			local tagged = false
			pcall(function() tagged = CS:HasTag(o, "Spawneditem") or CS:HasTag(o, "SpawnedItem") end)
			if not tagged and not isBringItem(o) then return end
			seen[o] = true
			local stand, center = itemStandPos(o)
			if stand and center then
				local base = tostring(o.Name):gsub("%d+$", "")
				if base == "" then base = "Item" end
				local label = uniqueLabel(base)
				table.insert(out, {
					label = label,
					pos = stand,
					look = center,
					inst = o,
					isItem = true,
				})
			end
		end
		pcall(function()
			for _, tag in ipairs({ "Spawneditem", "SpawnedItem" }) do
				for _, o in ipairs(CS:GetTagged(tag)) do add(o) end
			end
		end)
		for _, o in ipairs(Workspace:GetChildren()) do add(o) end
	end
	return out
end

local function doTeleportTo(entry)
	if not entry then return end
	local pos, look = entry.pos, entry.look
	if entry.isItem and entry.inst and entry.inst.Parent then
		local stand, center = itemStandPos(entry.inst)
		if stand then
			pos, look = stand, center
		end
	end
	if not pos then return end
	local rad = Features.tpMode == "Cryptid Check" and (Settings.safeDist or 42) or 1
	if Features.tpMode == "Cryptid Check" and CryptidNear(pos, rad, true) then
		Ping("Teleport", "Blocked by cryptid", 2)
		return
	end
	SafeTP(pos, look, rad)
end


local ESP = {
	on = { Cryptids = false, Storages = false, Arcanes = false, Coreys = false, Pals = false, Items = false },
	scanBusy = false,
	scanAgain = false,
	colors = {
		Cryptids = Color3.fromRGB(255, 70, 70),
		Storages = Color3.fromRGB(80, 180, 255),
		StoragesDone = Color3.fromRGB(60, 120, 180),
		Arcanes = Color3.fromRGB(180, 100, 255),
		ArcanesDone = Color3.fromRGB(120, 70, 180),
		Coreys = Color3.fromRGB(255, 180, 60),
		Pals = Color3.fromRGB(100, 255, 140),
		Items = Color3.fromRGB(255, 220, 80),
	},
	tags = {
		Progress = true, MachineName = true,
		PalName = true, PalUser = false,
		CryptidName = true, CryptidDist = true,
		ItemName = true,
		Minigame = true,
	},
	los = true,
	bl = {
		Cryptids = false,
		Items = false,
		Machines = false,
		Corey = false,
		Storage = false,
		Arcane = false,
		Anton = false,
		Freddie = false,
		Mabel = false,
		Manny = false,
		Split = false,
		Dusty = false,
		Stargil = false,
		Fan = false,
		CoreyCryptid = false,
	},
	cache = {},
	folder = nil,
	itemHooked = false,
	blItem = {},
	maxObjects = OnPhone and 22 or 48,
	maxDistance = OnPhone and 160 or 260,
	scanInterval = OnPhone and 4.2 or 2.8,
}

local function anyESP()
	for _, v in pairs(ESP.on) do
		if v then return true end
	end
	return false
end

local function isEspHidden(cat, machineType)
	if cat == "Cryptids" then
		return ESP.bl.Cryptids == true
	end
	if cat == "Items" then
		return ESP.bl.Items == true
	end
	if cat == "Pals" then return false end
	if cat == "Storages" then return ESP.bl.Machines == true or ESP.bl.Storage == true end
	if cat == "Arcanes" then return ESP.bl.Machines == true or ESP.bl.Arcane == true end
	if cat == "Coreys" then return ESP.bl.Machines == true or ESP.bl.Corey == true end
	return false
end
local function isEspHiddenMachine(typeName)
	if typeName == "Storage" then return ESP.bl.Machines == true or ESP.bl.Storage == true end
	if typeName == "Arcade" then return ESP.bl.Machines == true or ESP.bl.Arcane == true end
	if typeName == "Corey" then return ESP.bl.Machines == true or ESP.bl.Corey == true end
	return false
end
local function ensureESPFolder()
	if ESP.folder and ESP.folder.Parent then return ESP.folder end
	local pg = Me:FindFirstChildOfClass("PlayerGui") or Me:WaitForChild("PlayerGui", 5)
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

local function removeESP(inst)
	local data = ESP.cache[inst]
	if not data then return end
	pcall(function() if data.hl then data.hl:Destroy() end end)
	pcall(function() if data.bill then data.bill:Destroy() end end)
	ESP.cache[inst] = nil
end

local function clearESP()
	for inst in pairs(ESP.cache) do removeESP(inst) end
end

local function ensureHL(inst, col)
	local data = ESP.cache[inst]
	if data then
		if data.hl and data.hl.Parent then
			data.hl.FillColor = col
			data.hl.OutlineColor = col
			data.hl.Adornee = inst
			if Features.losESP or ESP.los then
				local r = Root()
				local p = Part(inst)
				local visible = true
				if r and p then
					visible = hasLOS(r.Position + Vector3.new(0, 2, 0), p.Position + Vector3.new(0, 2, 0))
				end
				data.hl.FillTransparency = visible and 0.55 or 1
				data.hl.OutlineTransparency = visible and 0.1 or 0.25
			end
		else
			local folder = ensureESPFolder()
			if folder then
				local hl = Instance.new("Highlight")
				hl.Name = "EC_HL"
				hl.Adornee = inst
				hl.FillTransparency = 0.55
				hl.OutlineTransparency = 0.1
				hl.FillColor = col
				hl.OutlineColor = col
				hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				hl.Parent = folder
				data.hl = hl
			end
		end
		if data.bill and data.bill.Parent then
			data.bill.MaxDistance = ESP.maxDistance
			local p = Part(inst)
			if p then data.bill.Adornee = p end
		elseif not data.bill then
			local folder = ensureESPFolder()
			local p = Part(inst)
			if folder and p then
				local bill = Instance.new("BillboardGui")
				bill.Name = "EC_TAG"
				bill.Adornee = p
				bill.Size = UDim2.fromOffset(120, 28)
				bill.StudsOffset = Vector3.new(0, 3.2, 0)
				bill.AlwaysOnTop = true
				bill.MaxDistance = ESP.maxDistance
				bill.Parent = folder
				local lab = Instance.new("TextLabel")
				lab.Name = "T"
				lab.Size = UDim2.fromScale(1, 1)
				lab.BackgroundTransparency = 1
				lab.TextColor3 = Color3.new(1, 1, 1)
				lab.TextStrokeTransparency = 0.4
				lab.Font = Enum.Font.GothamBold
				lab.TextSize = 12
				lab.Text = ""
				lab.Parent = bill
				data.bill = bill
			end
		end
		return data
	end
	local folder = ensureESPFolder()
	if not folder then return nil end
	local hl = Instance.new("Highlight")
	hl.Name = "EC_HL"
	hl.Adornee = inst
	hl.FillTransparency = 0.55
	hl.OutlineTransparency = 0.1
	hl.FillColor = col
	hl.OutlineColor = col
	hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	hl.Parent = folder
	local bill
	local p = Part(inst)
	if p then
		bill = Instance.new("BillboardGui")
		bill.Name = "EC_TAG"
		bill.Adornee = p
		bill.Size = UDim2.fromOffset(120, 28)
		bill.StudsOffset = Vector3.new(0, 3.2, 0)
		bill.AlwaysOnTop = true
		bill.MaxDistance = ESP.maxDistance
		bill.Parent = folder
		local lab = Instance.new("TextLabel")
		lab.Name = "T"
		lab.Size = UDim2.fromScale(1, 1)
		lab.BackgroundTransparency = 1
		lab.TextColor3 = Color3.new(1, 1, 1)
		lab.TextStrokeTransparency = 0.4
		lab.Font = Enum.Font.GothamBold
		lab.TextSize = 12
		lab.Text = ""
		lab.Parent = bill
	end
	data = { hl = hl, bill = bill, cat = nil }
	ESP.cache[inst] = data
	return data
end

local function setTagText(data, text)
	if not data or not data.bill then return end
	local lab = data.bill:FindFirstChild("T")
	if lab then lab.Text = text or "" end
end

local function espScanWork()
	if not anyESP() then
		if next(ESP.cache) then clearESP() end
		return
	end
	local seen = {}
	local r = Root()

	local created = 0
	local function keep(inst, cat, label, col, asMachine)
		if not inst or not inst.Parent or isEspHidden(cat) then return false end
		if asMachine then
			inst = machineRoot(inst) or inst
		end
		if seen[inst] then
			local data = ESP.cache[inst]
			if data then setTagText(data, label or "") end
			return false
		end
		if r then
			local p = Part(inst)
			if p and (p.Position - r.Position).Magnitude > ESP.maxDistance then return false end
		end
		if created >= ESP.maxObjects then return false end
		seen[inst] = true
		created += 1
		local data = ensureHL(inst, col or ESP.colors[cat] or Color3.new(1, 1, 1))
		if data then
			data.cat = cat
			setTagText(data, label or "")
		end
		return true
	end

	if ESP.on.Cryptids and not ESP.bl.Cryptids then
		refreshCryptids(false)
		for _, o in ipairs(cryptidCache) do
			if o.Parent and not IsPlayerChar(o) then
				local n = o.Name
				local low = string.lower(n)
				local hide = low:find("spawn", 1, true) ~= nil
					or low:find("spawner", 1, true) ~= nil
					or low == "cryptidspawn"
					or low:find("placeholder", 1, true) ~= nil
				if low:find("anton", 1, true) and ESP.bl.Anton then hide = true end
				if low:find("freddie", 1, true) and ESP.bl.Freddie then hide = true end
				if low:find("mabel", 1, true) and ESP.bl.Mabel then hide = true end
				if low:find("manny", 1, true) and ESP.bl.Manny then hide = true end
				if low:find("split", 1, true) and ESP.bl.Split then hide = true end
				if low:find("dusty", 1, true) and ESP.bl.Dusty then hide = true end
				if low:find("stargil", 1, true) and ESP.bl.Stargil then hide = true end
				if (low == "fan" or (low:find("fan", 1, true) and #low <= 8)) and ESP.bl.Fan then hide = true end
				if low:find("corey", 1, true) and not low:find("machine", 1, true) and ESP.bl.CoreyCryptid then hide = true end
				if not hide then
					local label = n
					if low == "fan" then label = "Fan"
					elseif low:find("stargil") then label = "Stargil"
					elseif low:find("anton") then label = "Cryptid Anton"
					elseif low:find("mabel") then label = "Cryptid Mabel"
					elseif low:find("manny") then label = "Cryptid Manny"
					elseif low:find("split") then label = "Cryptid Split"
					elseif low:find("freddie") then label = "Cryptid Freddie"
					end
					if ESP.tags.CryptidDist and r then
						local p = Part(o)
						if p then
							label = label .. string.format(" · %dm", math.floor((p.Position - r.Position).Magnitude))
						end
					end
					if not ESP.tags.CryptidName then label = "" end
					keep(o, "Cryptids", label, ESP.colors.Cryptids)
				end
			end
		end
	end

	if ESP.on.Storages or ESP.on.Arcanes or ESP.on.Coreys then
		for _, m in ipairs(GetMachines()) do
			local on = (m.Type == "Storage" and ESP.on.Storages)
				or (m.Type == "Arcade" and ESP.on.Arcanes)
				or (m.Type == "Corey" and ESP.on.Coreys)
			if on and not isEspHiddenMachine(m.Type) then
				local cat = m.Type == "Storage" and "Storages" or (m.Type == "Arcade" and "Arcanes" or "Coreys")
				local col = ESP.colors[cat]
				if m.Done then
					col = ESP.colors[cat .. "Done"] or col
				end
				local parts = {}
				if ESP.tags.MachineName then table.insert(parts, prettyMachineName(m.Instance)) end
				if ESP.tags.Progress or Features.progressESP then
					local prog = tonumber(m.Instance and m.Instance:GetAttribute("Progress"))
					local need = tonumber(m.Instance and m.Instance:GetAttribute("HowMuch"))
					if prog and need and need > 0 then
						table.insert(parts, string.format("%d/%d", prog, need))
					else
						table.insert(parts, m.Done and L("complete") or L("incomplete"))
					end
				end
				if (ESP.tags.Minigame or Features.minigameESP) then
					local c = Char()
					if c then
						local inMini = c:GetAttribute("InArcade") or c:GetAttribute("InStorage") or c:GetAttribute("DoingTask")
						if inMini == true or inMini == 1 then
							table.insert(parts, L("minigame"))
						end
					end
				end
				keep(m.Instance, cat, table.concat(parts, " · "), col, true)
			end
		end
	end

	if ESP.on.Pals then
		for _, pl in ipairs(Players:GetPlayers()) do
			if pl ~= Me and pl.Character then
				local parts = {}
				if ESP.tags.PalName then
					table.insert(parts, tostring(pl.Character:GetAttribute("CharacterName") or pl.Name))
				end
				if ESP.tags.PalUser then table.insert(parts, pl.Name) end
				keep(pl.Character, "Pals", table.concat(parts, " · "), ESP.colors.Pals)
			end
		end
	end

	if ESP.on.Items and not ESP.bl.Items and created < ESP.maxObjects then
		local function addItem(o)
			if not o or not o.Parent or seen[o] then return end
			local n = string.lower(tostring(o.Name or ""))
			if n:find("fleshtrap", 1, true) then return end
			if ESP.blItem and next(ESP.blItem) then
				for key in pairs(ESP.blItem) do
					if key ~= "all items" and n:find(key, 1, true) then return end
				end
			end
			local tagged = false
			pcall(function() tagged = CS:HasTag(o, "Spawneditem") or CS:HasTag(o, "SpawnedItem") end)
			if not tagged then return end
			local label = ESP.tags.ItemName and tostring(o.Name):gsub("%d+$", "") or ""
			keep(o, "Items", label, ESP.colors.Items)
		end
		pcall(function()
			for _, tag in ipairs({ "Spawneditem", "SpawnedItem" }) do
				for _, o in ipairs(CS:GetTagged(tag)) do
					if created >= ESP.maxObjects then break end
					addItem(o)
				end
				if created >= ESP.maxObjects then break end
			end
		end)
	end


	for inst in pairs(ESP.cache) do
		if not seen[inst] or not inst.Parent then removeESP(inst) end
	end
end

local function espScan()
	if ESP.scanBusy then
		ESP.scanAgain = true
		return
	end

	ESP.scanBusy = true
	local ok, err = pcall(espScanWork)
	ESP.scanBusy = false

	if not ok then
		errLog("ESP", err)
	end

	if ESP.scanAgain and anyESP() then
		ESP.scanAgain = false
		task.delay(0.12, function()
			if anyESP() and not ESP.scanBusy then
				espScan()
			end
		end)
	else
		ESP.scanAgain = false
	end
end



local function BuildInterface()
local State = {
	UIColor = "Dark",
	AntiLag = false,
	DisableRendering = false,
	UnlockCamera = false,
	ProtectUsernames = false,
	FOVEnabled = false,
	FOV = 85,
	CameraMinZoom = 0.5,
	CameraMaxZoom = 128,
	AlwaysRun = false,
	RunSpeed = false,
	AutoVoteCard = "Off",
	AutoVoteEnabled = false,
	AutoEscape = false,
	NoMinigames = false,
	AntiFailMinigames = false,
	DeleteMachineCollisions = false,
	AuraMachines = false,
	AuraBlacklistMachines = {},
	FarmMode = "Teleport",
	DelayMS = 0,
}

local SettingsModule
pcall(function()
	local module = RS:FindFirstChild("SettingsModule")
	if module then
		SettingsModule = require(module)
	end
end)

local function setGraphicsSetting(key, value)
	if not SettingsModule or type(SettingsModule.Set) ~= "function" then return end
	pcall(function()
		SettingsModule:Set("Graphics", key, value)
	end)
end

local savedGraphics = {}
local function captureGraphics(key)
	if savedGraphics[key] ~= nil then return end
	if SettingsModule and type(SettingsModule.Get) == "function" then
		local ok, value = pcall(function()
			return SettingsModule:Get("Graphics", key)
		end)
		if ok then savedGraphics[key] = value end
	end
	if savedGraphics[key] == nil then savedGraphics[key] = true end
end

local function applyAntiLag(on)
	State.AntiLag = on == true
	for _, key in ipairs({ "Shadows", "Bloom", "Blur", "Contrast" }) do
		captureGraphics(key)
		setGraphicsSetting(key, State.AntiLag and false or savedGraphics[key])
	end
	if State.AntiLag then
		pcall(function()
			Lighting.GlobalShadows = false
		end)
	else
		pcall(function()
			Lighting.GlobalShadows = savedGraphics.Shadows ~= false
		end)
	end
end

local renderingDisabled = false
local function setDisableRendering(on)
	State.DisableRendering = on == true
	if type(RunService.Set3dRenderingEnabled) == "function" then
		pcall(function()
			RunService:Set3dRenderingEnabled(not State.DisableRendering)
		end)
	end
	renderingDisabled = State.DisableRendering
end

local cameraConnectionKey = "unlockCamera"
local function applyCamera()
	local minZoom = math.max(0.5, tonumber(State.CameraMinZoom) or 0.5)
	local maxZoom = math.max(minZoom, tonumber(State.CameraMaxZoom) or 128)
	pcall(function()
		Me.CameraMode = Enum.CameraMode.Classic
		if State.UnlockCamera then
			Me.CameraMinZoomDistance = minZoom
			Me.CameraMaxZoomDistance = maxZoom
		else
			Me.CameraMinZoomDistance = 10
			Me.CameraMaxZoomDistance = 18
		end
	end)
end

local function setUnlockCamera(on)
	State.UnlockCamera = on == true
	DisconnectKey(cameraConnectionKey)
	if State.UnlockCamera then
		applyCamera()
		Conn(cameraConnectionKey, RunService.RenderStepped:Connect(function()
			if State.UnlockCamera then applyCamera() end
		end))
	else
		applyCamera()
	end
end

local fovOriginal = nil
local function applyFOVEnabled(on)
	State.FOVEnabled = on == true
	DisconnectKey("fov")
	if State.FOVEnabled then
		pcall(function()
			local cam = Workspace.CurrentCamera
			if cam then fovOriginal = cam.FieldOfView end
		end)
		local ok = pcall(function()
			RunService:BindToRenderStep("FunhouseCustomFOV", Enum.RenderPriority.Camera.Value + 10, function()
				if not State.FOVEnabled then return end
				local cam = Workspace.CurrentCamera
				if cam then cam.FieldOfView = math.clamp(tonumber(State.FOV) or 85, 1, 120) end
			end)
		end)
		if not ok then
			Conn("fov", RunService.RenderStepped:Connect(function()
				if not State.FOVEnabled then return end
				local cam = Workspace.CurrentCamera
				if cam then cam.FieldOfView = math.clamp(tonumber(State.FOV) or 85, 1, 120) end
			end))
		end
	else
		pcall(function()
			RunService:UnbindFromRenderStep("FunhouseCustomFOV")
		end)
		pcall(function()
			local cam = Workspace.CurrentCamera
			if cam then cam.FieldOfView = tonumber(fovOriginal) or 85 end
		end)
		fovOriginal = nil
	end
end

local usernameMaskMode = "Off"
local savedUsernames = {}
local function applyUsernameProtection()
	local pg = Me:FindFirstChildOfClass("PlayerGui")
	if not pg then return end
	local function handle(label)
		if not label or not label:IsA("TextLabel") or label.Name ~= "Username" then return end
		if savedUsernames[label] == nil then savedUsernames[label] = label.Text end
		if usernameMaskMode == "Off" then
			label.Text = savedUsernames[label]
		elseif usernameMaskMode == "Self" then
			local text = tostring(savedUsernames[label] or "")
			if text == Me.Name or text == Me.DisplayName then
				label.Text = "???"
			end
		elseif usernameMaskMode == "Hide" then
			local text = tostring(savedUsernames[label] or "")
			if text == Me.Name or text == Me.DisplayName then
				label.Text = ""
			end
		elseif usernameMaskMode == "Everyone" then
			label.Text = "???"
		end
	end
	for _, rootName in ipairs({ "MemberTab", "Spectate" }) do
		local root = pg:FindFirstChild(rootName) or game:GetService("StarterGui"):FindFirstChild(rootName)
		if root then
			for _, obj in ipairs(root:GetDescendants()) do
				handle(obj)
			end
		end
	end
end

local function setProtectUsernames(on)
	State.ProtectUsernames = on == true
	usernameMaskMode = State.ProtectUsernames and "Self" or "Off"
	DisconnectKey("usernameMask")
	if State.ProtectUsernames then
		applyUsernameProtection()
		Conn("usernameMask", Me.CharacterAdded:Connect(function()
			task.wait(0.35)
			if State.ProtectUsernames then applyUsernameProtection() end
		end))
		Loop("usernameMask", function() return State.ProtectUsernames end, applyUsernameProtection, 1.2)
	else
		Stop("usernameMask")
		applyUsernameProtection()
	end
end

local function alwaysRunTick()
	if not State.AlwaysRun then return end
	local c = Char()
	local h = Hum()
	if not c or not h then return end
	local sprint = c:FindFirstChild("IsSprinting")
	if sprint and sprint:IsA("BoolValue") then
		pcall(function() sprint.Value = true end)
	end
end

local function runSpeedTick()
	if not State.RunSpeed then return end
	local c = Char()
	local h = Hum()
	if not c or not h then return end
	local run = tonumber(c:GetAttribute("Run")) or 22
	pcall(function() h.WalkSpeed = run end)
end

local function setAlwaysRun(on)
	State.AlwaysRun = on == true
	if not State.AlwaysRun then Stop("AlwaysRun") return end
	Loop("AlwaysRun", function() return State.AlwaysRun end, alwaysRunTick, 0.08)
end

local function setRunSpeed(on)
	State.RunSpeed = on == true
	if not State.RunSpeed then Stop("RunSpeed") return end
	Loop("RunSpeed", function() return State.RunSpeed end, runSpeedTick, 0.08)
end

local function instantDie()
	local h = Hum()
	if h then pcall(function() h.Health = 0 end) end
end

local autoVoteConnection = nil
local function getCardOptions()
	local out = { "Off" }
	local seen = { Off = true }
	local vote = RS:FindFirstChild("Vote")
	if vote then
		for _, obj in ipairs(vote:GetChildren()) do
			local name = tostring(obj.Name)
			if name ~= "" and not seen[name] then
				seen[name] = true
				table.insert(out, name)
			end
		end
	end
	table.sort(out, function(a, b)
		if a == "Off" then return true end
		if b == "Off" then return false end
		return a < b
	end)
	return out
end

local function setAutoVoteCard(value)
	State.AutoVoteCard = type(value) == "string" and value or "Off"
	State.AutoVoteEnabled = State.AutoVoteCard ~= "Off"
	DisconnectKey("autoVote")
	if not State.AutoVoteEnabled then return end
	local sync = RS:FindFirstChild("CardVoteSync")
	local voteRemote = RS:FindFirstChild("CardVoteEvent")
	if not sync or not sync:IsA("RemoteEvent") or not voteRemote or not voteRemote:IsA("RemoteEvent") then return end
	Conn("autoVote", sync.OnClientEvent:Connect(function(state, cards)
		if state ~= "show" or type(cards) ~= "table" or not State.AutoVoteEnabled then return end
		if not Alive() then return end
		for _, card in ipairs(cards) do
			if tostring(card) == State.AutoVoteCard then
				pcall(function() voteRemote:FireServer(card) end)
				break
			end
		end
	end))
end

local function autoEscapeTick()
	if not State.AutoEscape or not Alive() or isIntermission() then return end
	local r = Root()
	if r and CryptidNear(r.Position, Settings.safeDist, true) then
		goSafe()
	end
end

local MachineAuraBlacklist = {}
local function machineTypeBlacklisted(typeName)
	return MachineAuraBlacklist[typeName] == true
end

local function setMachineAuraBlacklist(list)
	MachineAuraBlacklist = {}
	if type(list) ~= "table" then return end
	for _, value in ipairs(list) do
		local v = tostring(value)
		if v == "Arcane" then MachineAuraBlacklist.Arcade = true end
		if v == "Storage" then MachineAuraBlacklist.Storage = true end
		if v == "Tree" then MachineAuraBlacklist.Corey = true end
	end
end

local function auraMachinesTick()
	if not State.AuraMachines or isIntermission() or not Alive() then return end
	for _, m in ipairs(GetMachines()) do
		if m.Instance and m.Instance.Parent and not m.Done and not machineTypeBlacklisted(m.Type) then
			local tag = m.Tag == "ArcadeMachine" and "ArcadeMachine" or (m.Tag == "StorageMachine" and "StorageMachine" or "CoreyMachine")
			FirePrompt(m.Instance)
			FireCompleteOne(m.Tagged or m.Instance, tag)
			FireCompleteOne(m.Instance, tag)
		end
	end
end

local machineCollisionParts = {}
local function applyMachineCollisions(on)
	State.DeleteMachineCollisions = on == true
	if not State.DeleteMachineCollisions then
		for part, old in pairs(machineCollisionParts) do
			if part and part.Parent then pcall(function() part.CanCollide = old end) end
		end
		table.clear(machineCollisionParts)
		Stop("MachineCollision")
		return
	end
	local function tick()
		if not State.DeleteMachineCollisions then return end
		for _, m in ipairs(GetMachines()) do
			if m.Instance and m.Instance.Parent then
				for _, d in ipairs(m.Instance:GetDescendants()) do
					if d:IsA("BasePart") then
						if machineCollisionParts[d] == nil then machineCollisionParts[d] = d.CanCollide end
						d.CanCollide = false
					end
				end
			end
		end
	end
	tick()
	Loop("MachineCollision", function() return State.DeleteMachineCollisions end, tick, 0.5)
end

local MachineComplete = { Arcane = false, Storage = false, Tree = false }
local function setInstantMachine(name, on)
	MachineComplete[name] = on == true
	local key = name
	local tag = key == "Arcane" and "ArcadeMachine" or (key == "Storage" and "StorageMachine" or "CoreyMachine")
	local loopKey = "Instant_" .. key
	if not MachineComplete[name] then Stop(loopKey) return end
	Loop(loopKey, function() return MachineComplete[name] end, function()
		if not isIntermission() and Alive() then
			CompleteRemoteOnly(tag)
		end
	end, OnPhone and 0.9 or 0.55)
end

local function instantMachineOnce(name)
	local tag = name == "Arcane" and "ArcadeMachine" or (name == "Storage" and "StorageMachine" or "CoreyMachine")
	CompleteRemoteOnly(tag)
end

local Immunity = { Snuggles = false, Triplets = false, Dolly = false, Stargil = false }
local immStarConn
local immFanConn
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
	if not Immunity.Stargil then return end
	local function walk(node, depth)
		if not node or depth > 6 then return end
		for _, c in ipairs(node:GetChildren()) do
			if c:IsA("Model") and isStarGirlModel(c) then
				for _, d in ipairs(c:GetDescendants()) do
					if d:IsA("BasePart") and string.lower(d.Name):find("hitbox", 1, true) then
						pcall(function() d:Destroy() end)
					end
				end
			elseif c:IsA("Folder") or c:IsA("Model") then
				walk(c, depth + 1)
			end
		end
	end
	pcall(function() walk(Workspace, 0) end)
end

local function cacheFanWindParts()
	table.clear(fanWindParts)
	local function walk(node, depth)
		if not node or depth > 6 then return end
		for _, c in ipairs(node:GetChildren()) do
			if c:IsA("BasePart") and string.lower(c.Name):find("wind", 1, true) then
				local fan = c:FindFirstAncestorWhichIsA("Model")
				if fan and isFanModel(fan) then fanWindParts[c] = true end
			elseif c:IsA("Model") and isFanModel(c) then
				for _, d in ipairs(c:GetDescendants()) do
					if d:IsA("BasePart") and string.lower(d.Name):find("wind", 1, true) then fanWindParts[d] = true end
				end
			elseif c:IsA("Folder") or c:IsA("Model") then
				walk(c, depth + 1)
			end
		end
	end
	pcall(function() walk(Workspace, 0) end)
end

local function fanWindImmunity()
	if not Immunity.Dolly then return end
	local c = Char()
	local root = c and c:FindFirstChild("HumanoidRootPart")
	local h = Hum()
	if not root or not h then return end
	if next(fanWindParts) == nil then cacheFanWindParts() end
	local inside = false
	for part in pairs(fanWindParts) do
		if not part.Parent then fanWindParts[part] = nil else
			local lp = part.CFrame:PointToObjectSpace(root.Position)
			local half = part.Size * 0.5
			if math.abs(lp.X) <= half.X + 1 and math.abs(lp.Y) <= half.Y + 1 and math.abs(lp.Z) <= half.Z + 1 then inside = true break end
		end
	end
	if inside then
		local v = root.AssemblyLinearVelocity
		local move = h.MoveDirection
		if move.Magnitude > 0.05 then
			local speed = math.max(Vector3.new(v.X, 0, v.Z).Magnitude, h.WalkSpeed)
			root.AssemblyLinearVelocity = Vector3.new(move.X * speed, v.Y, move.Z * speed)
		else
			root.AssemblyLinearVelocity = Vector3.new(0, v.Y, 0)
		end
		root.AssemblyAngularVelocity = Vector3.zero
	end
end

local function stripImmunity()
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
	if Immunity.Stargil then stripStarGirlHitboxes() end
	if Immunity.Dolly then fanWindImmunity() end
end

local function startImmunityObservers()
	if Immunity.Stargil and not immStarConn then
		immStarConn = Workspace.DescendantAdded:Connect(function(obj)
			if not Immunity.Stargil or not obj:IsA("BasePart") then return end
			local model = obj:FindFirstAncestorWhichIsA("Model")
			if model and isStarGirlModel(model) and string.lower(obj.Name):find("hitbox", 1, true) then
				pcall(function() obj:Destroy() end)
			end
		end)
	end
	if Immunity.Dolly and not immFanConn then
		immFanConn = Workspace.DescendantAdded:Connect(function(obj)
			if not Immunity.Dolly or not obj:IsA("BasePart") then return end
			if string.lower(obj.Name):find("wind", 1, true) then
				local fan = obj:FindFirstAncestorWhichIsA("Model")
				if fan and isFanModel(fan) then fanWindParts[obj] = true end
			end
		end)
	end
end

local function stopImmunityObservers()
	if immStarConn then immStarConn:Disconnect(); immStarConn = nil end
	if immFanConn then immFanConn:Disconnect(); immFanConn = nil end
	table.clear(fanWindParts)
end

local function setImmunity(name, on)
	if Immunity[name] == nil then return end
	Immunity[name] = on == true
	if not (Immunity.Snuggles or Immunity.Triplets or Immunity.Dolly or Immunity.Stargil) then
		Stop("Imm")
		stopImmunityObservers()
		return
	end
	startImmunityObservers()
	stripImmunity()
	Loop("Imm", function() return Immunity.Snuggles or Immunity.Triplets or Immunity.Dolly or Immunity.Stargil end, stripImmunity, 0.15)
end

Managers.Immunity = { State = Immunity, Apply = stripImmunity, Set = setImmunity }

local function startTeleportFarm()
	Stop("Farm")
	Stop("Bring")
	Farm.on = true
	Bring.on = false
	Farm.doMach = true
	Farm.doExit = true
	Farm.doSafe = true
	Farm.doLoot = false
	Farm.doArc = true
	Farm.doSto = true
	Farm.doCor = true
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
	Loop("Farm", function() return Farm.on and State.FarmMode == "Teleport" end, function()
		if Settings.delayMs and Settings.delayMs > 0 then task.wait(Settings.delayMs / 1000) end
		farmTick()
	end, function() return math.max(0.08, Settings.pace) end)
end

local function startBringFarm()
	Stop("Farm")
	Stop("Bring")
	Farm.on = false
	Bring.on = true
	Bring.floors = 0
	FloorTrack.passed = 0
	FloorTrack.startFloor = readFloorNumber()
	FloorTrack.lastFloorNum = FloorTrack.startFloor
	FloorTrack.exitCounted = false
	FloorTrack.current = FloorTrack.startFloor
	FloorTrack.lastMap = ""
	Bring.coreyPhase = 0
	Bring.coreyDidOne = false
	onMapMaybeChanged()
	refreshChar(Me.Character)
	sessionReset("Bring")
	Loop("Bring", function() return Bring.on and State.FarmMode == "Bring" end, function()
		if Settings.delayMs and Settings.delayMs > 0 then task.wait(Settings.delayMs / 1000) end
		if not isIntermission() then
			FloorSession.mode = "Bring"
			sessionNoteCryptids()
		end
		bringTick()
	end, function() return math.max(0.08, Bring.pace) end)
end

local function stopSelectedFarm()
	Farm.on = false
	Bring.on = false
	Stop("Farm")
	Stop("Bring")
	Farm.state = "IDLE"
	Bring.status = "Idle"
	setFarmStatus("Idle")
end

local function setAutoFarm(on)
	if not on then
		stopSelectedFarm()
		return
	end
	if State.FarmMode == "Bring" then
		startBringFarm()
	else
		startTeleportFarm()
	end
end

local function setFarmMode(mode)
	State.FarmMode = mode == "Bring" and "Bring" or "Teleport"
	if Farm.on or Bring.on then setAutoFarm(true) end
end

local KeybindStates = {}
local KeybindTargets
local function triggerKeybindTarget(name)
	local target = KeybindTargets[name]
	if not target then return end
	if target.action then
		target.action()
		return
	end
	local current = false
	if target.get then
		local ok, value = pcall(target.get)
		if ok then current = value == true end
	end
	target.set(not current)
end

local function toggleKeybindTarget(name)
	local target = KeybindTargets[name]
	if not target then return end
	if target.action then
		target.action()
		return
	end
	local nextValue = not (KeybindStates[name] == true)
	KeybindStates[name] = nextValue
	target.set(nextValue)
end

local function getKeybindTargetState(name)
	return KeybindStates[name] == true
end

local function buildGodButton()
	local playerGui = Me:FindFirstChildOfClass("PlayerGui") or Me:WaitForChild("PlayerGui")
	local existing = playerGui:FindFirstChild("FunhouseGodButton")
	if existing then existing:Destroy() end
	local TweenService = game:GetService("TweenService")
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "FunhouseGodButton"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.Parent = playerGui

	local Holder = Instance.new("Frame")
	Holder.Size = UDim2.new(0, 90, 0, 90)
	Holder.Position = UDim2.new(0.5, -45, 0.5, -45)
	Holder.BackgroundTransparency = 1
	Holder.Parent = ScreenGui

	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.AnchorPoint = Vector2.new(0.5, 0.5)
	Button.Position = UDim2.new(0.5, 0, 0.5, 0)
	Button.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
	Button.AutoButtonColor = false
	Button.BorderSizePixel = 0
	Button.Text = ""
	Button.ClipsDescendants = true
	Button.Parent = Holder

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 20)
	Corner.Parent = Button

	local Stroke = Instance.new("UIStroke")
	Stroke.Color = Color3.fromRGB(90, 90, 100)
	Stroke.Thickness = 2
	Stroke.Transparency = 0.3
	Stroke.Parent = Button

	local Glow = Instance.new("ImageLabel")
	Glow.Size = UDim2.new(1, 70, 1, 70)
	Glow.AnchorPoint = Vector2.new(0.5, 0.5)
	Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
	Glow.BackgroundTransparency = 1
	Glow.Image = "rbxassetid://5028857084"
	Glow.ImageColor3 = Color3.fromRGB(114, 87, 255)
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
	Label.Size = UDim2.new(1, 0, 1, 0)
	Label.AnchorPoint = Vector2.new(0.5, 0.5)
	Label.Position = UDim2.new(0.5, 0, 0.5, 0)
	Label.BackgroundTransparency = 1
	Label.Text = "God"
	Label.Font = Enum.Font.GothamBold
	Label.TextSize = 20
	Label.TextColor3 = Color3.fromRGB(190, 190, 195)
	Label.TextTransparency = 0
	Label.ZIndex = 2
	Label.Parent = Button

	local ColorOff = Color3.fromRGB(30, 30, 36)
	local ColorOn = Color3.fromRGB(114, 87, 255)
	local StrokeOff = Color3.fromRGB(90, 90, 100)
	local StrokeOn = Color3.fromRGB(180, 165, 255)
	local TextOff = Color3.fromRGB(190, 190, 195)
	local TextOn = Color3.fromRGB(255, 255, 255)

	local activated = false
	local animating = false
	local glowTween

	local function playRipple()
		Ripple.Size = UDim2.new(0, 0, 0, 0)
		Ripple.BackgroundTransparency = 0.55
		TweenService:Create(Ripple, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 180, 0, 180),
			BackgroundTransparency = 1,
		}):Play()
	end

	local function animateText(turningOn)
		local targetColor = turningOn and TextOn or TextOff
		local out = TweenService:Create(Label, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			TextTransparency = 1,
			TextSize = turningOn and 24 or 16,
		})
		out:Play()
		task.delay(0.1, function()
			Label.TextColor3 = targetColor
			local inn = TweenService:Create(Label, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				TextTransparency = 0,
				TextSize = 20,
			})
			inn:Play()
		end)
	end

	local function turnOn()
		playRipple()
		animateText(true)
		TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(0.82, 0, 0.82, 0) }):Play()
		task.delay(0.1, function()
			TweenService:Create(Button, TweenInfo.new(0.45, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 1, 0) }):Play()
		end)
		TweenService:Create(Button, TweenInfo.new(0.3), { BackgroundColor3 = ColorOn }):Play()
		TweenService:Create(Stroke, TweenInfo.new(0.3), { Color = StrokeOn, Transparency = 0, Thickness = 2.5 }):Play()
		TweenService:Create(Glow, TweenInfo.new(0.3), { ImageTransparency = 0.4 }):Play()
		if glowTween then pcall(function() glowTween:Cancel() end) end
		glowTween = TweenService:Create(Glow, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { ImageTransparency = 0.65 })
		glowTween:Play()
	end

	local function turnOff()
		playRipple()
		animateText(false)
		if glowTween then pcall(function() glowTween:Cancel() end) glowTween = nil end
		TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(0.85, 0, 0.85, 0) }):Play()
		task.delay(0.1, function()
			TweenService:Create(Button, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 1, 0) }):Play()
		end)
		TweenService:Create(Button, TweenInfo.new(0.3), { BackgroundColor3 = ColorOff }):Play()
		TweenService:Create(Stroke, TweenInfo.new(0.3), { Color = StrokeOff, Transparency = 0.3, Thickness = 2 }):Play()
		TweenService:Create(Glow, TweenInfo.new(0.3), { ImageTransparency = 1 }):Play()
	end

	local function activateSelected()
		for name in pairs(KeybindTargets) do
			if getKeybindTargetState(name) then
				triggerKeybindTarget(name)
			end
		end
	end

	local dragging = false
	local dragInput
	local dragStart
	local startPos
	local moved = false
	local function startDrag(input)
		dragging = true
		moved = false
		dragStart = input.Position
		startPos = Holder.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
	local function updateDrag(input)
		if not dragging then return end
		local delta = input.Position - dragStart
		if delta.Magnitude > 4 then moved = true end
		Holder.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	Button.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then startDrag(input) end
	end)
	Button.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
	end)
	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then updateDrag(input) end
	end)
	Button.MouseButton1Click:Connect(function()
		if moved or animating then moved = false return end
		animating = true
		activated = not activated
		activateSelected()
		if activated then turnOn() else turnOff() end
		task.delay(0.5, function() animating = false end)
	end)
	Button.MouseEnter:Connect(function()
		if not UIS.TouchEnabled then TweenService:Create(Stroke, TweenInfo.new(0.15), { Thickness = activated and 3 or 2.5 }):Play() end
	end)
	Button.MouseLeave:Connect(function()
		if not UIS.TouchEnabled then TweenService:Create(Stroke, TweenInfo.new(0.15), { Thickness = activated and 2.5 or 2 }):Play() end
	end)

	Holder.Size = UDim2.new(0, 0, 0, 0)
	Button.BackgroundTransparency = 1
	Stroke.Transparency = 1
	Label.TextTransparency = 1
	Holder.Size = UDim2.new(0, 90, 0, 90)
	Button.Size = UDim2.new(0, 0, 0, 0)
	Button.BackgroundTransparency = 0
	TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 1, 0) }):Play()
	TweenService:Create(Stroke, TweenInfo.new(0.5), { Transparency = 0.3 }):Play()
	task.delay(0.25, function()
		TweenService:Create(Label, TweenInfo.new(0.4), { TextTransparency = 0 }):Play()
	end)
end

KeybindTargets = {
	["Disable rendering"] = { get = function() return State.DisableRendering end, set = setDisableRendering },
	["Unlock Camare"] = { get = function() return State.UnlockCamera end, set = setUnlockCamera },
	["Protect Usernames"] = { get = function() return State.ProtectUsernames end, set = setProtectUsernames },
	["Fly"] = { get = function() return flyWant end, set = SetFly },
	["Noclip"] = { get = function() return Util.noclip end, set = function(v) Util.noclip = v == true; if not v then Stop("Noclip"); DisconnectKey("noclip"); setNoclip(false) else setNoclip(true); Loop("Noclip", function() return Util.noclip end, function() setNoclip(true) end, 0.15) end end },
	["TeleportWalk"] = { get = function() return TW.on end, set = function(v) TW.on = v == true; if TW.on then startTPWalk() else stopTPWalk() end end },
	["Anti-AFK"] = { get = function() return Util.afk end, set = function(v) Util.afk = v == true; DisconnectKey("afk"); if Util.afk then Conn("afk", Me.Idled:Connect(function() pcall(function() VirtualUser:CaptureController(); VirtualUser:ClickButton2(Vector2.new()) end) end)) end end },
	["Infinite Stamina"] = { get = function() return Util.maxStam end, set = function(v) Util.maxStam = v == true; if not v then Stop("Stam") else staminaTick(); Loop("Stam", function() return Util.maxStam end, staminaTick, 0.18) end end },
	["Always Run"] = { get = function() return State.AlwaysRun end, set = setAlwaysRun },
	["Instant Die"] = { action = instantDie },
	["No Busy Lock"] = { get = function() return Util.noBusy end, set = function(v) Util.noBusy = v == true; if not v then Stop("Busy") else Loop("Busy", function() return Util.noBusy end, busyTick, 0.15) end end },
	["Auto Vote Card"] = { get = function() return State.AutoVoteEnabled end, set = function(v) State.AutoVoteEnabled = v == true; if State.AutoVoteEnabled then setAutoVoteCard(State.AutoVoteCard) else DisconnectKey("autoVote") end end },
	["Auto Machines"] = { get = function() return Features.autoMachines end, set = function(v) Features.autoMachines = v == true; if not v then Stop("AutoMach") else Loop("AutoMach", function() return Features.autoMachines end, autoMachinesTick, OnPhone and 1.0 or 0.75) end end },
	["Auto Exit"] = { get = function() return Features.autoExit end, set = function(v) Features.autoExit = v == true; if not v then Stop("AutoEx") else Loop("AutoEx", function() return Features.autoExit end, autoExitTick, OnPhone and 1.4 or 1.0) end end },
	["Auto Escape Cryptids"] = { get = function() return State.AutoEscape end, set = function(v) State.AutoEscape = v == true; if not v then Stop("AutoEscape") else Loop("AutoEscape", function() return State.AutoEscape end, autoEscapeTick, 0.15) end end },
	["Instant Complete Arcane"] = { get = function() return MachineComplete.Arcane end, set = function(v) setInstantMachine("Arcane", v) end },
	["Instant complete Storage"] = { get = function() return MachineComplete.Storage end, set = function(v) setInstantMachine("Storage", v) end },
	["Instant complete Tree"] = { get = function() return MachineComplete.Tree end, set = function(v) setInstantMachine("Tree", v) end },
	["Immunity Snuggles"] = { get = function() return Immunity.Snuggles end, set = function(v) setImmunity("Snuggles", v) end },
	["Immunity Triplets"] = { get = function() return Immunity.Triplets end, set = function(v) setImmunity("Triplets", v) end },
	["immunity Dolly"] = { get = function() return Immunity.Dolly end, set = function(v) setImmunity("Dolly", v) end },
	["Immunity Stargil"] = { get = function() return Immunity.Stargil end, set = function(v) setImmunity("Stargil", v) end },
	["Auto-Farm"] = { get = function() return Farm.on or Bring.on end, set = setAutoFarm },
}

local function getDetectedOutcasts()
	local out = {}
	local seen = {}
	for _, obj in ipairs(Workspace:GetDescendants()) do
		if obj:IsA("Model") and not IsPlayerChar(obj) then
			local name = string.lower(tostring(obj.Name))
			local charName = string.lower(tostring(obj:GetAttribute("CharacterName") or ""))
			if name:find("outcast", 1, true) or charName:find("outcast", 1, true) then
				local label = tostring(obj:GetAttribute("CharacterName") or obj.Name)
				if not seen[label] then seen[label] = true table.insert(out, label) end
			end
		end
	end
	if #out == 0 then table.insert(out, "No detected Outcasts") end
	table.sort(out)
	return out
end

local CFG_FOLDER = "FunhouseSW_CFGS"
local AUTOLOAD_FILE = CFG_FOLDER .. "/_autoload.ec"
local function cfgPath(name)
	return CFG_FOLDER .. "/" .. tostring(name) .. ".ec"
end

local function ensureCfgFolder()
	if isfolder and not isfolder(CFG_FOLDER) then pcall(function() makefolder(CFG_FOLDER) end) end
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

local function serializeSettings()
	return {
		State = {
			UIColor = State.UIColor,
			AntiLag = State.AntiLag,
			DisableRendering = State.DisableRendering,
			UnlockCamera = State.UnlockCamera,
			ProtectUsernames = State.ProtectUsernames,
			FOVEnabled = State.FOVEnabled,
			FOV = State.FOV,
			CameraMinZoom = State.CameraMinZoom,
			CameraMaxZoom = State.CameraMaxZoom,
			AlwaysRun = State.AlwaysRun,
			RunSpeed = State.RunSpeed,
			AutoVoteCard = State.AutoVoteCard,
			AutoVoteEnabled = State.AutoVoteEnabled,
			AutoEscape = State.AutoEscape,
			NoMinigames = State.NoMinigames,
			AntiFailMinigames = State.AntiFailMinigames,
			DeleteMachineCollisions = State.DeleteMachineCollisions,
			AuraMachines = State.AuraMachines,
			AuraBlacklistMachines = State.AuraBlacklistMachines,
			FarmMode = State.FarmMode,
		},
		Settings = Settings,
		Util = {
			flySpeed = Util.flySpeed,
		},
		ESP = { on = ESP.on, bl = ESP.bl, blItem = ESP.blItem, blOutcast = ESP.blOutcast, tags = ESP.tags },
		Farm = {
			doMach = Farm.doMach, doExit = Farm.doExit, doSafe = Farm.doSafe,
			doArc = Farm.doArc, doSto = Farm.doSto, doCor = Farm.doCor, doLoot = Farm.doLoot,
		},
		Bring = {
			tries = Bring.tries, pace = Bring.pace,
		},
		Machines = MachineComplete,
		Immunity = Immunity,
		KeybindStates = KeybindStates,
	}
end

local function applyConfig(data)
	if type(data) ~= "table" then return end
	if type(data.State) == "table" then
		for k, v in pairs(data.State) do
			if State[k] ~= nil then State[k] = v end
		end
	end
	if type(data.Settings) == "table" then
		for k, v in pairs(data.Settings) do if Settings[k] ~= nil then Settings[k] = v end end
	end
	if type(data.Util) == "table" and data.Util.flySpeed ~= nil then Util.flySpeed = tonumber(data.Util.flySpeed) or Util.flySpeed end
	if type(data.ESP) == "table" then
		if type(data.ESP.on) == "table" then for k, v in pairs(data.ESP.on) do if ESP.on[k] ~= nil then ESP.on[k] = v end end end
		if type(data.ESP.bl) == "table" then for k, v in pairs(data.ESP.bl) do if ESP.bl[k] ~= nil then ESP.bl[k] = v end end end
		if type(data.ESP.blItem) == "table" then ESP.blItem = data.ESP.blItem end
		if type(data.ESP.blOutcast) == "table" then ESP.blOutcast = data.ESP.blOutcast end
		if type(data.ESP.tags) == "table" then for k, v in pairs(data.ESP.tags) do if ESP.tags[k] ~= nil then ESP.tags[k] = v end end end
	end
	if type(data.Farm) == "table" then for k, v in pairs(data.Farm) do if Farm[k] ~= nil then Farm[k] = v end end end
	if type(data.Bring) == "table" then for k, v in pairs(data.Bring) do if Bring[k] ~= nil then Bring[k] = v end end end
	if type(data.Machines) == "table" then for k, v in pairs(data.Machines) do if MachineComplete[k] ~= nil then MachineComplete[k] = v == true end end end
	if type(data.Immunity) == "table" then for k, v in pairs(data.Immunity) do if Immunity[k] ~= nil then Immunity[k] = v == true end end end
	if type(data.KeybindStates) == "table" then for k, v in pairs(data.KeybindStates) do KeybindStates[k] = v == true end end
end

local function setAutoMachines(on)
	Features.autoMachines = on == true
	if not Features.autoMachines then Stop("AutoMach") return end
	Loop("AutoMach", function() return Features.autoMachines end, autoMachinesTick, OnPhone and 1.0 or 0.75)
end

local function setAutoExit(on)
	Features.autoExit = on == true
	if not Features.autoExit then Stop("AutoEx") return end
	Loop("AutoEx", function() return Features.autoExit end, autoExitTick, OnPhone and 1.4 or 1.0)
end

local function setAutoEscape(on)
	State.AutoEscape = on == true
	if not State.AutoEscape then Stop("AutoEscape") return end
	Loop("AutoEscape", function() return State.AutoEscape end, autoEscapeTick, 0.15)
end

local function setAntiFailMinigames(on)
	State.AntiFailMinigames = on == true
	Features.minigameOn = State.AntiFailMinigames or State.NoMinigames
	if not Features.minigameOn then Stop("MiniA") return end
	Loop("MiniA", function() return Features.minigameOn end, minigameTick, OnPhone and 0.7 or 0.4)
end

local function setNoMinigames(on)
	State.NoMinigames = on == true
	Features.minigameOn = State.AntiFailMinigames or State.NoMinigames
	if not Features.minigameOn then Stop("MiniA") return end
	Loop("MiniA", function() return Features.minigameOn end, function()
		minigameTick()
		if State.NoMinigames and not isIntermission() and Alive() then
			CompleteRemoteOnly("ArcadeMachine")
			CompleteRemoteOnly("StorageMachine")
			CompleteRemoteOnly("CoreyMachine")
		end
	end, OnPhone and 0.7 or 0.4)
end

KeybindTargets["Auto Machines"].set = setAutoMachines
KeybindTargets["Auto Exit"].set = setAutoExit
KeybindTargets["Auto Escape Cryptids"].set = setAutoEscape

local function refreshESP()
	if not anyESP() then
		Stop("ESP")
		DisconnectKey("espItems")
		DisconnectKey("espItemRemoved")
		clearESP()
	else
		Loop("ESP", anyESP, espScan, ESP.scanInterval)
		if ESP.on.Items and not ESP.itemHooked then
			ESP.itemHooked = true
			local pending = false
			Conn("espItems", Workspace.DescendantAdded:Connect(function(o)
				if not ESP.on.Items or pending then return end
				local tagged = false
				pcall(function() tagged = CS:HasTag(o, "Spawneditem") or CS:HasTag(o, "SpawnedItem") end)
				if not tagged then return end
				pending = true
				task.delay(0.16, function()
					pending = false
					if ESP.on.Items and anyESP() then ESP.scanAgain = true if not ESP.scanBusy then espScan() end end
				end)
			end))
			Conn("espItemRemoved", Workspace.DescendantRemoving:Connect(function(o)
				if ESP.cache[o] then removeESP(o) end
			end))
		end
	end
end

local oldEspOn = ESP.on
ESP.on = oldEspOn
ESP.on.Outcast = false
ESP.colors.Outcast = Color3.fromRGB(255, 140, 220)
ESP.bl.Outcast = false
ESP.blOutcast = {}

local originalIsEspHidden = isEspHidden
isEspHidden = function(cat, machineType)
	if cat == "Outcast" then return ESP.bl.Outcast == true end
	return originalIsEspHidden(cat, machineType)
end

local originalEspScanWork = espScanWork
espScanWork = function()
	local ok = pcall(originalEspScanWork)
	if not ok then return end
	if not ESP.on.Outcast then return end
	local seenExisting = ESP.cache
	local r = Root()
	local created = 0
	for _ in pairs(seenExisting) do created += 1 end
	for _, obj in ipairs(Workspace:GetDescendants()) do
		if created >= ESP.maxObjects then break end
		if obj:IsA("Model") and not IsPlayerChar(obj) then
			local n = string.lower(tostring(obj.Name))
			local cn = string.lower(tostring(obj:GetAttribute("CharacterName") or ""))
			if n:find("outcast", 1, true) or cn:find("outcast", 1, true) then
				local label = string.lower(tostring(obj:GetAttribute("CharacterName") or obj.Name))
				if ESP.blOutcast[label] then continue end
				local p = Part(obj)
				if p and (not r or (p.Position - r.Position).Magnitude <= ESP.maxDistance) then
					local data = ensureHL(obj, ESP.colors.Outcast)
					if data then setTagText(data, tostring(obj:GetAttribute("CharacterName") or obj.Name)); created += 1 end
				end
			end
		end
	end
end


local okWin, Window = pcall(function()
	return WindUI:CreateWindow({
		NewElements = true,
		Title = "Funhouse | SW",
		Icon = ASSETS.Icon,
		Author = "by .HS & .GH",
		Folder = "FunhouseSW",
		Size = UDim2.fromOffset(OnPhone and 480 or 640, OnPhone and 420 or 500),
		MinSize = Vector2.new(OnPhone and 360 or 520, OnPhone and 300 or 360),
		MaxSize = Vector2.new(950, 700),
		ToggleKey = Enum.KeyCode.LeftShift,
		Theme = "Dark",
		Resizable = true,
		SideBarWidth = OnPhone and 180 or 220,
		HideSearchBar = false,
		ScrollBarEnabled = true,
		OpenButton = {
			Title = "Funhouse | SW",
			Enabled = true,
			Draggable = true,
			OnlyMobile = false,
			Scale = OnPhone and 1.25 or 1.15,
		},
		User = { Enabled = true, Anonymous = true },
	})
end)

if not okWin or not Window then
	return
end

pcall(function()
	Window:Tag({
		Title = VERSION,
		Icon = "wrench",
		Color = Color3.fromHex("#F97316"),
		Border = true,
	})
end)

local function SafeCreate(callback)
	local ok = pcall(callback)
	return ok
end

local function SafeElement(section, method, data)
	if not section then return nil end
	local fn = section[method]
	if type(fn) ~= "function" then return nil end
	if method == "Slider" and type(data.Value) ~= "table" then
		data.Value = { Min = tonumber(data.Min) or 0, Max = tonumber(data.Max) or 100, Default = tonumber(data.Value) or 0 }
		data.Min = nil
		data.Max = nil
		if data.Step == nil then data.Step = 1 end
	end
	local ok, result = pcall(function() return fn(section, data) end)
	if ok then return result end
	return nil
end

local function SelectableTab(section, data)
	local ok, tab = pcall(function() return section:Tab(data) end)
	if ok then return tab end
	return nil
end

local MainSection = Window:Section({ Title = "Main", Opened = true })
local FeaturesSection = Window:Section({ Title = "Features", Opened = true })
local SettingsSection = Window:Section({ Title = "Settings", Opened = true })

SafeCreate(function()
	local tab = SelectableTab(MainSection, { Title = "Home", Icon = "info" })
	local info = tab:Section({ Title = "Information", Opened = true })
	SafeElement(info, "Paragraph", {
		Title = "Support Executors",
		Desc = "> ## Mobile\n> - 🟢 **[Delta](https://deltaexploits.dev)** `Preferred executor of choice by the owners. Rejoining does not work unless you disable Verify Teleports.`\n> - 🟢 **[Codex](https://codex.lol)**\n> ## Desktop\n> ### macOS\n> - 🟢 **[Opiumware](https://use.opiumware.today)** `Preferred executor of choice by the owners.`\n> - 🟢 **[Hydrogen](https://hydrogen.lat)**\n> - 🟢 **[Macsploit](https://raptor.fun)**\n> ### Windows\n> - 🟢 **[Volt](https://voltbz.net)** `Preferred executor of choice by the owners.`\n> - 🟢 **[Madium](https://getmadium.net)** `Preferred executor of choice by the owners.`\n> - 🟢﻿ **[Real](https://realest.gg/)**\n> - 🟢 **[Velocity](https://getvelocity.llc)**\n> - 🟢 **[Potassium](https://www.potassium.pro)**\n> - 🟡 **[Solara](https://getsolara.dev)** `Preferred keyless executor of choice by the owners. This executor is unstable on Animal Hospital, otherwise works fine. Some features might not be available on same games due to the lack of executor function support.`\n> - 🟠/🔴 **[Xeno](https://www.xeno.onl)** `this executor fucking sucks and is absolute bullshit, do not ever juse this executor, solara is better than this shit`"
	})
	SafeElement(info, "Paragraph", {
		Title = "Supported Games",
		Desc = "Funhouse\nDeltarune Fight",
	})
end, "Home")

SafeCreate(function()
	local tab = SelectableTab(FeaturesSection, { Title = "Visual", Icon = "eye" })
	local general = tab:Section({ Title = "General", Opened = true })
	SafeElement(general, "Toggle", { Title = "Fullbright", Value = Util.fullbright, Callback = function(v) Util.fullbright = v == true; if v then if not lightSnap then snapLighting() end Loop("FB", function() return Util.fullbright end, applyFullbright, 0.35) else Stop("FB"); restoreLighting() end end })
	SafeElement(general, "Toggle", { Title = "No-fog", Value = Util.nofog, Callback = function(v) Util.nofog = v == true; if v then if not lightSnap then snapLighting() end Loop("Fog", function() return Util.nofog end, applyNoFog, 0.35) else Stop("Fog"); restoreFog() end end })
	SafeElement(general, "Toggle", { Title = "Anti-lag", Value = State.AntiLag, Callback = applyAntiLag })
	SafeElement(general, "Toggle", { Title = "Disable rendering", Value = State.DisableRendering, Callback = setDisableRendering })
	SafeElement(general, "Toggle", { Title = "unlock Camera", Value = State.UnlockCamera, Callback = setUnlockCamera })
	SafeElement(general, "Toggle", { Title = "Protect Usernames", Value = State.ProtectUsernames, Callback = setProtectUsernames })
	SafeElement(general, "Toggle", { Title = "field of view", Value = State.FOVEnabled, Callback = applyFOVEnabled })
	SafeElement(general, "Slider", { Title = "Max camera zoom", Value = 128, Min = 0.5, Max = 128, Step = 0.5, Callback = function(v) State.CameraMaxZoom = tonumber(v) or 128; if State.UnlockCamera then applyCamera() end end })
	SafeElement(general, "Slider", { Title = "Min camera zoom", Value = 0.5, Min = 0.5, Max = 64, Step = 0.5, Callback = function(v) State.CameraMinZoom = tonumber(v) or 0.5; if State.UnlockCamera then applyCamera() end end })

	local visual = tab:Section({ Title = "Visual", Opened = true })
	local function setESP(name, value)
		ESP.on[name] = value == true
		refreshESP()
	end
	SafeElement(visual, "Toggle", { Title = "Cryptids", Value = ESP.on.Cryptids, Callback = function(v) setESP("Cryptids", v) end })
	SafeElement(visual, "Toggle", { Title = "Outcast", Value = ESP.on.Outcast, Callback = function(v) setESP("Outcast", v) end })
	SafeElement(visual, "Toggle", { Title = "Players", Value = ESP.on.Pals, Callback = function(v) setESP("Pals", v) end })
	SafeElement(visual, "Toggle", { Title = "Items", Value = ESP.on.Items, Callback = function(v) setESP("Items", v) end })
	SafeElement(visual, "Toggle", { Title = "Machines", Value = false, Callback = function(v) ESP.on.Storages = v == true; ESP.on.Arcanes = v == true; ESP.on.Coreys = v == true; refreshESP() end })

	local bl = tab:Section({ Title = "Blacklist", Opened = true })
	local function selectedList(v)
		if type(v) == "table" then return v end
		if type(v) == "string" and v ~= "" then return { v } end
		return {}
	end
	SafeElement(bl, "Dropdown", {
		Title = "Cryptids Blacklist",
		Values = { "Anton", "Manny", "Split", "Freddie", "Mabel", "Dusty", "Corey", "Stargil", "Fan" },
		Value = {}, Multi = true, AllowNone = true,
		Callback = function(v)
			local set = {}
			for _, name in ipairs(selectedList(v)) do set[tostring(name)] = true end
			ESP.bl.Anton = set.Anton == true
			ESP.bl.Manny = set.Manny == true
			ESP.bl.Split = set.Split == true
			ESP.bl.Freddie = set.Freddie == true
			ESP.bl.Mabel = set.Mabel == true
			ESP.bl.Dusty = set.Dusty == true
			ESP.bl.CoreyCryptid = set.Corey == true
			ESP.bl.Stargil = set.Stargil == true
			ESP.bl.Fan = set.Fan == true
			ESP.bl.Cryptids = false
		end,
	})
	SafeElement(bl, "Dropdown", {
		Title = "Outcast Blacklist",
		Values = getDetectedOutcasts(), Value = {}, Multi = true, AllowNone = true,
		Callback = function(v)
			ESP.blOutcast = {}
			for _, name in ipairs(selectedList(v)) do
				local textValue = tostring(name)
				if textValue ~= "No detected Outcasts" then ESP.blOutcast[string.lower(textValue)] = true end
			end
		end,
	})
	SafeElement(bl, "Dropdown", {
		Title = "Machines Blacklist",
		Values = { "Arcane", "Storage", "Tree" }, Value = {}, Multi = true, AllowNone = true,
		Callback = function(v)
			local set = {}
			for _, name in ipairs(selectedList(v)) do set[tostring(name)] = true end
			ESP.bl.Corey = set.Tree == true
			ESP.bl.Storage = set.Storage == true
			ESP.bl.Arcane = set.Arcane == true
			ESP.bl.Machines = ESP.bl.Corey and ESP.bl.Storage and ESP.bl.Arcane
		end,
	})
	SafeElement(bl, "Dropdown", {
		Title = "Items Blacklist",
		Values = { "All Items", "Bananas", "Chomp-a-Chino", "Crazed Marshmallows", "Mystery Box", "Corndog", "Medkit", "Bandage", "Remnant", "Remote", "Noisy Clock", "Flesh", "Firework", "Funco", "Soup", "Grappling" },
		Value = {}, Multi = true, AllowNone = true,
		Callback = function(v)
			ESP.blItem = {}
			ESP.bl.Items = false
			for _, name in ipairs(selectedList(v)) do
				local low = string.lower(tostring(name))
				if name == "All Items" then ESP.bl.Items = true else ESP.blItem[low] = true end
			end
		end,
	})

	local colors = tab:Section({ Title = "Colors", Opened = true })
	SafeElement(colors, "Colorpicker", { Title = "Cryptids", Default = ESP.colors.Cryptids, Callback = function(c) ESP.colors.Cryptids = c end })
	SafeElement(colors, "Colorpicker", { Title = "Outcast", Default = ESP.colors.Outcast, Callback = function(c) ESP.colors.Outcast = c end })
	SafeElement(colors, "Colorpicker", { Title = "Pals", Default = ESP.colors.Pals, Callback = function(c) ESP.colors.Pals = c end })
	SafeElement(colors, "Colorpicker", { Title = "Items", Default = ESP.colors.Items, Callback = function(c) ESP.colors.Items = c end })
	SafeElement(colors, "Colorpicker", { Title = "Machines", Default = ESP.colors.Arcanes, Callback = function(c) ESP.colors.Arcanes = c; ESP.colors.Storages = c; ESP.colors.Coreys = c end })
end, "Visual")

SafeCreate(function()
	local tab = SelectableTab(FeaturesSection, { Title = "Automatic", Icon = "zap" })
	local general = tab:Section({ Title = "General", Opened = true })
	SafeElement(general, "Toggle", { Title = "Fly", Value = flyWant, Callback = SetFly })
	SafeElement(general, "Toggle", { Title = "Noclip", Value = Util.noclip, Callback = KeybindTargets["Noclip"].set })
	SafeElement(general, "Toggle", { Title = "TeleportWalk", Value = TW.on, Callback = function(v) TW.on = v == true; if TW.on then startTPWalk() else stopTPWalk() end end })
	SafeElement(general, "Slider", { Title = "TeleportWalk Speed", Value = 3, Min = 1, Max = 15, Step = 0.5, Callback = function(v) TW.speed = math.clamp(tonumber(v) or 3, 1, 15) end })
	SafeElement(general, "Toggle", { Title = "Anti-AFK", Value = Util.afk, Callback = KeybindTargets["Anti-AFK"].set })
	SafeElement(general, "Toggle", { Title = "Infinite Stamina", Value = Util.maxStam, Callback = KeybindTargets["Infinite Stamina"].set })
	SafeElement(general, "Toggle", { Title = "Always run", Value = State.AlwaysRun, Callback = setAlwaysRun })
	SafeElement(general, "Toggle", { Title = "Run Speed", Value = State.RunSpeed, Callback = setRunSpeed })
	SafeElement(general, "Button", { Title = "Instant Die", Callback = instantDie })
	SafeElement(general, "Toggle", { Title = "No Busy Lock", Value = Util.noBusy, Callback = KeybindTargets["No Busy Lock"].set })
	SafeElement(general, "Dropdown", { Title = "Auto Vote Card", Values = getCardOptions(), Value = State.AutoVoteCard, Callback = setAutoVoteCard })
	SafeElement(general, "Toggle", { Title = "Auto Exit", Value = Features.autoExit, Callback = setAutoExit })
	SafeElement(general, "Toggle", { Title = "Auto Escape Cryptids", Value = State.AutoEscape, Callback = setAutoEscape })

	local machines = tab:Section({ Title = "Machines", Opened = true })
	SafeElement(machines, "Toggle", { Title = "Instant Complete Arcane", Value = MachineComplete.Arcane, Callback = function(v) setInstantMachine("Arcane", v) end })
	SafeElement(machines, "Toggle", { Title = "Instant Complete Storage", Value = MachineComplete.Storage, Callback = function(v) setInstantMachine("Storage", v) end })
	SafeElement(machines, "Toggle", { Title = "Instant Complete Tree", Value = MachineComplete.Tree, Callback = function(v) setInstantMachine("Tree", v) end })
	SafeElement(machines, "Button", { Title = "Instant Complete Arcane", Callback = function() instantMachineOnce("Arcane") end })
	SafeElement(machines, "Button", { Title = "Instant Complete Storage", Callback = function() instantMachineOnce("Storage") end })
	SafeElement(machines, "Button", { Title = "Instant Complete Tree", Callback = function() instantMachineOnce("Tree") end })
	SafeElement(machines, "Toggle", { Title = "Aura Machines", Value = State.AuraMachines, Callback = function(v) State.AuraMachines = v == true; if not State.AuraMachines then Stop("AuraMachines") else Loop("AuraMachines", function() return State.AuraMachines end, auraMachinesTick, OnPhone and 1.0 or 0.6) end end })
	SafeElement(machines, "Dropdown", { Title = "Aura Blacklist Machines", Values = { "Arcane", "Storage", "Tree" }, Value = {}, Multi = true, AllowNone = true, Callback = setMachineAuraBlacklist })
	SafeElement(machines, "Toggle", { Title = "Delete Collisions on Machine", Value = State.DeleteMachineCollisions, Callback = applyMachineCollisions })
	SafeElement(machines, "Toggle", { Title = "Anti-Fail Minigames", Value = State.AntiFailMinigames, Callback = setAntiFailMinigames })
	SafeElement(machines, "Toggle", { Title = "No Minigames", Value = State.NoMinigames, Callback = setNoMinigames })

	local debuffs = tab:Section({ Title = "Debuffs", Opened = true })
	SafeElement(debuffs, "Toggle", { Title = "Anti Rotten Banana", Value = Debuff.RottenBanana, Callback = function(v) setDebuff("RottenBanana", v) end })
	SafeElement(debuffs, "Toggle", { Title = "Anti Butter", Value = Debuff.Butter, Callback = function(v) setDebuff("Butter", v) end })
	SafeElement(debuffs, "Toggle", { Title = "Anti Puddle", Value = Debuff.Puddle, Callback = function(v) setDebuff("Puddle", v) end })

	local entities = tab:Section({ Title = "Entities", Opened = true })
	SafeElement(entities, "Toggle", { Title = "Immunity Snuggles", Value = Immunity.Snuggles, Callback = function(v) setImmunity("Snuggles", v) end })
	SafeElement(entities, "Toggle", { Title = "Immunity Triplets", Value = Immunity.Triplets, Callback = function(v) setImmunity("Triplets", v) end })
	SafeElement(entities, "Toggle", { Title = "Immunity Dolly", Value = Immunity.Dolly, Callback = function(v) setImmunity("Dolly", v) end })
	SafeElement(entities, "Toggle", { Title = "Immunity Stargil", Value = Immunity.Stargil, Callback = function(v) setImmunity("Stargil", v) end })
end, "Automatic")

SafeCreate(function()
	local tab = SelectableTab(FeaturesSection, { Title = "Auto-Farm", Icon = "gamepad" })
	local general = tab:Section({ Title = "General", Opened = true })
	SafeElement(general, "Toggle", { Title = "Auto-Farm", Value = Farm.on or Bring.on, Callback = setAutoFarm })
	SafeElement(general, "Dropdown", { Title = "Type", Values = { "Teleport", "Bring" }, Value = State.FarmMode, Callback = setFarmMode })
	SafeElement(general, "Toggle", { Title = "Wall Check Cryptid", Value = Settings.wallCheck, Callback = function(v) Settings.wallCheck = v == true end })
	SafeElement(general, "Toggle", { Title = "Check Cryptid", Value = Settings.checkCryptid, Callback = function(v) Settings.checkCryptid = v == true end })

	local settings = tab:Section({ Title = "Settings", Opened = true })
	SafeElement(settings, "Slider", { Title = "Delay MS", Value = 0, Min = 0, Max = 1000, Step = 10, Callback = function(v) Settings.delayMs = math.max(0, tonumber(v) or 0); State.DelayMS = Settings.delayMs end })
	SafeElement(settings, "Slider", { Title = "Farm Speed", Value = 1.0, Min = 0.4, Max = 2.5, Step = 0.1, Callback = function(v) local n = tonumber(v) or 1; Settings.pace = n; Bring.pace = n end })
	SafeElement(settings, "Slider", { Title = "Machine Delay", Value = Settings.machCd, Min = 0.5, Max = 4, Step = 0.1, Callback = function(v) Settings.machCd = tonumber(v) or 1.6 end })
	SafeElement(settings, "Slider", { Title = "Exit Delay", Value = Settings.exitCd, Min = 1, Max = 5, Step = 0.1, Callback = function(v) Settings.exitCd = tonumber(v) or 2.2 end })
	SafeElement(settings, "Slider", { Title = "Cryptid Distance", Value = Settings.safeDist, Min = 24, Max = 90, Step = 2, Callback = function(v) Settings.safeDist = tonumber(v) or 52 end })
	SafeElement(settings, "Slider", { Title = "Distance Height", Value = Settings.exitY, Min = 0, Max = 6, Step = 0.5, Callback = function(v) Settings.exitY = tonumber(v) or 2.5 end })
end, "Auto-Farm")

SafeCreate(function()
	local tab = SelectableTab(FeaturesSection, { Title = "Keybinds", Icon = "keyboard" })
	local section = tab:Section({ Title = "Keybinds", Opened = true })
	local names = {
		"Disable rendering", "Unlock Camare", "Protect Usernames", "Fly", "Noclip", "TeleportWalk", "Anti-AFK", "Infinite Stamina", "Always Run", "Instant Die", "No Busy Lock", "Auto Vote Card", "Auto Machines", "Auto Exit", "Auto Escape Cryptids", "Instant Complete Arcane", "Instant complete Storage", "Instant complete Tree", "Immunity Snuggles", "Immunity Triplets", "immunity Dolly", "Immunity Stargil", "Auto-Farm"
	}
	for _, name in ipairs(names) do
		SafeElement(section, "Toggle", {
			Title = name,
			Value = KeybindStates[name] == true,
			Callback = function(v) KeybindStates[name] = v == true end,
		})
	end
end, "Keybinds")

SafeCreate(function()
	local tab = SelectableTab(SettingsSection, { Title = "Settings", Icon = "settings" })
	local saves = tab:Section({ Title = "Saves", Opened = true })
	local cfgName = "default"
	local cfgList = listConfigs()
	local fileDrop
	SafeElement(saves, "Input", { Title = "Name", Value = cfgName, Placeholder = "Config name", Callback = function(v) cfgName = tostring(v or "default") end })
	fileDrop = SafeElement(saves, "Dropdown", { Title = "File", Values = cfgList, Value = cfgName, Callback = function(v) if type(v) == "string" and v ~= "" then cfgName = v end end })
	SafeElement(saves, "Button", { Title = "Save", Callback = function()
		ensureCfgFolder()
		local ok = pcall(function() writefile(cfgPath(cfgName), game:GetService("HttpService"):JSONEncode(serializeSettings())) end)
		Ping("Config", ok and "Saved." or "Save failed.", 2)
	end })
	SafeElement(saves, "Button", { Title = "Load", Callback = function()
		local ok, raw = pcall(function() return readfile(cfgPath(cfgName)) end)
		if not ok or not raw then Ping("Config", "Not found.", 2) return end
		local ok2, data = pcall(function() return game:GetService("HttpService"):JSONDecode(raw) end)
		if not ok2 or type(data) ~= "table" then Ping("Config", "Invalid config.", 2) return end
		applyConfig(data)
		applyAntiLag(State.AntiLag)
		setDisableRendering(State.DisableRendering)
		setUnlockCamera(State.UnlockCamera)
		setProtectUsernames(State.ProtectUsernames)
		applyFOVEnabled(State.FOVEnabled)
		setAlwaysRun(State.AlwaysRun)
		setRunSpeed(State.RunSpeed)
		setAutoVoteCard(State.AutoVoteEnabled and State.AutoVoteCard or "Off")
		setAutoEscape(State.AutoEscape)
		setAutoMachines(Features.autoMachines)
		setAutoExit(Features.autoExit)
		setAntiFailMinigames(State.AntiFailMinigames)
		setNoMinigames(State.NoMinigames)
		applyMachineCollisions(State.DeleteMachineCollisions)
		setImmunity("Snuggles", Immunity.Snuggles)
		setImmunity("Triplets", Immunity.Triplets)
		setImmunity("Dolly", Immunity.Dolly)
		setImmunity("Stargil", Immunity.Stargil)
		if State.UIColor then pcall(function() WindUI:SetTheme(State.UIColor) end) end
		Ping("Config", "Loaded.", 2)
	end })
	SafeElement(saves, "Button", { Title = "Delete", Callback = function() pcall(function() delfile(cfgPath(cfgName)) end); Ping("Config", "Deleted.", 2) end })

	local ui = tab:Section({ Title = "UI", Opened = true })
	SafeElement(ui, "Dropdown", {
		Title = "UI Color",
		Values = { "Dark", "Light", "Rose", "Plant", "Indigo", "Sky", "Violet", "Amber" },
		Value = State.UIColor,
		Callback = function(theme) State.UIColor = tostring(theme or "Dark"); pcall(function() WindUI:SetTheme(State.UIColor) end) end,
	})
end, "Settings")

local okCard = pcall(buildGodButton)
if okCard then end

pcall(function()
	local playerGui = Me:FindFirstChildOfClass("PlayerGui")
	if playerGui then
		local current = playerGui:FindFirstChild("FunhouseGodButton")
		if current then current.Enabled = true end
	end
end)

pcall(function()
	if type(Window.SelectTab) == "function" then Window:SelectTab(1) elseif Window.Tabs and Window.Tabs[1] and type(Window.Tabs[1].Select) == "function" then Window.Tabs[1]:Select() end
end)

Managers.GetMachines = MachineManager.Get
Managers.Farm = { State = Farm }
Managers.Bring = { State = Bring }
Managers.ESP = { State = ESP, Clear = clearESP, Refresh = espScan }
Managers.Status = function()
	return {
		Loops = Managers.Loops.Active(),
		Fly = flyWant,
		Noclip = Util.noclip,
		TeleportWalk = TW.on,
		AntiDebuff = anyDebuffOn(),
		MachinesCached = machineScanCache ~= nil,
	}
end

pcall(function()
	if Window.OnClose then
		Window.OnClose = function()
			StopAllLoops()
			DisconnectAll()
			clearESP()
			stopFly()
			setNoclip(false)
			stopDebuffWatch()
			setDisableRendering(false)
			setUnlockCamera(false)
			applyFOVEnabled(false)
			local playerGui = Me:FindFirstChildOfClass("PlayerGui")
			local button = playerGui and playerGui:FindFirstChild("FunhouseGodButton")
			if button then button:Destroy() end
		end
	end
end)

pcall(function()
	if Window and WindUI and WindUI.Notify then
		WindUI:Notify({ Title = HUB_NAME, Content = "v" .. VERSION .. " ready", Duration = 2, Icon = ASSETS.Notify })
	end
end)

end

BuildInterface()
