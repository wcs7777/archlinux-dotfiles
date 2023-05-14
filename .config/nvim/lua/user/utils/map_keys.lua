local join_tables = require('user.utils.join_tables')
return function(tbl, mapping)
	local dest = join_tables(tbl)
	for _, row in pairs(dest) do
		for key, value in pairs(mapping) do
			if row[key] ~= nil then
				row[value] = row[key]
			end
		end
	end
	return dest
end

