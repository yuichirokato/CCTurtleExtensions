--- @module slotkit
local slotkit = {}

-- class
local SlotKit = {}

function SlotKit:isSlotFill(slotNumber)
    turtle.select(slotNumber)
    
    local itemSpace = turtle.getItemSpace()

    turtle.select(self.currentSlot)

    return itemSpace == 0
end

function SlotKit:isSlotEmpty(slotNumber)
    return not self.isSlotFill(slotNumber)
end

function SlotKit:isMultipleSlotFill(slotNumbers)
    if type(slotNumbers) ~= "table" then
        return false, "argument must be table"
    end

    local resultTable = {}

    for _, value in pairs(slotNumbers) do
        turtle.select(value)

        local itemSpace = turtle.getItemSpace()
        table.insert(resultTable, value, itemSpace == 0)
    end

    turtle.select(self.currentSlot)

    return resultTable, nil
end

function SlotKit:isAllSlotFill()
    return self.getEmptySlotCount() == 0
end

function SlotKit:getEmptySlotCount()
    local result = 0

    for i = 1, 16 do
        turtle.select(i)

        local itemSpace = turtle.getItemSpace()
        if itemSpace == 64 then
            result = result + 1
        end
    end

    return result
end

function slotkit.new()
    local self = {}
    self.currentSlot = 1
    setmetatable(self, { __index = SlotKit })

    return self
end

return slotkit