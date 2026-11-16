local B = {}
B.v = "1.0.0"
B.hasGC = type(getgc) == "function"
B.hasHook = type(hookfunction) == "function"
B.hasRead = type(readfile) == "function"
B.hasWrite = type(writefile) == "function"
local ex = "unknown"
local blocked = false
pcall(function()
    local n = (identifyexecutor and identifyexecutor()) or (getexecutorname and getexecutorname()) or ""
    n = string.lower(tostring(n))
    if n ~= "" then ex = n end
    if string.find(n, "xeno", 1, true) or string.find(n, "solara", 1, true) then
        blocked = true
    end
end)
if blocked then
    error("[VSW] " .. ex .. " is not supported.")
end
B.executor = ex
B.Inst = setmetatable({}, { __mode = "k" })
function B.get(obj, key)
    if type(obj) ~= "table" and type(obj) ~= "userdata" then return nil end
    local t = B.Inst[obj]
    return t and t[key]
end
function B.set(obj, key, val)
    if type(obj) ~= "table" and type(obj) ~= "userdata" then return end
    local t = B.Inst[obj]
    if not t then t = {}; B.Inst[obj] = t end
    t[key] = val
end
function B.clear(obj) B.Inst[obj] = nil end
function B.count()
    local n = 0
    for _ in pairs(B.Inst) do n = n + 1 end
    return n
end
function B.status()
    return {
        version = B.v,
        executor = B.executor,
        gc = B.hasGC,
        hook = B.hasHook,
        read = B.hasRead,
        write = B.hasWrite,
        tracked = B.count(),
    }
end
_G.VSWbypass = B
shared.VSWbypass = B
return B
