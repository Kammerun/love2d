local LevelMeta = {}
LevelMeta.__index = LevelMeta

LevelMeta.name = ""
LevelMeta.enemys = {}

local enemy = require("meta/enemy_meta")

function LevelMeta:Initialize()
    for k, v in pairs(self.enemys) do
        local new_enemy = enemy:Create()
        if not new_enemy then return end
        new_enemy:SetSize(v.size or 5)

        local window_width, window_height = love.window.getMode()
        local enemy_size = new_enemy:GetSize()
        local pos_x = v.x or math.random(0 + enemy_size, window_width - enemy_size)
        local pos_y = v.y or math.random(0 + enemy_size, window_height - enemy_size)
        new_enemy:SetPos(pos_x, pos_y)
    end
end

return LevelMeta