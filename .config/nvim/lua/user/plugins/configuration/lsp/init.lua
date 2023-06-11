require('user.utils.configure_plugins')('lsp', {
})
require('user.plugins.configuration.lsp.handlers').setup()
require('user.utils.require_modules')('user.plugins.configuration.lsp.', {
	'mason',
	'null-ls',
	'cmp',
	'remap',
})
