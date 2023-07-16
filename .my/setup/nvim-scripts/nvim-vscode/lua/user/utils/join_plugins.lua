local join_tables = require('user.utils.join_tables')
return function(first, ...)
	local args = { ... }
	local dest = join_tables(first)
	for _, arg in pairs(args) do
		dest = join_tables(dest, require('user.plugins.' .. arg))
	end
	return dest
end

