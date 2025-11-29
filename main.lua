require("libs/math")

local game
local ply
local bullet
local enemy
function love.load()
    game = require("game")
    ply = require("elements/player")
    bullet = require("elements/bullet")
    enemy = require("elements/enemy")

    for i = 5, 1, -1 do
        local new_enemy = enemy:Create()
        if not new_enemy then return end
        new_enemy:SetSize(5)

        local window_width, window_height = love.window.getMode()
        local enemy_size = new_enemy:GetSize()
        local random_x = math.random(0 + enemy_size, window_width - enemy_size)
        local random_y = math.random(0 + enemy_size, window_height - enemy_size)
        new_enemy:SetPos(random_x, random_y)
    end
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
    enemy:Draw()
end