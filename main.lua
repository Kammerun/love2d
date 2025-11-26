require("libs/math")
require("conf")

local ply
function love.load()
    ply = require("player")
end

function love.update(dt)
    ply:ApplyMovement(dt)
end

function love.draw()
    love.graphics.print("Hello World", 400, 300)
    ply:Draw()
end