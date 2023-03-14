local connection = {}
function connection:new(signal, fn)
	local new_connection = setmetatable({signal = signal, fn = fn, idx = #signal.connections + 1}, self)
	self.__index = self
	table.insert(signal.connections, new_connection)
	return new_connection
end
function connection:disconnect()
	table.remove(self.signal.connections, self.idx)
end

local signal = {}
function signal:register(fn)
	return connection:new(self, fn)
end
function signal:clear()
	self.connections = {}
end
function signal:fire(...)
	local connections = self.connections
	local returns = {}
	for idx = 1, #connections do
		returns[idx] = connections[idx].fn(...)
	end
	return returns
end
function signal:create()
	local new_signal = setmetatable({connections = {}}, self)
	self.__index = self
	return new_signal
end
-- ex usage:
local firebullet = signal:create()
firebullet:register(function(a)
	print(a)
end)
firebullet:fire("adsfjkngkdfsjg")

local onfalldamage = signal:create()
local output_falldamage_info = onfalldamage:register(function(a, b, c)
	print(a, b, c)
end)

onfalldamage:fire("fell", "plr here", 10)

firebullet:fire("shita.")
onfalldamage:fire("t", "plr", 100)
output_falldamage_info:disconnect()
onfalldamage:fire("t", "plr", 100)