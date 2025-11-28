require("libs/math")

local ply
local bullet
local enemy
function love.load()
    ply = require("elements/player")
    bullet = require("elements/bullet")
    enemy = require("elements/enemy")
    enemy:Create()
end

function love.update(dt)
    ply:Update(dt)
    bullet:Update(dt)
end

function love.draw()
    --[[ love.graphics.print("Hello World", 400, 300) ]]
    ply:Draw()
    bullet:Draw()
    enemy:Draw()
end