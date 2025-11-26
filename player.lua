local ply = {}

ply.x = 20
ply.y = 60
ply.radius = 10
ply.speed = 5

local val = 0

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

	local radius = self.radius

	self.x = math.Clamp(self.x, 0 + radius, 1024 - radius)
	self.y = math.Clamp(self.y, 0 + radius, 768 - radius)
end

function ply:Draw()
	love.graphics.circle("fill", self.x, self.y, self.radius)
end

return ply
