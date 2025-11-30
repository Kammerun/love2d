require("libs/math")

local game
local ply
local bullet
local enemy
function love.load()
    math.randomseed(os.time())

    game = require("game")
    ply = require("elements/player")
    bullet = require("elements/bullet")
    enemy = require("meta/enemy_meta")
    
    game:HandleLevels()
end

function love.update(dt)
    ply:Update(dt)
    bullet:Update(dt)

    game:CheckCollisions(dt, ply, bullet, enemy)
end

function love.draw()
    --[[ love.graphics.print("Hello World", 400, 300) ]]
    ply:Draw()
    bullet:Draw()
    enemy:DrawAllEnemys()
end