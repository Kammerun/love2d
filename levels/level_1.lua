local level_meta = require("meta/level_meta")

local level_01 = setmetatable({}, level_meta)

level_01.enemys = {
    {
        size = 5,
    },
    {
        size = 10
    },
    {
        size = 15
    }
}

return level_01