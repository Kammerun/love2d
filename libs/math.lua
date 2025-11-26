---Clamps a value between to other values
---@param value integer
---@param min integer
---@param max integer
---@return integer
function math.Clamp(value, min, max)
    return math.min(math.max(value, min), max)
end