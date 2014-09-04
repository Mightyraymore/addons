local Pos = {}

function Pos.new(...)
	local self = {pos={}}
	
	local tempPos = {}
	local args = {...}
	if type(args[1]) == 'table' then
		tempPos = args[1]
	else
		tempPos = args
	end
	
	self.pos.x = tempPos.x or tempPos[1] or 0
	self.pos.y = tempPos.y or tempPos[2] or 0
	self.pos.z = tempPos.z or tempPos[3] or 0
	return setmetatable(self, {__index = Pos, __eq = Pos.equals})
end

function Pos:x()
	return self.pos.x
end

function Pos:y()
	return self.pos.y
end

function Pos:z()
	return self.pos.z
end

function Pos:equals(other)
	if other == nil then return nil end
	return (self.pos.x == other:x()) and (self.pos.y == other:y()) and (self.pos.z == other:z())
end

function Pos:getDistance(other)
	if other == nil then return nil end
	local dx = self.pos.x - other:x()
	local dy = self.pos.y - other:y()
	return math.sqrt((dx^2)+(dy^2))
end

return Pos