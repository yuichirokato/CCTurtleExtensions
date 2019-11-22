local args = {...}
local direction = "right"

if #args > 1 then
    direction = args[1]
end

if direction == "right" then
    turtle.turnRight()
else
    turtle.turnLeft()
end