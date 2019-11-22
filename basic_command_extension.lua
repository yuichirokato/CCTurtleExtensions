--- @module turtle.ex
local turtleextension = {}

-- class
local TurtleExtension = {}

function TurtleExtension:tryDig()
    while turtle.detect() do
        if turtle.dig() then
            sleep(0.5)
        else
            return false
        end
    end

    return true
end

function TurtleExtension:tryDigUp()
    while turtle.detectUp() do
        if turtle.digUp() then
            sleep(0.5)
        else
            return false
        end
    end

    return true
end

function TurtleExtension:tryDigDown()
    while turtle.detectDown() do
        if turtle.digDown() then
            sleep(0.5)
        else
            return false
        end
    end

    return true
end

function TurtleExtension:tryUp()
    while not turtle.up() do
        if turtle.detectUp() then
            if not self.tryDigUp() then
                return false
            end
        else
            sleep(0.5)
        end
    end

    return true
end

function TurtleExtension:tryDown()
    while not turtle.down() do
        if turtle.detectDown() then
            if not self.tryDigDown() then
                return false
            else
                sleep(0.5)
            end
        end
    end

    return true
end

function TurtleExtension:tryForward()
    while not turtle.forward() do
        if turtle.detect() then
            if not self.tryDig() then
                return false
            else
                sleep(0.5)
            end
        end
    end

    return true
end

function turtleextension.new()
    local self = {}
    setmetatable(self, { __index = TurtleExtension })

    return self
end

turtle.ex = turtleextension.new()