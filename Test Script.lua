local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local HRP = nil

local function EmergencySafeDisconnect()
    task.synchronize()
    
    local NetworkModule = ReplicatedStorage:FindFirstChild("SharedUtils") and ReplicatedStorage.SharedUtils:FindFirstChild("Network")
    if NetworkModule then
        local success, Network = pcall(require, NetworkModule)
        if success and type(Network) == "table" then
            Network.Post = function() end
            Network.Get = function() return nil end
            Network.FireAllClients = function() end
        end
    end
    
    shared.FrameCounter = -1 / 0
    
    local CrashScreen = Instance.new("ScreenGui")
    CrashScreen.Name = "NetworkErrorOverride"
    CrashScreen.DisplayOrder = 999999
    
    local Background = Instance.new("Frame")
    Background.Size = UDim2.fromScale(1, 1)
    Background.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Background.Parent = CrashScreen
    
    local Message = Instance.new("TextLabel")
    Message.Size = UDim2.fromScale(0.8, 0.2)
    Message.Position = UDim2.fromScale(0.5, 0.5)
    Message.AnchorPoint = Vector2.new(0.5, 0.5)
    Message.BackgroundTransparency = 1
    Message.Text = "Bypassed Be Careful Anyways"
    Message.TextColor3 = Color3.fromRGB(255, 65, 65)
    Message.TextSize = 32
    Message.Font = Enum.Font.GothamBold
    Message.Parent = Background
    
    CrashScreen.Parent = LocalPlayer:WaitForChild("PlayerGui")
    
    RunService.RenderStepped:Connect(function()
        while true do
            pcall(function()
                local allocation = string.rep("DISCONNECT_LAG_LOCK_", 50000)
            end)
        end
    end)
end

local function MonitorCharacter(character)
    if not character then return end
    HRP = character:WaitForChild("HumanoidRootPart", 10)
    
    if HRP then
        local oldIndex
        oldIndex = hookmetamethod(game, "__index", function(self, key)
            if not checkcaller() and self == HRP and (key == "AssemblyLinearVelocity" or key == "Velocity") then
                return Vector3.new(0, 0, 0)
            end
            return oldIndex(self, key)
        end)
    end
end

local function StartSecurityInterception()
    if LocalPlayer:GetAttribute("KM_LOCAL_DEBUG_REFRESH_FPS") then
        LocalPlayer:SetAttribute("KM_LOCAL_DEBUG_REFRESH_FPS", 0)
    end
    
    RunService.Heartbeat:Connect(function()
        if workspace:GetAttribute("KM_DEBUG_SERVER_SCANNING_SPEED") then
            pcall(function()
                workspace:SetAttribute("KM_DEBUG_SERVER_SCANNING_SPEED", 0)
            end)
        end
        
        local speedCounter = workspace:GetAttribute("KM_DEBUG_SPEED_CHEAT_COUNTER") or 0
        local flyCounter = workspace:GetAttribute("KM_DEBUG_FLY_CHEAT_COUNTER") or 0
        local maxDetections = workspace:GetAttribute("KM_DEBUG_SPEED_CHEAT_MAX_DETECTIONS") or 5
        
        if speedCounter >= (maxDetections - 1) or flyCounter >= 3 then
            EmergencySafeDisconnect()
        end
        
        local panicMode = workspace:FindFirstChild("Info") and workspace.Info:FindFirstChild("Panic")
        if panicMode and panicMode.Value == true then
            if HRP then
                local raycastParams = RaycastParams.new()
                raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                raycastParams.FilterDescendantsInstances = {LocalPlayer.Character}
                
                local groundRay = workspace:Raycast(HRP.Position, Vector3.new(0, -20, 0), raycastParams)
                if not groundRay and not LocalPlayer.Character.Humanoid:GetAttribute("_HopInProgress") then
                    EmergencySafeDisconnect()
                end
            end
        end
    end)
    
    workspace.DescendantAdded:Connect(function(descendant)
        if descendant.Name == "BassieChunk" or descendant.Name == "FreezerFrost" or descendant.Name == "BassieChunkZone" then
            task.wait()
            pcall(function()
                descendant.CanTouch = false
                descendant.CanQuery = false
                descendant.CanCollide = false
            end)
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(MonitorCharacter)
if LocalPlayer.Character then
    task.spawn(MonitorCharacter, LocalPlayer.Character)
end

task.spawn(StartSecurityInterception)
