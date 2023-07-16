local join_tables = require('user.utils.join_tables')
return function(plugins, module)
	return join_tables(plugins, require('user.plugins.' .. module))
end

