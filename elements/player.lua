local bullet = require("elements/bullet")

local ply = {}

ply.x = 20
ply.y = 60
ply.radius = 10
ply.speed = 5
ply.shoot_delay = 0.1
ply.next_attack = 0

---Returns the x and y Position of a Player
---@return integer
---@return integer
function ply:GetPos()
	return self.x, self.y
end

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

	local radius = self.radius
	local window_width, window_height = love.window.getMode()
	self.x = math.Clamp(self.x, 0 + radius, window_width - radius)
	self.y = math.Clamp(self.y, 0 + radius, window_height - radius)
end

function ply:Update(dt)
	self:ApplyMovement(dt)
end

function ply:Draw()
	love.graphics.circle("fill", self.x, self.y, self.radius)
end

return ply
