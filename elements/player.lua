local bullet = require("elements/bullet")
local entity_meta = require("meta/entity_meta")

local ply = setmetatable({}, entity_meta)
if not ply then return end -- this better not be happening
ply:SetPos(20, 60)
ply:SetSpeed(3)
ply:SetSize(10)

ply.shoot_delay = 0.1
ply.next_attack = 0

---Returns if player can shoot
---@return boolean
function ply:CanAttack()
	local bCanAttack = true

	if love.timer.getTime() < self.next_attack then
		bCanAttack = false
	end

	return bCanAttack
end

---Returnes a Vector with the directions the mouse is in relation to the player
---@return table
function ply:GetLookingAtVector()
	local mx, my = love.mouse.getPosition()
	local px, py = self:GetPos()
	
	local dx = mx - px
    local dy = my - py

    if dx == 0 and dy == 0 then
        return {0, 0}
    end

    local theta = math.atan2(dy, dx)

    local dirX = math.cos(theta)
    local dirY = math.sin(theta)

    return {dirX, dirY}
end

function ply:ApplyMovement(dt)
	if love.keyboard.isDown("up", "w") then
		ply.y = ply.y - ply.speed
	end

	if love.keyboard.isDown("left", "a") then
		ply.x = ply.x - ply.speed
	end

	if love.keyboard.isDown("right", "d") then
		ply.x = ply.x + ply.speed
	end

	if love.keyboard.isDown("down", "s") then
		ply.y = ply.y + ply.speed
	end

	if love.keyboard.isDown("space") then
		if self:CanAttack() then
			self.next_attack = love.timer.getTime() + self.shoot_delay

			local direction = self:GetLookingAtVector()
			local size = 2

			local b = bullet:Create(self, direction, size)
			if not b then return end
			b:SetSpeed(3)
		end
	end

	local size = self.size
	local window_width, window_height = love.window.getMode()
	self.x = math.Clamp(self.x, 0 + size, window_width - size)
	self.y = math.Clamp(self.y, 0 + size, window_height - size)
end

function ply:Update(dt)
	self:ApplyMovement(dt)
end

function ply:Draw()
	love.graphics.setColor(self:GetColor())
	love.graphics.circle("fill", self.x, self.y, self.size)
end

return ply
