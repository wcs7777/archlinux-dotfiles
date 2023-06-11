local join_tables = require('user.utils.join_tables')

return function(plugins)
	local dest = {}
	for _, plugin in ipairs(plugins) do
		dest = join_tables(dest, require('user.plugins.' .. plugin))
	end
	return dest
end
