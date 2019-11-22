-- config
MIN_FUEL_LEVEL = 10
CLOSE_HOLE_FLAG = true
LID_BLOCK_SLOT = 1

local args = {...}

if #args > 0 then
    CLOSE_HOLE_FLAG = not CLOSE_HOLE_FLAG
end

-- functions
function myRefuel()
    local function refuelAll()
        for i=1, 16 do
            turtle.select(i)
            turtle.refuel()
        end
        print("Fuel: ", turtle.getFuelLevel(), "(required: ", MIN_FUEL_LEVEL, ")")
    end

    refuelAll()

    -- 設定した最低燃料を上回るまで待つ
    while turtle.getFuelLevel() < MIN_FUEL_LEVEL do
        os.sleep(1)
        -- wait for putting items in inventory
        os.pullEvent("turtle_inventory")
        refuelAll()
    end

    turtle.select(1)
end

function resolve(depth)
    -- 時計回りに4方向を掘る
    for i=1, 4 do
        turtle.dig()
        turtle.turnRight()
    end

    -- 真下を掘る
    turtle.digDown()

    -- 1ブロック降りる
    if turtle.getFuelLevel() > depth then
        return turtle.down()
    else
        return false
    end
end

function closeHole()
    turtle.select(LID_BLOCK_SLOT)
    turtle.down()

    for i=1, 4 do
        turtle.place()
        turtle.turnRight()
    end
    
    turtle.up()
    turtle.placeDown()
end

function backToHome(homePosition)
    for i=1, homePosition do
        turtle.up()
    end
end

-- main
myRefuel()

local depth = 0
while resolve(depth) do
    depth = depth + 1
end

backToHome(depth)

if CLOSE_HOLE_FLAG then
    closeHole()
end