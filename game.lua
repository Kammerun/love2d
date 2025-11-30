local game = {}

game.level = 1

---Checks Collision from ply, bullets and enemys
---@param dt any
---@param ply any
---@param bullet any
---@param enemy any
function game:CheckCollisions(dt, ply, bullet, enemy)
    local bullets = bullet:GetBullets()
    local enemys = enemy:GetEnemys()

    -- Bullet Collision
    for i = #bullets, 1, -1 do
        local cur_bullet = bullets[i]
        local bullet_x, bullet_y = cur_bullet:GetPos()

        for j = #enemys, 1, -1 do
            local cur_enemy = enemys[j]
            -- https://de.serlo.org/mathe/1783/abstand-zweier-punkte-berechnen
            local enemy_x, enemy_y = cur_enemy:GetPos()
            local distance = math.sqrt((enemy_x - bullet_x) ^ 2 + (enemy_y - bullet_y) ^ 2)

            if distance < (cur_bullet:GetSize() + cur_enemy:GetSize()) then
                table.remove(bullets, i)
                table.remove(enemys, j)
            end
        end
    end

    if #enemys == 0 then
        print("DEBUG: Next Level")
        self:NextLevel()
    end
end

function game:GetLevel()
    return self.level
end

function game:SetLevel(lvl)
    self.level = lvl
    self:HandleLevels()
end

function game:NextLevel()
    self.level = self.level + 1
    self:HandleLevels()
end

function game:HandleLevels()
    local current_level = "level_" .. self:GetLevel()

    local level = require("levels/" .. current_level)
    if not level then
        error("Error while loading level: " .. current_level)
    end

    level:Initialize()
end

return game