local config = require('user.utils.config-plugin')
local plugins = {
	'nvim-surround',
	'text-case.nvim',
	'Comment.nvim',
}
for _, plugin in pairs(plugins) do
	config(plugin)
end

