require('user.utils.configure_plugins')('lsp', {
	'treesitter',
	'mason',
	'nvim-cmp',
	'null-ls',
})
require('user.plugins.configuration.lsp.handlers').setup()
require('user.utils.require_modules')('user.plugins.configuration.lsp.', {
	'remap',
})
