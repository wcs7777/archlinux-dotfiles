local servers = {
	'lua_ls',
	'pyright',
	'jsonls',
}
require('mason').setup({ max_concurrent_installers = 1 })
require('mason-lspconfig').setup({
	ensure_installed = servers,
	automatic_installation = true,
})
local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
	return
end
for _, server in pairs(servers) do
	local opts = {
		on_attach = require('user.plugins.config.lsp.handlers').on_attach,
		capabilities = require('user.plugins.config.lsp.handlers').capabilities,
	}
	server = vim.split(server, '@')[1]
	local server_ok, conf_opts = pcall(require, 'user.plugins.config.lsp.' .. server)
	if server_ok then
		opts = vim.tbl_deep_extend('force', conf_opts, opts)
	end
	lspconfig[server].setup(opts)
end
