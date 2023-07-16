return function(...)
	local tables = { ... }
	local dest = {}
	for _, tbl in pairs(tables) do
		for _, value in pairs(tbl) do
			table.insert(dest, value)
		end
	end
	return dest
end

