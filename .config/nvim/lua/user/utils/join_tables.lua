return function(...)
	local tables = { ... }
	local dest = {}
	for _, tbl in pairs(tables) do
		for _, row in pairs(tbl) do
			table.insert(dest, row)
		end
	end
	return dest
end
