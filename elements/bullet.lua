local bullet = {}
local bullets = {}

local BulletObject = require("meta/bullet_meta")

---Creates a bullet with given Arguments
---@param owner any
---@param direction table
---@param radius integer
function bullet:Create(owner, direction, radius)
    if not owner then return end

    if #direction ~= 2 then error("Direction must be a 2D vector") end

    local x, y = owner:GetPos()

    local newBullet = setmetatable({
        owner = owner,
        direction = direction,
        x = x,
        y = y,
        radius = radius,
        speed = 1
    }, BulletObject)

    table.insert(bullets, newBullet)

    return newBullet
end

---Checks if bullet is in window and deletes if not
function bullet:CheckInBounds()
    for i = #bullets, 1, -1 do
        local b = bullets[i]

        if not b.keepAfterExit then
            local radius = b.radius
            local window_width, window_height = love.window.getMode()

            -- Check X
            if b.x < 0 - radius or b.x > window_width + radius then
                table.remove(bullets, i)
                goto continue
            end

            -- Check Y
            if b.y < 0 - radius or b.y > window_height + radius then
                table.remove(bullets, i)
                goto continue
            end
        end

        ::continue::
    end
end

function bullet:Update()
    for i, b in ipairs(bullets) do
        b:Update()
    end
    self:CheckInBounds()

    --- print(#bullets)
end

function bullet:Draw()
    for _, b in ipairs(bullets) do
        love.graphics.circle("fill", b.x, b.y, b.radius)
    end
end

return bullet
