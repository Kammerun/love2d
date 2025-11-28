local enemys = {}

local entity_meta = require("meta/entity_meta")
local enemy = setmetatable({}, entity_meta)

function enemy:Create()

    local new_enemy = setmetatable({}, entity_meta)
    new_enemy:SetPos(40, 80)
    new_enemy:SetSize(5)

    table.insert(enemys, new_enemy)

    return new_enemy
end

function enemy:Draw()
    for k, v in pairs(enemys) do
        print(v)
        love.graphics.setColor(v:GetColor())
        local x, y = v:GetPos()
        love.graphics.circle("fill", x, y, v:GetSize())
    end
end

return enemy