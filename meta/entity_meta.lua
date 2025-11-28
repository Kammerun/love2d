local EntityObject = {}
EntityObject.__index = EntityObject

EntityObject.x = 0
EntityObject.y = 0
EntityObject.radius = 0
EntityObject.speed = 0

---Returns the x and y Position of a Player
---@return integer
---@return integer
function EntityObject:GetPos()
    return self.x, self.y
end

---Sets the position of the Entity
---@param x integer
---@param y integer
function EntityObject:SetPos(x, y)
    self.x = x
    self.y = y
end

---Sets the speed of the Entity
---@param speed integer
function EntityObject:SetSpeed(speed)
    self.speed = speed
end

---Sets the size of the Entity
---@param size integer
function EntityObject:SetSize(size)
    self.size = size
end

return EntityObject