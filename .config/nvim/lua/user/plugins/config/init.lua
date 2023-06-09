local config = require('user.utils.config_plugin')
local plugins = {
	'bufferline',
	'Comment',
	'easy-align',
	'harpoon',
	'lualine',
	'Navigator',
	'nord',
	'nvim-tree',
	'rose-pine',
	'surround',
	'telescope',
	'text-case',
	'tokyonight',
	'treesitter',
	'undotree',
	'which-key',
}
for _, plugin in pairs(plugins) do
	config(plugin)
end
require('user.plugins.config.lsp')
