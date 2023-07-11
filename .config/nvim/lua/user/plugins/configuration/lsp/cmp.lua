local M = {}

local cmp_nvim_lsp = require('cmp_nvim_lsp')

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = false
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

local signs = {
	{ name = 'DiagnosticSignError', text = '' },
	{ name = 'DiagnosticSignWarn',  text = '' },
	{ name = 'DiagnosticSignHint',  text = '' },
	{ name = 'DiagnosticSignInfo',  text = '' },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(
		sign.name,
		{
			texthl = sign.name,
			text = sign.text,
			numhl = '',
		}
	)
end
vim.diagnostic.config({
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = false,
	underline = false,
	severity_sort = true,
})

return M
