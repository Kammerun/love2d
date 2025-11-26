require("libs/math")

local ply
local bullet
function love.load()
    ply = require("elements/player")
    bullet = require("elements/bullet")
end

function love.update(dt)
    ply:Update(dt)
    bullet:Update(dt)
end

function love.draw()
    --[[ love.graphics.print("Hello World", 400, 300) ]]
    ply:Draw()
    bullet:Draw()
end