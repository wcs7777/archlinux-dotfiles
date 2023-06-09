local servers = {
	'eslint',
	'jsonls',
	'lua_ls',
	'pyright',
	'sqlls',
}
require('mason').setup({ max_concurrent_installers = 1 })
require('mason-lspconfig').setup({
	ensure_installed = servers,
	automatic_installation = true,
})
local handlers = require('user.plugins.config.lsp.handlers')
local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
	return
end
for _, server in pairs(servers) do
	local opts = {
		on_attach = handlers.on_attach,
	}
	server = vim.split(server, '@')[1]
	local server_ok, conf_opts = pcall(require, 'user.plugins.config.lsp.servers.' .. server)
	if server_ok then
		opts = vim.tbl_deep_extend('force', conf_opts, opts)
	end
	lspconfig[server].setup(opts)
end
