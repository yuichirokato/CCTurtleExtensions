local DigKit = {}
local fuelKit = require("fuel_kit")

function DigKit:tryDig()
    while turtle.detect() do
        if turtle.dig() then
            sleep(0.5)
        else
            return false
        end
    end

    return true
end

function DigKit:tryDigUp()
    while turtle.detectUp() do
        if turtle.digUp() then
            sleep(0.5)
        else
            return false
        end
    end

    return true
end

function DigKit:tryDigDown()
    while turtle.detectDown() do
        if turtle.digDown() then
            sleep(0.5)
        else
            return false
        end
    end

    return true
end

function DigKit:tryUp()
    local self = DigKit
    fuelKit.refuelTurtleIfNeeded()

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

function DigKit:tryDown()
    local self = DigKit
    fuelKit.refuelTurtleIfNeeded()

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

function DigKit:tryForward()
    local self = DigKit
    fuelKit.refuelTurtleIfNeeded()

    while not turtle.forward() do
        if turtle.detect() then
            if not tryDig() then
                return false
            else
                sleep(0.5)
            end
        end
    end

    return true
end

function DigKit:digTunnel(tunnelLength, tunnelWidth, tunnelHeight)
    print("tunneling...")
    print("tunnelLength: ", tunnelLength)

    local width = tunnelWidth - 1
    for i = 1, tunnelLength do
        self.tryDig()
        self.tryForward()
        
        -- トンネルの縦を掘る
        for j = 1, tunnelHeight do
            turtle.turnLeft()

            -- トンネルの横を掘る
            for k = 1, width do
                self.tryDig()

                if k < width then
                    self.tryForward()
                end
            end

            -- トンネルの右端に戻る
            local backCount = width - 1
            for k = 1, backCount do
                turtle.back()
            end

            turtle.turnRight()

            if j < tunnelHeight then
                self.tryDigUp()
                self.tryUp()
            end
        end

        local backCount = tunnelHeight - 1
        for j = 1, backCount do
            self.tryDown()
        end
    end
end

function DigKit:digStair(stairDepth, stairLength)
    for i = 1, stairDepth do
        self.tryDigDown()
        self.tryDown()

        for i = 1, stairLength do
            if i < stairLength then
                self.tryDig()
            end

            turtle.turnLeft()
            self.tryDig()
            turtle.turnRight()

            if i < stairLength then
                self.tryForward()
            end
        end

        local backCount = stairLength - 2
        for i = 1, backCount do
            turtle.back()
        end
    end
end

return DigKit