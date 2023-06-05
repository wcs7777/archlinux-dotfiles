local create_buf_map = require('user.utils.map').create_buf_map

local function lsp_keymaps(buffer)
	local lsp = vim.lsp.buf
	local dgn = vim.diagnostic
	local buf_map = create_buf_map(buffer)
	buf_map('n', '<Leader>q', 'hl', 'Close float window')
	buf_map('n', '<Leader>rn', lsp.rename, 'Rename all references to the symbol')
	buf_map('n', '<Leader>sh', lsp.signature_help, 'Signature Help')
	buf_map('n', '<Leader>ds', lsp.document_symbol, 'List all current document symbols')
	buf_map('n', '<Leader>ws', lsp.workspace_symbol, 'List all current workspace symbols')
	buf_map('n', 'D', lsp.type_definition, 'Jump to the type symbol definition')
	buf_map('n', 'gD', lsp.declaration, 'Jump to the symbol declaration')
	buf_map('n', 'gd', lsp.definition, 'Jump to the symbol definition')
	buf_map('n', 'gi', lsp.implementation, 'Information about the symbol')
	buf_map('n', 'gr', lsp.references, 'All symbol references in quickfix')
	buf_map('n', 'K', lsp.hover, 'Information about the symbol')
	buf_map({ 'n', 'v' }, '<Leader>ca', lsp.code_action, 'Code Action')
	buf_map('n', '<Leader>fmt', function()
		lsp.format({ async = true })
	end, 'Format all')
	buf_map('n', '<Leader>dgn', function()
		dgn.goto_next({ buffer = 0 })
	end, 'Move to the next diagnostic')
	buf_map('n', '[d', function()
		dgn.goto_next({ buffer = 0 })
	end, 'Move to the next diagnostic')
	buf_map('n', '<Leader>dgp', function()
		dgn.goto_prev({ buffer = 0 })
	end, 'Move to the previous diagnostic')
	buf_map('n', ']d', function()
		dgn.goto_prev({ buffer = 0 })
	end, 'Move to the previous diagnostic')
	buf_map('n', '<Leader>dof', dgn.open_float, 'Show diagnostics in a floating window')
	buf_map('n', '<Leader>dsl', dgn.setloclist, 'Add buffer diagnostics to the location list')
end

vim.api.nvim_create_autocmd('LspAttach', {
	pattern = '*',
	group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
	desc = 'LSP Attach Configuration',
	callback = function(args)
		vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		lsp_keymaps(args.buf)
	end,
})
