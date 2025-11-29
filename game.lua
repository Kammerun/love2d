local game = {}

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
end

return game