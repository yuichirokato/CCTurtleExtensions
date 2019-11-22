-- functions
function backToStartPoint(stairDepth)
    for i = 1, stairDepth do
        turtle.up()
        turtle.back()
    end
end

--main
local digKit = require("dig_kit")
local args = {...}

if #args < 2 then
    print("Usage: kaidan <depth> <length>")
    return
end

local stairDepth = tonumber(args[1])
if stairDepth < 1 then
    print("Stair depth must be greater than 1")
    return
end

local stairLength = tonumber(args[2])
if stairLength < 1 then
    print("Stair length must be greater than 1")
    return
end

digKit:digStair(stairDepth, stairLength)
backToStartPoint(stairDepth)