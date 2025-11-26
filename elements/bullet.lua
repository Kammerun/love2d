local bullet = {}
local bullets = {}


---Creates a bullet with given Arguments
---@param owner any
---@param direction table
---@param radius integer
function bullet:Create(owner, direction, radius)
    if not owner then return end

    -- validcheck the direction
    if #direction ~= 2 then error("Direction of Bullet must be a Vector of 2 integers") end
    if type(direction[1]) ~= "number" or type(direction[2]) ~= "number" then error("Direction is not an integer!") end
    
    local x, y = owner:GetPos()

    table.insert(bullets, {
        owner = owner,
        direction = direction,
        x = x,
        y = y,
        radius = radius
    })
end

---Checks if bullet is in window and deletes if not
function bullet:CheckInBounds()
    for i = #bullets, 1, -1 do
        local b = bullets[i]

        if not b.keepAfterExit then
            local radius = b.radius

            -- Check X
            if b.x < 0 - radius or b.x > 1024 + radius then
                table.remove(bullets, i)
                goto continue
            end

            -- Check Y
            if b.y < 0 - radius or b.y > 768 + radius then
                table.remove(bullets, i)
                goto continue
            end
        end

        ::continue::
    end
end

function bullet:Update()
    for k, bullet in pairs(bullets) do
        bullet.x = bullet.x + bullet.direction[1]
        bullet.y = bullet.y + bullet.direction[2]
    end
    
    self:CheckInBounds()
end

function bullet:Draw()
    for k, bullet in pairs(bullets) do
        love.graphics.circle("fill", bullet.x, bullet.y, bullet.radius)
    end
end

return bullet