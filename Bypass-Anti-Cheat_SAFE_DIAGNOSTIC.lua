local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local report = {
    Client = RunService:IsClient(),
    PlaceVersion = game.PlaceVersion,
    PlayerAvailable = Players.LocalPlayer ~= nil,
    CoreAvailable = false,
    SystemAvailable = false,
    CheatCheckAvailable = false,
    CheatCheckType = "unavailable",
    MissingMethods = {}
}

local core = ReplicatedStorage:FindFirstChild("Core")
if core then
    report.CoreAvailable = true
    local system = core:FindFirstChild("System")
    if system then
        report.SystemAvailable = true
        local module = system:FindFirstChild("CheatCheck")
        if module and module:IsA("ModuleScript") then
            report.CheatCheckAvailable = true
            local ok, value = pcall(require, module)
            if ok then
                report.CheatCheckType = typeof(value)
                if type(value) == "table" then
                    for _, name in ipairs({"Scan", "Runs", "Run", "Stamp"}) do
                        if type(value[name]) ~= "function" then
                            table.insert(report.MissingMethods, name)
                        end
                    end
                end
            else
                report.CheatCheckType = "require failed: " .. tostring(value)
            end
        end
    end
end

print("[Stability Diagnostic] Client: " .. tostring(report.Client))
print("[Stability Diagnostic] PlaceVersion: " .. tostring(report.PlaceVersion))
print("[Stability Diagnostic] LocalPlayer available: " .. tostring(report.PlayerAvailable))
print("[Stability Diagnostic] Core available: " .. tostring(report.CoreAvailable))
print("[Stability Diagnostic] System available: " .. tostring(report.SystemAvailable))
print("[Stability Diagnostic] CheatCheck module available: " .. tostring(report.CheatCheckAvailable))
print("[Stability Diagnostic] CheatCheck result: " .. tostring(report.CheatCheckType))

if #report.MissingMethods > 0 then
    warn("[Stability Diagnostic] Missing or changed methods: " .. table.concat(report.MissingMethods, ", "))
end

print("[Stability Diagnostic] No hooks, remote calls, kicks, or security changes were performed.")
