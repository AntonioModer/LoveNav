point = class()

function point:init(x,y)
	self.x = x
	self.y = y
	self.triangles = {}
end


function point:addTriangle(t)
	self.triangles[#self.triangles+1] = t
end

function point:remove()
	for i = #self.triangles,1,-1 do
		self.triangles[i]:remove()
	end
	local i = getPointIndex(self)
	table.remove(points,i)
end

function point:removeTriangle(t)
	for i,v in ipairs(self.triangles) do
		if sameTriangle(v,t) then
			table.remove(self.triangles,i)
		end
	end
end

function point:simplify()
	local simplePoint = {x = self.x, y = self.y}
	return simplePoint

end


function containsPoint(l,p)
	for i,v in ipairs(l) do
		if samePoint(v,p) then
			return true
		end
	end
	return false
end

function getPointIndex(point)
	for i,v in ipairs(points) do
		if samePoint(point,v) then
			return i
		end
	end
end

function findPoint(x,y,distance)
	for i,v in ipairs(points) do
		if dist({x = x, y = y},v) < distance then
			return v
		end
	end
	return nil
end

function samePoint(a,b)
	return (a.x == b.x and a.y == b.y)
end


function determinant(x1,y1,x2,y2)
	return x1*y2 - x2*y1
end