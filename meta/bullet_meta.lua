local EntityObject = require("meta/entity_meta")

local BulletObject = setmetatable({}, EntityObject)
BulletObject.__index = BulletObject

function BulletObject:Update()
    local speed = self.speed or 1

    self.x = self.x + self.direction[1] * speed
    self.y = self.y + self.direction[2] * speed
end

return BulletObject