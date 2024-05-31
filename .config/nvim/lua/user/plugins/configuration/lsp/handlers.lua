local M = {}

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = false
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

function M.setup()
	local signs = {
		{ name = 'DiagnosticSignError', text = '' },
		{ name = 'DiagnosticSignWarn',  text = '' },
		{ name = 'DiagnosticSignHint',  text = '󰌵' },
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
		-- signs = true,
		signs = {
			active = signs,
		},
		update_in_insert = false,
		underline = false,
		severity_sort = true,
		float = {
			focusable = false,
			style = 'minimal',
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = '',
		},
	})
	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
		vim.lsp.handlers.hover,
		{
			border = 'rounded'
		}
	)
	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{
			border = 'rounded'
		}
	)
end

return M
