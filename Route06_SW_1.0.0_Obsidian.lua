local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local function SafeHttpGet(url)
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
    return nil
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

local function LoadRemote(url)
    local src = SafeHttpGet(url)
    if type(src) ~= "string" or src == "" then
        return nil
    end
    local fn = SafeLoadstring(src)
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
    local result = LoadRemote(base .. "Library.lua")
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
    ThemeManager = LoadRemote(repo .. "addons/ThemeManager.lua")
end)
pcall(function()
    SaveManager = LoadRemote(repo .. "addons/SaveManager.lua")
end)

local Options = Library.Options or {}
local Toggles = Library.Toggles or {}

pcall(function()
    Library.ForceCheckbox = false
    Library.ShowToggleFrameInKeybinds = true
end)

local State = {
    Fly = false,
    Noclip = false,
    AntiAFK = false,
    EnableJumpButton = false,
    InfiniteStamina = false,
    AlwaysRun = false,
    NoCooldownAbility = false,
    NoCostAbility = false,
    FlyMode = "Velocity",
    FlySpeed = 50,
    JumpPower = 50,
    Fullbright = false,
    NoFog = false,
    AntiLag = false,
    DisableRendering = false,
    ProtectUsernames = false,
    FieldOfView = false,
    FOVValue = 70,
    MaxCameraZoom = 128,
    MinCameraZoom = 0.5,
    LoopSetValues = false,
    ZombiesESP = false,
    PlayersESP = false,
    ItemsESP = false,
    GeneratorsESP = false,
    PuzzlesESP = false,
    ZombiesColor = Color3.fromRGB(255, 60, 60),
    ItemsColor = Color3.fromRGB(80, 200, 120),
    GeneratorsColor = Color3.fromRGB(80, 160, 255),
    PuzzlesColor = Color3.fromRGB(255, 200, 60),
    AutoHitZombie = false,
    AutoRemoveDoors = false,
    AutoRemovePuzzle = false,
    AutoReviveTeam = false,
    AutoHelpTeam = false,
    ReviveRate = 8,
    InfiniteGas = false,
    InfiniteDurability = false,
    TurboAlwaysOn = false,
    AntiCrash = false,
    AntiTrunk = false,
    CarSpeed = 120,
    CarGas = 100,
    CarDurability = 100,
    AutoCompleteGenerator = false,
    AutoLegitGenerator = false,
    AutoCompleteWithDelay = false,
    GeneratorDelay = 1,
    AuraPickUp = false,
    AuraDistance = 20,
    AutoUseBandage = false,
    AutoUseDrink = false,
    BandageWhen = 50,
    DrinkWhen = 30,
    MaxHealth = 100,
    WalkSpeed = 16,
    RunSpeed = 28,
    MaxStamina = 100,
    StaminaGain = 0.17,
    StaminaLoss = 0.1,
    BloodLoss = 0.65,
    MaxBloodPoints = 200,
    DamageMultiplier = 1,
    HealingMultiplier = 1,
}

local Connections = {}
local ESPFolder = nil
local OriginalLighting = {}
local FlyBodyVelocity = nil
local FlyBodyGyro = nil
local NoclipParts = {}

local function GetCharacter()
    return LocalPlayer.Character
end

local function GetHumanoid()
    local char = GetCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function GetHRP()
    local char = GetCharacter()
    return char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso"))
end

local function GetActionsRemote()
    local remotes = ReplicatedStorage:FindFirstChild("remotes")
    if remotes then
        return remotes:FindFirstChild("actions")
    end
    return nil
end

local function FireAction(name, ...)
    local remote = GetActionsRemote()
    if remote and remote:IsA("RemoteEvent") then
        pcall(function()
            remote:FireServer(name, ...)
        end)
    end
end

local function FindSurvivorStatsFolder()
    local display = ReplicatedStorage:FindFirstChild("playerFoldersDisplay")
    if display then
        local folder = display:FindFirstChild(LocalPlayer.Name)
        if folder then
            local stats = folder:FindFirstChild("survivorStats")
            if stats then
                return stats
            end
        end
        for _, child in ipairs(display:GetChildren()) do
            local stats = child:FindFirstChild("survivorStats")
            if stats then
                return stats
            end
        end
    end
    local globalStats = ReplicatedStorage:FindFirstChild("survivorStats")
    if globalStats then
        for _, child in ipairs(globalStats:GetChildren()) do
            if child:IsA("Folder") or child:IsA("Configuration") then
                return child
            end
        end
    end
    return nil
end

local function SetStatValue(folder, name, value)
    if not folder then
        return
    end
    local obj = folder:FindFirstChild(name)
    if obj and (obj:IsA("NumberValue") or obj:IsA("IntValue")) then
        pcall(function()
            obj.Value = tonumber(value) or obj.Value
        end)
    end
end

local function ApplySurvivorStats()
    local folder = FindSurvivorStatsFolder()
    if not folder then
        return
    end
    SetStatValue(folder, "maxHealth", State.MaxHealth)
    SetStatValue(folder, "walkSpeed", State.WalkSpeed)
    SetStatValue(folder, "runSpeed", State.RunSpeed)
    SetStatValue(folder, "maxStamina", State.MaxStamina)
    SetStatValue(folder, "staminaGain", State.StaminaGain)
    SetStatValue(folder, "staminaLoss", State.InfiniteStamina and 0 or State.StaminaLoss)
    SetStatValue(folder, "bloodLossRate", State.BloodLoss)
    SetStatValue(folder, "maxBloodPoints", State.MaxBloodPoints)
    SetStatValue(folder, "damageMultiplier", State.DamageMultiplier)
    SetStatValue(folder, "healingMultiplier", State.HealingMultiplier)
    SetStatValue(folder, "reviveRate", State.ReviveRate)
    local hum = GetHumanoid()
    if hum then
        pcall(function()
            if State.AlwaysRun then
                hum.WalkSpeed = tonumber(State.RunSpeed) or 28
            else
                hum.WalkSpeed = tonumber(State.WalkSpeed) or 16
            end
            if State.MaxHealth and tonumber(State.MaxHealth) then
                hum.MaxHealth = tonumber(State.MaxHealth)
                if hum.Health > hum.MaxHealth then
                    hum.Health = hum.MaxHealth
                end
            end
            if State.JumpPower then
                hum.JumpPower = tonumber(State.JumpPower) or 50
                hum.UseJumpPower = true
            end
        end)
    end
end

local function FindCarStats()
    local vehicles = Workspace:FindFirstChild("vehicles")
    if vehicles then
        local car = vehicles:FindFirstChild("defaultCar")
        if car then
            local stats = car:FindFirstChild("stats")
            if stats then
                return stats
            end
        end
        for _, v in ipairs(vehicles:GetChildren()) do
            local stats = v:FindFirstChild("stats")
            if stats then
                return stats
            end
        end
    end
    local defaultCar = ReplicatedStorage:FindFirstChild("defaultCar")
    if defaultCar then
        local stats = defaultCar:FindFirstChild("stats")
        if stats then
            return stats
        end
    end
    return nil
end

local function ApplyCarStats()
    local stats = FindCarStats()
    if not stats then
        return
    end
    local function set(name, value)
        local obj = stats:FindFirstChild(name)
        if obj and (obj:IsA("NumberValue") or obj:IsA("IntValue") or obj:IsA("BoolValue")) then
            pcall(function()
                obj.Value = value
            end)
        end
    end
    if State.InfiniteGas then
        set("gas", 99999)
    end
    if State.InfiniteDurability then
        set("durability", 99999)
        set("durabilityDrainPerHit", 0)
    end
    if State.TurboAlwaysOn then
        set("turboMode", true)
    end
    if State.AntiCrash then
        set("crash", false)
        set("canTriggerCrashDialog", false)
    end
    if State.AntiTrunk then
        set("trunkState", false)
    end
    set("speed", tonumber(State.CarSpeed) or 120)
    set("gas", State.InfiniteGas and 99999 or (tonumber(State.CarGas) or 100))
    set("durability", State.InfiniteDurability and 99999 or (tonumber(State.CarDurability) or 100))
end

local function RestoreCarDefaults()
    local stats = FindCarStats()
    if not stats then
        return
    end
    local function set(name, value)
        local obj = stats:FindFirstChild(name)
        if obj then
            pcall(function()
                obj.Value = value
            end)
        end
    end
    set("speed", 120)
    set("gas", 100)
    set("durability", 100)
    set("durabilityDrainPerHit", 10)
    set("turboMode", false)
    set("crash", false)
    set("runOverDamage", 50)
end

local function EnsureESPFolder()
    if ESPFolder and ESPFolder.Parent then
        return ESPFolder
    end
    local pg = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")
    local existing = pg:FindFirstChild("Route06SW_ESP")
    if existing then
        ESPFolder = existing
        return ESPFolder
    end
    local folder = Instance.new("Folder")
    folder.Name = "Route06SW_ESP"
    folder.Parent = pg
    ESPFolder = folder
    return folder
end

local function ClearESP(tag)
    local folder = EnsureESPFolder()
    for _, child in ipairs(folder:GetChildren()) do
        if not tag or child:GetAttribute("ESPTag") == tag then
            child:Destroy()
        end
    end
end

local function MakeHighlight(adornee, color, tag)
    if not adornee then
        return
    end
    local folder = EnsureESPFolder()
    local hl = Instance.new("Highlight")
    hl.Name = "HL_" .. tag
    hl.Adornee = adornee
    hl.FillColor = color
    hl.OutlineColor = color
    hl.FillTransparency = 0.65
    hl.OutlineTransparency = 0.2
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl:SetAttribute("ESPTag", tag)
    hl.Parent = folder
    return hl
end

local function MakeBillboard(adornee, text, color, tag)
    if not adornee then
        return
    end
    local folder = EnsureESPFolder()
    local part = adornee
    if adornee:IsA("Model") then
        part = adornee.PrimaryPart or adornee:FindFirstChildWhichIsA("BasePart")
    end
    if not part then
        return
    end
    local bb = Instance.new("BillboardGui")
    bb.Name = "BB_" .. tag
    bb.Adornee = part
    bb.Size = UDim2.new(0, 120, 0, 30)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb:SetAttribute("ESPTag", tag)
    bb.Parent = folder
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextStrokeTransparency = 0.4
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.Parent = bb
    return bb
end

local function IsZombieModel(model)
    if not model or not model:IsA("Model") then
        return false
    end
    local name = string.lower(model.Name)
    if string.find(name, "zombie") or string.find(name, "monster") or string.find(name, "enemy") or string.find(name, "infected") then
        return true
    end
    if model:FindFirstChild("Stats") or model:GetAttribute("isZombie") or model:GetAttribute("enemy") then
        return true
    end
    return false
end

local function RefreshESP()
    ClearESP(nil)
    if State.PlayersESP then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                local name = State.ProtectUsernames and "Player" or plr.Name
                MakeHighlight(plr.Character, Color3.fromRGB(80, 180, 255), "Players")
                MakeBillboard(plr.Character, name, Color3.fromRGB(80, 180, 255), "Players")
            end
        end
    end
    if State.ZombiesESP then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("Model") and IsZombieModel(obj) then
                MakeHighlight(obj, State.ZombiesColor, "Zombies")
                MakeBillboard(obj, obj.Name, State.ZombiesColor, "Zombies")
            end
        end
    end
    if State.ItemsESP then
        local itemsFolder = Workspace:FindFirstChild("items") or Workspace:FindFirstChild("Items") or Workspace:FindFirstChild("loot")
        local scan = itemsFolder and itemsFolder:GetDescendants() or Workspace:GetDescendants()
        for _, obj in ipairs(scan) do
            if obj:IsA("Tool") or obj:IsA("Model") and (string.find(string.lower(obj.Name), "item") or string.find(string.lower(obj.Name), "loot") or string.find(string.lower(obj.Name), "pickup") or string.find(string.lower(obj.Name), "crate") or string.find(string.lower(obj.Name), "gas") or string.find(string.lower(obj.Name), "bandage") or string.find(string.lower(obj.Name), "ammo")) then
                MakeHighlight(obj, State.ItemsColor, "Items")
                MakeBillboard(obj, obj.Name, State.ItemsColor, "Items")
            end
        end
    end
    if State.GeneratorsESP then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            local n = string.lower(obj.Name)
            if (obj:IsA("Model") or obj:IsA("BasePart")) and (string.find(n, "generator") or string.find(n, "gen")) then
                MakeHighlight(obj, State.GeneratorsColor, "Generators")
                MakeBillboard(obj, obj.Name, State.GeneratorsColor, "Generators")
            end
        end
    end
    if State.PuzzlesESP then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            local n = string.lower(obj.Name)
            if (obj:IsA("Model") or obj:IsA("BasePart")) and (string.find(n, "puzzle") or string.find(n, "door") or string.find(n, "lock") or string.find(n, "keypad")) then
                MakeHighlight(obj, State.PuzzlesColor, "Puzzles")
                MakeBillboard(obj, obj.Name, State.PuzzlesColor, "Puzzles")
            end
        end
    end
end

local function ApplyFullbright(on)
    if on then
        if not OriginalLighting.Ambient then
            OriginalLighting.Ambient = Lighting.Ambient
            OriginalLighting.Brightness = Lighting.Brightness
            OriginalLighting.ClockTime = Lighting.ClockTime
            OriginalLighting.FogEnd = Lighting.FogEnd
            OriginalLighting.GlobalShadows = Lighting.GlobalShadows
        end
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 1e6
        Lighting.GlobalShadows = false
    else
        if OriginalLighting.Ambient then
            Lighting.Ambient = OriginalLighting.Ambient
            Lighting.Brightness = OriginalLighting.Brightness
            Lighting.ClockTime = OriginalLighting.ClockTime
            Lighting.FogEnd = OriginalLighting.FogEnd
            Lighting.GlobalShadows = OriginalLighting.GlobalShadows
        end
    end
end

local function ApplyNoFog(on)
    if on then
        Lighting.FogEnd = 1e6
        Lighting.FogStart = 1e6
        pcall(function()
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("Atmosphere") then
                    v.Density = 0
                end
            end
        end)
    end
end

local function ApplyAntiLag(on)
    if on then
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Smoke") or obj:IsA("Fire") then
                pcall(function()
                    obj.Enabled = false
                end)
            end
        end
    end
end

local function StartFly()
    StopFly()
    local hrp = GetHRP()
    local hum = GetHumanoid()
    if not hrp or not hum then
        return
    end
    hum.PlatformStand = true
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bv.Velocity = Vector3.zero
    bv.Parent = hrp
    FlyBodyVelocity = bv
    local bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
    bg.P = 1e4
    bg.CFrame = hrp.CFrame
    bg.Parent = hrp
    FlyBodyGyro = bg
end

local function StopFly()
    if FlyBodyVelocity then
        FlyBodyVelocity:Destroy()
        FlyBodyVelocity = nil
    end
    if FlyBodyGyro then
        FlyBodyGyro:Destroy()
        FlyBodyGyro = nil
    end
    local hum = GetHumanoid()
    if hum then
        hum.PlatformStand = false
    end
end

local function UpdateFly(dt)
    if not State.Fly then
        return
    end
    local hrp = GetHRP()
    local cam = Workspace.CurrentCamera
    if not hrp or not cam or not FlyBodyVelocity then
        return
    end
    local dir = Vector3.zero
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        dir = dir + cam.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        dir = dir - cam.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        dir = dir - cam.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        dir = dir + cam.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        dir = dir + Vector3.new(0, 1, 0)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        dir = dir - Vector3.new(0, 1, 0)
    end
    if dir.Magnitude > 0 then
        dir = dir.Unit * (tonumber(State.FlySpeed) or 50)
    end
    FlyBodyVelocity.Velocity = dir
    if FlyBodyGyro then
        FlyBodyGyro.CFrame = CFrame.new(hrp.Position, hrp.Position + cam.CFrame.LookVector)
    end
end

local function UpdateNoclip()
    if not State.Noclip then
        return
    end
    local char = GetCharacter()
    if not char then
        return
    end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end

local function InstantDie()
    local hum = GetHumanoid()
    if hum then
        pcall(function()
            hum.Health = 0
        end)
    end
    FireAction("takeDamage", 99999)
end

local function AutoHelpLoop()
    if not (State.AutoHelpTeam or State.AutoReviveTeam) then
        return
    end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            pcall(function()
                FireAction("helpRecoverTarget", plr.Name)
            end)
        end
    end
end

local function AutoHitLoop()
    if not State.AutoHitZombie then
        return
    end
    local hrp = GetHRP()
    if not hrp then
        return
    end
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and IsZombieModel(obj) then
            local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if part and (part.Position - hrp.Position).Magnitude < 25 then
                pcall(function()
                    FireAction("damageTarget", obj.Name)
                    FireAction("quickPunchHit", obj)
                    FireAction("slideHit", obj)
                end)
            end
        end
    end
end

local function AuraPickLoop()
    if not State.AuraPickUp then
        return
    end
    local hrp = GetHRP()
    if not hrp then
        return
    end
    local dist = tonumber(State.AuraDistance) or 20
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") or (obj:IsA("Model") and (string.find(string.lower(obj.Name), "item") or string.find(string.lower(obj.Name), "loot") or string.find(string.lower(obj.Name), "bandage") or string.find(string.lower(obj.Name), "ammo") or string.find(string.lower(obj.Name), "gas") or string.find(string.lower(obj.Name), "crate"))) then
            local part = obj:IsA("BasePart") and obj or (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart"))
            if part and (part.Position - hrp.Position).Magnitude <= dist then
                pcall(function()
                    FireAction("pickGroundItem", obj.Name)
                    FireAction("pickGroundItem", obj)
                end)
            end
        end
    end
end

local function AutoHealLoop()
    local hum = GetHumanoid()
    if not hum then
        return
    end
    local hpPct = (hum.Health / math.max(hum.MaxHealth, 1)) * 100
    if State.AutoUseBandage and hpPct <= (tonumber(State.BandageWhen) or 50) then
        FireAction("useBandage")
    end
    if State.AutoUseDrink and hpPct <= (tonumber(State.DrinkWhen) or 30) then
        FireAction("useDrink")
    end
end

local function AutoGeneratorLoop()
    if not (State.AutoCompleteGenerator or State.AutoLegitGenerator or State.AutoCompleteWithDelay) then
        return
    end
    for _, obj in ipairs(Workspace:GetDescendants()) do
        local n = string.lower(obj.Name)
        if (obj:IsA("Model") or obj:IsA("BasePart")) and string.find(n, "generator") then
            pcall(function()
                if State.AutoCompleteGenerator then
                    FireAction("repairGenerator", obj.Name)
                    FireAction("repairGenerator", obj)
                    FireAction("getOnGenerator", obj)
                elseif State.AutoCompleteWithDelay then
                    FireAction("getOnGenerator", obj)
                    task.wait(tonumber(State.GeneratorDelay) or 1)
                    FireAction("repairGenerator", obj)
                elseif State.AutoLegitGenerator then
                    FireAction("getOnGenerator", obj)
                end
            end)
        end
    end
end

local function AutoRemoveDoorsPuzzles()
    if not (State.AutoRemoveDoors or State.AutoRemovePuzzle) then
        return
    end
    for _, obj in ipairs(Workspace:GetDescendants()) do
        local n = string.lower(obj.Name)
        if State.AutoRemoveDoors and (string.find(n, "door") or string.find(n, "gate")) then
            pcall(function()
                if obj:IsA("BasePart") then
                    obj.CanCollide = false
                    obj.Transparency = 0.8
                elseif obj:IsA("Model") then
                    for _, p in ipairs(obj:GetDescendants()) do
                        if p:IsA("BasePart") then
                            p.CanCollide = false
                            p.Transparency = 0.8
                        end
                    end
                end
            end)
        end
        if State.AutoRemovePuzzle and (string.find(n, "puzzle") or string.find(n, "lock") or string.find(n, "keypad")) then
            pcall(function()
                FireAction("openInteractable", obj)
                if obj:IsA("BasePart") then
                    obj.CanCollide = false
                end
            end)
        end
    end
end

local function SetupAntiAFK()
    if Connections.AntiAFK then
        Connections.AntiAFK:Disconnect()
        Connections.AntiAFK = nil
    end
    if State.AntiAFK then
        Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end)
    end
end

local function EnableJumpButton(on)
    pcall(function()
        local starterGui = game:GetService("StarterGui")
        if on then
            starterGui:SetCore("ResetButtonCallback", true)
        end
        local pg = LocalPlayer:FindFirstChildOfClass("PlayerGui")
        if pg then
            local touch = pg:FindFirstChild("TouchGui")
            if touch then
                local jump = touch:FindFirstChild("JumpButton", true)
                if jump then
                    jump.Visible = on
                end
            end
        end
    end)
end

local Accum = 0
local ESPAccum = 0
local SlowAccum = 0

RunService.Heartbeat:Connect(function(dt)
    Accum = Accum + dt
    ESPAccum = ESPAccum + dt
    SlowAccum = SlowAccum + dt

    if State.Fly then
        UpdateFly(dt)
    end
    if State.Noclip then
        UpdateNoclip()
    end

    if Accum >= 0.35 then
        Accum = 0
        if State.LoopSetValues or State.InfiniteStamina or State.AlwaysRun then
            ApplySurvivorStats()
        end
        if State.InfiniteGas or State.InfiniteDurability or State.TurboAlwaysOn or State.AntiCrash or State.AntiTrunk then
            ApplyCarStats()
        end
        if State.AutoHitZombie then
            AutoHitLoop()
        end
        if State.AuraPickUp then
            AuraPickLoop()
        end
        if State.AutoUseBandage or State.AutoUseDrink then
            AutoHealLoop()
        end
        if State.AutoHelpTeam or State.AutoReviveTeam then
            AutoHelpLoop()
        end
    end

    if ESPAccum >= 1.25 then
        ESPAccum = 0
        if State.ZombiesESP or State.PlayersESP or State.ItemsESP or State.GeneratorsESP or State.PuzzlesESP then
            RefreshESP()
        end
    end

    if SlowAccum >= 2 then
        SlowAccum = 0
        if State.AutoCompleteGenerator or State.AutoLegitGenerator or State.AutoCompleteWithDelay then
            AutoGeneratorLoop()
        end
        if State.AutoRemoveDoors or State.AutoRemovePuzzle then
            AutoRemoveDoorsPuzzles()
        end
        if State.Fullbright then
            ApplyFullbright(true)
        end
        if State.NoFog then
            ApplyNoFog(true)
        end
        if State.FieldOfView then
            pcall(function()
                Workspace.CurrentCamera.FieldOfView = tonumber(State.FOVValue) or 70
            end)
        end
        pcall(function()
            LocalPlayer.CameraMaxZoomDistance = tonumber(State.MaxCameraZoom) or 128
            LocalPlayer.CameraMinZoomDistance = tonumber(State.MinCameraZoom) or 0.5
        end)
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if State.Fly then
        StartFly()
    end
    if State.LoopSetValues then
        ApplySurvivorStats()
    end
end)

local Window
do
    local okWin, winOrErr = pcall(function()
        return Library:CreateWindow({
            Title = "Route 06 | SW",
            Footer = "v1.0.0 | Obsidian",
            Icon = "car",
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
                Title = "Route 06 | SW",
                Footer = "v1.0.0 | Obsidian",
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
    Library:Notify({
        Title = "Route 06 | SW",
        Description = "Loaded v1.0.0",
        Time = 5,
    })
end)

local Tabs = {
    Home = Window:AddTab("Home", "info"),
    Player = Window:AddTab("Player", "user"),
    Visual = Window:AddTab("Visual", "eye"),
    Automatic = Window:AddTab("Automatic", "refresh-cw"),
}

do
    local Info = Tabs.Home:AddGroupbox({
        Side = "Left",
        Name = "Information",
        IconName = "info",
    })

    Info:AddLabel({
        Text = "Supported Executors\n\nMobile:\n[OK] Delta (deltaexploits.dev)\n[OK] Codex (codex.lol)\n\nmacOS:\n[OK] Opiumware\n[OK] Hydrogen\n[OK] Macsploit\n\nWindows:\n[OK] Volt\n[OK] Madium\n[OK] Real\n[OK] Velocity\n[OK] Potassium\n[~] Solara\n[X] Xeno",
        DoesWrap = true,
    })

    Info:AddDivider()

    Info:AddLabel({
        Text = "Supported Games\n[OK] Route 06 (Lobby + Ingame)\nPlace 92141204718989\nPlace 126877010217117",
        DoesWrap = true,
    })

    Info:AddDivider()

    Info:AddLabel({
        Text = "Special Thanks\nHs (Https), Gh (GourdyHalloway), Nc (Nexocat).",
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
                Library:Notify({ Title = "Copied", Description = "Discord link copied.", Time = 3 })
            end
        end,
    })

    Server:AddDivider()

    Server:AddLabel({
        Text = "Changelog v1.0.0\n- Initial Route 06 release\n- Player stats and movement\n- Visual ESP and lighting\n- Auto systems and car tools\n- Item aura and team help",
        DoesWrap = true,
    })
end

do
    local General = Tabs.Player:AddGroupbox({
        Side = "Left",
        Name = "General",
        IconName = "zap",
    })

    General:AddToggle("Fly", {
        Text = "Fly",
        Default = false,
        Callback = function(v)
            State.Fly = v == true
            if State.Fly then
                StartFly()
            else
                StopFly()
            end
        end,
    })

    General:AddToggle("Noclip", {
        Text = "Noclip",
        Default = false,
        Callback = function(v)
            State.Noclip = v == true
        end,
    })

    General:AddToggle("AntiAFK", {
        Text = "Anti-AFK",
        Default = false,
        Callback = function(v)
            State.AntiAFK = v == true
            SetupAntiAFK()
        end,
    })

    General:AddToggle("EnableJumpButton", {
        Text = "Enable Jump Button",
        Default = false,
        Callback = function(v)
            State.EnableJumpButton = v == true
            EnableJumpButton(State.EnableJumpButton)
        end,
    })

    General:AddToggle("InfiniteStamina", {
        Text = "Infinite Stamina",
        Default = false,
        Callback = function(v)
            State.InfiniteStamina = v == true
            ApplySurvivorStats()
        end,
    })

    General:AddToggle("AlwaysRun", {
        Text = "Always Run",
        Default = false,
        Callback = function(v)
            State.AlwaysRun = v == true
            ApplySurvivorStats()
        end,
    })

    General:AddToggle("NoCooldownAbility", {
        Text = "No Cooldown Abilitys",
        Default = false,
        Callback = function(v)
            State.NoCooldownAbility = v == true
        end,
    })

    General:AddToggle("NoCostAbility", {
        Text = "No Cost Abilitys",
        Default = false,
        Callback = function(v)
            State.NoCostAbility = v == true
        end,
    })

    General:AddButton({
        Text = "Instant Die",
        Func = function()
            InstantDie()
        end,
    })

    local StatsBox = Tabs.Player:AddGroupbox({
        Side = "Right",
        Name = "Stats",
        IconName = "bar-chart-2",
    })

    StatsBox:AddInput("MaxHealth", {
        Text = "Max Health",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "100",
        Callback = function(value)
            State.MaxHealth = tonumber(value) or State.MaxHealth
            ApplySurvivorStats()
        end,
    })

    StatsBox:AddInput("WalkSpeed", {
        Text = "Walkspeed",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "16",
        Callback = function(value)
            State.WalkSpeed = tonumber(value) or State.WalkSpeed
            ApplySurvivorStats()
        end,
    })

    StatsBox:AddInput("RunSpeed", {
        Text = "Run speed",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "28",
        Callback = function(value)
            State.RunSpeed = tonumber(value) or State.RunSpeed
            ApplySurvivorStats()
        end,
    })

    StatsBox:AddInput("MaxStamina", {
        Text = "Max Stamina",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "100",
        Callback = function(value)
            State.MaxStamina = tonumber(value) or State.MaxStamina
            ApplySurvivorStats()
        end,
    })

    StatsBox:AddInput("StaminaGain", {
        Text = "Stamina Gain",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "0.17",
        Callback = function(value)
            State.StaminaGain = tonumber(value) or State.StaminaGain
            ApplySurvivorStats()
        end,
    })

    StatsBox:AddInput("StaminaLoss", {
        Text = "Stamina Loss",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "0.1",
        Callback = function(value)
            State.StaminaLoss = tonumber(value) or State.StaminaLoss
            ApplySurvivorStats()
        end,
    })

    StatsBox:AddInput("BloodLoss", {
        Text = "Blood Loss",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "0.65",
        Callback = function(value)
            State.BloodLoss = tonumber(value) or State.BloodLoss
            ApplySurvivorStats()
        end,
    })

    StatsBox:AddInput("MaxBloodPoints", {
        Text = "Max Blood Points",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "200",
        Callback = function(value)
            State.MaxBloodPoints = tonumber(value) or State.MaxBloodPoints
            ApplySurvivorStats()
        end,
    })

    StatsBox:AddInput("DamageMultiplier", {
        Text = "Damage Multiplier",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "1",
        Callback = function(value)
            State.DamageMultiplier = tonumber(value) or State.DamageMultiplier
            ApplySurvivorStats()
        end,
    })

    StatsBox:AddInput("HealingMultiplier", {
        Text = "Healing Multiplier",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "1",
        Callback = function(value)
            State.HealingMultiplier = tonumber(value) or State.HealingMultiplier
            ApplySurvivorStats()
        end,
    })

    local SettingsBox = Tabs.Player:AddGroupbox({
        Side = "Left",
        Name = "Settings",
        IconName = "settings",
    })

    SettingsBox:AddDropdown("FlyMode", {
        Values = { "Velocity", "CFrame" },
        Default = 1,
        Text = "Fly Mode",
        Callback = function(option)
            State.FlyMode = option
        end,
    })

    SettingsBox:AddSlider("FlySpeed", {
        Text = "Fly Speed",
        Default = 50,
        Min = 10,
        Max = 200,
        Rounding = 0,
        Callback = function(value)
            State.FlySpeed = value
        end,
    })

    SettingsBox:AddSlider("JumpPower", {
        Text = "Jump Power",
        Default = 50,
        Min = 10,
        Max = 200,
        Rounding = 0,
        Callback = function(value)
            State.JumpPower = value
            local hum = GetHumanoid()
            if hum then
                pcall(function()
                    hum.JumpPower = value
                    hum.UseJumpPower = true
                end)
            end
        end,
    })
end

do
    local PlayerVis = Tabs.Visual:AddGroupbox({
        Side = "Left",
        Name = "Player",
        IconName = "eye",
    })

    PlayerVis:AddToggle("Fullbright", {
        Text = "Fullbright",
        Default = false,
        Callback = function(v)
            State.Fullbright = v == true
            ApplyFullbright(State.Fullbright)
        end,
    })

    PlayerVis:AddToggle("NoFog", {
        Text = "No-fog",
        Default = false,
        Callback = function(v)
            State.NoFog = v == true
            ApplyNoFog(State.NoFog)
        end,
    })

    PlayerVis:AddToggle("AntiLag", {
        Text = "Anti-lag",
        Default = false,
        Callback = function(v)
            State.AntiLag = v == true
            ApplyAntiLag(State.AntiLag)
        end,
    })

    PlayerVis:AddToggle("DisableRendering", {
        Text = "Disable Rendering",
        Default = false,
        Callback = function(v)
            State.DisableRendering = v == true
            pcall(function()
                if State.DisableRendering then
                    Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                else
                    Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                end
            end)
        end,
    })

    PlayerVis:AddToggle("ProtectUsernames", {
        Text = "Protect Usernames",
        Default = false,
        Callback = function(v)
            State.ProtectUsernames = v == true
            if State.PlayersESP then
                RefreshESP()
            end
        end,
    })

    PlayerVis:AddToggle("FieldOfView", {
        Text = "Field of View",
        Default = false,
        Callback = function(v)
            State.FieldOfView = v == true
        end,
    })

    PlayerVis:AddSlider("MaxCameraZoom", {
        Text = "Max Camera Zoom",
        Default = 128,
        Min = 16,
        Max = 500,
        Rounding = 0,
        Callback = function(value)
            State.MaxCameraZoom = value
            pcall(function()
                LocalPlayer.CameraMaxZoomDistance = value
            end)
        end,
    })

    PlayerVis:AddSlider("MinCameraZoom", {
        Text = "Min Camera Zoom",
        Default = 1,
        Min = 0,
        Max = 20,
        Rounding = 1,
        Callback = function(value)
            State.MinCameraZoom = value
            pcall(function()
                LocalPlayer.CameraMinZoomDistance = value
            end)
        end,
    })

    PlayerVis:AddToggle("LoopSetValues", {
        Text = "Loop Set Values",
        Default = false,
        Callback = function(v)
            State.LoopSetValues = v == true
        end,
    })

    local ESPBox = Tabs.Visual:AddGroupbox({
        Side = "Right",
        Name = "ESP",
        IconName = "radar",
    })

    ESPBox:AddToggle("ZombiesESP", {
        Text = "Zombies ESP",
        Default = false,
        Callback = function(v)
            State.ZombiesESP = v == true
            if not v then ClearESP("Zombies") else RefreshESP() end
        end,
    })

    ESPBox:AddToggle("PlayersESP", {
        Text = "Players ESP",
        Default = false,
        Callback = function(v)
            State.PlayersESP = v == true
            if not v then ClearESP("Players") else RefreshESP() end
        end,
    })

    ESPBox:AddToggle("ItemsESP", {
        Text = "Items ESP",
        Default = false,
        Callback = function(v)
            State.ItemsESP = v == true
            if not v then ClearESP("Items") else RefreshESP() end
        end,
    })

    ESPBox:AddToggle("GeneratorsESP", {
        Text = "Generators ESP",
        Default = false,
        Callback = function(v)
            State.GeneratorsESP = v == true
            if not v then ClearESP("Generators") else RefreshESP() end
        end,
    })

    ESPBox:AddToggle("PuzzlesESP", {
        Text = "Puzzles ESP",
        Default = false,
        Callback = function(v)
            State.PuzzlesESP = v == true
            if not v then ClearESP("Puzzles") else RefreshESP() end
        end,
    })

    local ESPSettings = Tabs.Visual:AddGroupbox({
        Side = "Right",
        Name = "ESP Settings",
        IconName = "palette",
    })

    ESPSettings:AddDropdown("ZombiesBlacklist", {
        Values = { "None" },
        Default = 1,
        Text = "Zombies Blacklist",
        Callback = function()
        end,
    })

    ESPSettings:AddDropdown("ItemsBlacklist", {
        Values = { "None" },
        Default = 1,
        Text = "Items Blacklist",
        Callback = function()
        end,
    })

    ESPSettings:AddDropdown("GeneratorsBlacklist", {
        Values = { "None" },
        Default = 1,
        Text = "Generators Blacklist",
        Callback = function()
        end,
    })

    ESPSettings:AddDropdown("PuzzlesBlacklist", {
        Values = { "None" },
        Default = 1,
        Text = "Puzzles Blacklist",
        Callback = function()
        end,
    })

    pcall(function()
        ESPSettings:AddLabel({ Text = "ESP Colors", DoesWrap = false })
    end)

    ESPSettings:AddButton({
        Text = "Set Zombies Color Red",
        Func = function()
            State.ZombiesColor = Color3.fromRGB(255, 60, 60)
            RefreshESP()
        end,
    })

    ESPSettings:AddButton({
        Text = "Set Items Color Green",
        Func = function()
            State.ItemsColor = Color3.fromRGB(80, 200, 120)
            RefreshESP()
        end,
    })

    ESPSettings:AddButton({
        Text = "Set Generators Color Blue",
        Func = function()
            State.GeneratorsColor = Color3.fromRGB(80, 160, 255)
            RefreshESP()
        end,
    })

    ESPSettings:AddButton({
        Text = "Set Puzzles Color Yellow",
        Func = function()
            State.PuzzlesColor = Color3.fromRGB(255, 200, 60)
            RefreshESP()
        end,
    })
end

do
    local General = Tabs.Automatic:AddGroupbox({
        Side = "Left",
        Name = "General",
        IconName = "swords",
    })

    General:AddToggle("AutoHitZombie", {
        Text = "Auto Hit Zombie",
        Default = false,
        Callback = function(v)
            State.AutoHitZombie = v == true
        end,
    })

    General:AddToggle("AutoRemoveDoors", {
        Text = "Auto Remove Doors",
        Default = false,
        Callback = function(v)
            State.AutoRemoveDoors = v == true
        end,
    })

    General:AddToggle("AutoRemovePuzzle", {
        Text = "Auto Remove Puzzle",
        Default = false,
        Callback = function(v)
            State.AutoRemovePuzzle = v == true
        end,
    })

    local Team = Tabs.Automatic:AddGroupbox({
        Side = "Left",
        Name = "Teammates",
        IconName = "users",
    })

    Team:AddToggle("AutoReviveTeam", {
        Text = "Auto Revive Team",
        Default = false,
        Callback = function(v)
            State.AutoReviveTeam = v == true
        end,
    })

    Team:AddToggle("AutoHelpTeam", {
        Text = "Auto Help Team",
        Default = false,
        Callback = function(v)
            State.AutoHelpTeam = v == true
        end,
    })

    Team:AddInput("ReviveRate", {
        Text = "Revive Rate",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "8",
        Callback = function(value)
            State.ReviveRate = tonumber(value) or State.ReviveRate
            ApplySurvivorStats()
        end,
    })

    local Car = Tabs.Automatic:AddGroupbox({
        Side = "Right",
        Name = "Car",
        IconName = "car",
    })

    Car:AddToggle("InfiniteGas", {
        Text = "Infinite gasoline",
        Default = false,
        Callback = function(v)
            State.InfiniteGas = v == true
            ApplyCarStats()
        end,
    })

    Car:AddToggle("InfiniteDurability", {
        Text = "Infinite durability",
        Default = false,
        Callback = function(v)
            State.InfiniteDurability = v == true
            ApplyCarStats()
        end,
    })

    Car:AddToggle("TurboAlwaysOn", {
        Text = "Turbo always on",
        Default = false,
        Callback = function(v)
            State.TurboAlwaysOn = v == true
            ApplyCarStats()
        end,
    })

    Car:AddToggle("AntiCrash", {
        Text = "Anti Crash",
        Default = false,
        Callback = function(v)
            State.AntiCrash = v == true
            ApplyCarStats()
        end,
    })

    Car:AddToggle("AntiTrunk", {
        Text = "Anti Trunk",
        Default = false,
        Callback = function(v)
            State.AntiTrunk = v == true
            ApplyCarStats()
        end,
    })

    Car:AddInput("CarSpeed", {
        Text = "Speed",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "120",
        Callback = function(value)
            State.CarSpeed = tonumber(value) or State.CarSpeed
        end,
    })

    Car:AddInput("CarGas", {
        Text = "Give Gas",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "100",
        Callback = function(value)
            State.CarGas = tonumber(value) or State.CarGas
        end,
    })

    Car:AddInput("CarDurability", {
        Text = "Durability",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "100",
        Callback = function(value)
            State.CarDurability = tonumber(value) or State.CarDurability
        end,
    })

    Car:AddButton({
        Text = "Give Gas",
        Func = function()
            local stats = FindCarStats()
            if stats then
                local gas = stats:FindFirstChild("gas")
                if gas then
                    gas.Value = tonumber(State.CarGas) or 100
                end
            end
            FireAction("refillGas")
        end,
    })

    Car:AddButton({
        Text = "Apply Changes",
        Func = function()
            ApplyCarStats()
            Library:Notify({ Title = "Car", Description = "Car stats applied.", Time = 3 })
        end,
    })

    Car:AddButton({
        Text = "Restore Changes",
        Func = function()
            RestoreCarDefaults()
            Library:Notify({ Title = "Car", Description = "Car stats restored.", Time = 3 })
        end,
    })

    local Gen = Tabs.Automatic:AddGroupbox({
        Side = "Left",
        Name = "Generators",
        IconName = "cpu",
    })

    Gen:AddToggle("AutoCompleteGenerator", {
        Text = "Auto Complete Generator",
        Default = false,
        Callback = function(v)
            State.AutoCompleteGenerator = v == true
        end,
    })

    Gen:AddToggle("AutoLegitGenerator", {
        Text = "Auto Legit Generator",
        Default = false,
        Callback = function(v)
            State.AutoLegitGenerator = v == true
        end,
    })

    Gen:AddToggle("AutoCompleteWithDelay", {
        Text = "Auto Complete With Delay",
        Default = false,
        Callback = function(v)
            State.AutoCompleteWithDelay = v == true
        end,
    })

    Gen:AddInput("GeneratorDelay", {
        Text = "Delay",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "1",
        Callback = function(value)
            State.GeneratorDelay = tonumber(value) or 1
        end,
    })

    Gen:AddButton({
        Text = "Complete Generator",
        Func = function()
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if string.find(string.lower(obj.Name), "generator") then
                    FireAction("repairGenerator", obj)
                    FireAction("getOnGenerator", obj)
                end
            end
        end,
    })

    local Items = Tabs.Automatic:AddGroupbox({
        Side = "Right",
        Name = "Items",
        IconName = "package",
    })

    Items:AddToggle("AuraPickUp", {
        Text = "Aura PickUp Item",
        Default = false,
        Callback = function(v)
            State.AuraPickUp = v == true
        end,
    })

    Items:AddInput("AuraDistance", {
        Text = "Distance Aura",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "20",
        Callback = function(value)
            State.AuraDistance = tonumber(value) or 20
        end,
    })

    Items:AddToggle("AutoUseBandage", {
        Text = "Auto Use Bandage",
        Default = false,
        Callback = function(v)
            State.AutoUseBandage = v == true
        end,
    })

    Items:AddToggle("AutoUseDrink", {
        Text = "Auto Use Drink",
        Default = false,
        Callback = function(v)
            State.AutoUseDrink = v == true
        end,
    })

    Items:AddInput("BandageWhen", {
        Text = "Use Bandage When",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "50",
        Callback = function(value)
            State.BandageWhen = tonumber(value) or 50
        end,
    })

    Items:AddInput("DrinkWhen", {
        Text = "Use Drink When",
        Default = "",
        Numeric = true,
        Finished = false,
        Placeholder = "30",
        Callback = function(value)
            State.DrinkWhen = tonumber(value) or 30
        end,
    })
end

if ThemeManager then
    pcall(function()
        ThemeManager:SetLibrary(Library)
        ThemeManager:SetFolder("Route06SW")
        ThemeManager:ApplyToTab(Tabs.Home)
    end)
end

if SaveManager then
    pcall(function()
        SaveManager:SetLibrary(Library)
        SaveManager:IgnoreThemeSettings()
        SaveManager:SetFolder("Route06SW")
        SaveManager:BuildConfigSection(Tabs.Home)
        SaveManager:LoadAutoloadConfig()
    end)
end
