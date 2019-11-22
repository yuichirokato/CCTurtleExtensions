-- config
local tunnelLength = 1
local tunnelHeight = 1
local tunnelWidth = 1

-- functions
-- local function refuelTurtle()
--     turtle.select(16)
--     turtle.refuel()
-- end

local function digTunnel(tunnelLength, tunnelWidth, tunnelHeight)
    local width = tunnelWidth - 1

end

--main
local args = {...}
local digKit = require("dig_kit")
if args[1] and tonumber(args[1]) then
    tunnelLength = tonumber(args[1])
end

if args[2] and tonumber(args[2]) then
    tunnelWidth = tonumber(args[2])
end

if args[3] and tonumber(args[3]) then
    tunnelHeight = tonumber(args[3])
end

print("args[1]: ", tunnelLength)
print("args[2]: ", tunnelWidth)
print("args[3]: ", tunnelHeight)

digKit:digTunnel(tunnelLength, tunnelWidth, tunnelHeight)
-- refuelTurtle()
-- digTunnel(tunnelLength, tunnelWidth, tunnelHeight)