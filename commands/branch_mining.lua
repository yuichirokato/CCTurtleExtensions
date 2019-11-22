-- functions
local function refuelTurtle()
    turtle.select(16)
    turtle.refuel()
end

local function dig1Column(isEven, miningHeight)
    for i = 1, miningHeight do
        local move = isEven and turtle.down or turtle.up
        turtle.dig()
        if i < miningHeight then
            move()
        end
    end
end

local function moveToNextColumn(isEven, miningHeight)
    local turn = isEven and turtle.turnLeft or turtle.turnRight
    turn()

    for i = 1, 4 do
        if not isEven then
            dig1Column(i % 2 == 0, miningHeight)
        end
        
        turtle.forward()    
    end

    turn()
end

local function branchMining(miningDepth, miningHeight, miningColumnCount)
    local moveCount = 0
    for i = 1, miningColumnCount do
        for j = 1, miningDepth do
            dig1Column(j % 2 == 0, miningHeight)
            turtle.forward()
            moveCount = j
        end

        moveToNextColumn(i % 2 == 0, miningHeight)
    end
end

-- main
local args = {...}
local miningDepth = 20
local miningHeight = 3
local miningColumnCount = 2

if args[1] and tonumber(args[1]) then
    miningDepth = tonumber(args[1])
end

if args[2] and tonumber(args[2]) then
    miningHeight = tonumber(args[2])
end

if args[3] and tonumber(args[3]) then
    miningColumnCount = tonumber(args[3])
end

refuelTurtle()
branchMining(miningDepth, miningHeight, miningColumnCount)
