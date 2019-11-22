-- if not turtle then
--     printError("Requires a Turtle")
--     return
-- end

local FuelKit = { fuelSlot = 16 }

function FuelKit:refuelTurtleIfNeeded(refuelCount)
    local fuelLevel = turtle.getFuelLevel()
    local self = FuelKit
    if fuelLevel == "unlimited" or fuelLevel > 0 then
        return
    end

    local count = (refuelCount == nil) and 0 or refuelCount
    turtle.select(self.fuelSlot)
    turtle.refuel(count)
    turtle.select(1)
end

function FuelKit:isFuelEnoughBackToStartPoint(moveCount)
    return turtle.getFuelLevel() < moveCount
end

return FuelKit