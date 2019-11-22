-- config
local STAIR_SLOT_NUMBER = 15

-- functions
function refuelTurtle()
    turtle.select(16)
    turtle.refuel()
end

function placeStair()
    turtle.select(STAIR_SLOT_NUMBER)
    local isFirstStep = true

    while true do
        local itemCount = turtle.getItemCount()
        if itemCount <= 0 then
            break
        end

        if isFirstStep then
            isFirstStep = false
            turtle.back()
            turtle.down()
        end

        turtle.back()
        turtle.place()

        if not turtle.down() then
            break
        end
    end
end

-- main
refuelTurtle()

placeStair()