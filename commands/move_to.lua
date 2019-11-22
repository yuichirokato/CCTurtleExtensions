-- functions
function moveToTop(top)
    for i = 1, top do
        turtle.forward()
    end
end

function moveToRight(right)
    if right <= 0 then
        return
    end
    turtle.turnRight()

    for i = 1, right do
        turtle.forward()
    end

    turtle.turnLeft()
end

function moveToBottom(bottom)
    for i = 1, bottom do
        turtle.back()
    end
end

function moveToLeft(left)
    if left <= 0 then
        return
    end
    turtle.turnLeft()

    for i = 1, left do
        turtle.forward()
    end

    turtle.turnRight()
end

local args = {...}

local top = 0
local right = 0
local bottom = 0
local left = 0

if args[1] and tonumber(args[1]) then
    top = tonumber(args[1])
end

if args[2] and tonumber(args[2]) then
    right = tonumber(args[2])
end

if args[3] and tonumber(args[3]) then
    bottom = tonumber(args[3])
end

if args[4] and tonumber(args[4]) then
    left = tonumber(args[4])
end

moveToTop(top)
moveToRight(right)
moveToBottom(bottom)
moveToLeft(left)