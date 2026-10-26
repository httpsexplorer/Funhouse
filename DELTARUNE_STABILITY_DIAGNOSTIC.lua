local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local function hasFunction(name)
    return type(getfenv and getfenv()[name] or _G[name]) == "function"
end

local player = Players.LocalPlayer
local core = ReplicatedStorage:FindFirstChild("Core")
local system = core and core:FindFirstChild("System")
local checkModule = system and system:FindFirstChild("CheatCheck")

print("[DELTARUNE Stability Diagnostic] Started")
print("[DELTARUNE Stability Diagnostic] Client: " .. tostring(RunService:IsClient()))
print("[DELTARUNE Stability Diagnostic] PlaceVersion: " .. tostring(game.PlaceVersion))
print("[DELTARUNE Stability Diagnostic] LocalPlayer available: " .. tostring(player ~= nil))
print("[DELTARUNE Stability Diagnostic] Core folder available: " .. tostring(core ~= nil))
print("[DELTARUNE Stability Diagnostic] System folder available: " .. tostring(system ~= nil))
print("[DELTARUNE Stability Diagnostic] CheatCheck ModuleScript available: " .. tostring(checkModule ~= nil and checkModule:IsA("ModuleScript")))
print("[DELTARUNE Stability Diagnostic] getgc available: " .. tostring(hasFunction("getgc")))
print("[DELTARUNE Stability Diagnostic] loadstring available: " .. tostring(hasFunction("loadstring")))
print("[DELTARUNE Stability Diagnostic] hookfunction available: " .. tostring(hasFunction("hookfunction")))
print("[DELTARUNE Stability Diagnostic] hookmetamethod available: " .. tostring(hasFunction("hookmetamethod")))
print("[DELTARUNE Stability Diagnostic] getnamecallmethod available: " .. tostring(hasFunction("getnamecallmethod")))
print("[DELTARUNE Stability Diagnostic] This diagnostic does not require or modify CheatCheck.")
print("[DELTARUNE Stability Diagnostic] No hooks, remote calls, gameplay changes, or kicks were performed.")
