local EntityObject = {}
EntityObject.__index = EntityObject

EntityObject.x = 0
EntityObject.y = 0
EntityObject.size = 5
EntityObject.speed = 0
EntityObject.color = {r = 1, g = 1, b = 1}
-- implement moving direction

---Returns the x and y Position of a Entity
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

---Returns the speed of the Entity
---@return integer
function EntityObject:GetSpeed()
    return self.speed
end

---Sets the speed of the Entity
---@param speed integer
function EntityObject:SetSpeed(speed)
    self.speed = speed
end

---Returns the size of the Entity
---@return integer
function EntityObject:GetSize()
    return self.size
end

---Sets the size of the Entity
---@param size integer
function EntityObject:SetSize(size)
    self.size = size
end

---Gets the Color-Values from the Entity (rgb) 0-1
---@return integer
---@return integer
---@return integer
function EntityObject:GetColor()
    return self.color.r, self.color.g, self.color.b
end

---Sets the color of the Entity
---@param r integer
---@param g integer
---@param b integer
function EntityObject:SetColor(r, g, b)
    self.color.r = r
    self.color.g = g
    self.color.b = b
end

function EntityObject:Draw()
    love.graphics.setColor(self:GetColor())
    local x, y = self:GetPos()
    love.graphics.circle("fill", x, y, self:GetSize())
end

return EntityObject