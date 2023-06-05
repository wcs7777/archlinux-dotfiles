local buf_map = require('user.utils.map').buf_map
local M = {}

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then
	return
end
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

function M.setup()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
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

local function lsp_keymaps(buffer)
	local lsp = vim.lsp.buf
	local dgn = vim.diagnostic
	buf_map('n', '<Leader>rn', lsp.rename, 'Rename all references to the symbol')
	buf_map('n', '<Leader>sh', lsp.signature_help, 'Signature Help')
	buf_map('n', '<Leader>ws', lsp.workspace_symbol, 'List all current workspace symbols')
	buf_map('n', 'D', lsp.type_definition, 'Jump to the type symbol definition')
	buf_map('n', 'gD', lsp.declaration, 'Jump to the symbol declaration')
	buf_map('n', 'gd', lsp.definition, 'Jump to the symbol definition')
	buf_map('n', 'gi', lsp.implentation, 'Information about the symbol')
	buf_map('n', 'gr', lsp.references, 'All symbol references in quickfix')
	buf_map('n', 'K', lsp.hover, 'Information about the symbol')
	buf_map({ 'n', 'v' }, '<Leader>ca', lsp.code_action, 'Code Action')
	buf_map('n', '<Leader>fmt', function()
			lsp.format({ async = true })
	end, 'Format all')
	buf_map('n', '<Leader>ngn', function()
		dgn.goto_next({ buffer = 0 })
	end, 'Move to the next diagnostic')
	buf_map('n', '<Leader>ngp', function()
		dgn.goto_prev({ buffer = 0 })
	end, 'Move to the previous diagnostic')
	buf_map('n', '<Leader>nof', dgn.open_float, 'Show diagnostics in a floating window')
	buf_map('n', '<Leader>nsl', dgn.setloclist, 'Add buffer diagnostics to the location list')
end

function M.on_attach(client, buffer)
	lsp_keymaps(buffer)
end

return M
