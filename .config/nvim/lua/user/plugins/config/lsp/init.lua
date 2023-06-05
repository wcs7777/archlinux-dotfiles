local ok, _ = pcall(require, 'lspconfig')
if not ok then
	return
end
require('user.plugins.config.lsp.mason')
require('user.plugins.config.lsp.handlers').setup()
require('user.plugins.config.lsp.null-ls')
require('user.plugins.config.lsp.cmp')
require('user.plugins.config.lsp.remap')
require('user.plugins.config.lsp.remap')
