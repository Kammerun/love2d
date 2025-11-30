local enemys = {}

local entity_meta = require("meta/entity_meta")
local enemy = setmetatable({}, entity_meta)

---Returns a Table containing all Enemys
---@return table
function enemy:GetEnemys()
    return enemys
end

function enemy:Create()
    local new_enemy = setmetatable({}, entity_meta)

    table.insert(enemys, new_enemy)

    return new_enemy
end

function enemy:DrawAllEnemys()
    for _, v in pairs(enemys) do
        v:Draw()
    end
end

return enemy