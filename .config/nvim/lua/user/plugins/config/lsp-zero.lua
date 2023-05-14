local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
	'tsserver',
	'eslint',
})
local cmp = require('cmp')
local mapping = cmp.mapping
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-n>'] = mapping.select_next_item(cmp_select),
	['<C-p>'] = mapping.select_prev_item(cmp_select),
	['<C-y>'] = mapping.confirm({ select = true }),
	['<CR>'] = mapping.confirm({ select = true }),
	['<C-Space>'] = mapping.complete(),
})
lsp.set_preferences({
	sign_icons = {},
})
lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})
lsp.on_attach(function(client, bufnr)
	local utilMap = require('user.utils.map')
	local function map(mode, lhs, rhs)
		utilMap(mode, lhs, rhs, { buffer = bufnr })
	end
	local buf = vim.lsp.buf
	local dgn = vim.diagnostic
	map('n', 'gd', function() buf.definition() end)
	map('n', 'K', function() buf.hover() end)
	map('n', '<leader>vws', function() buf.workspace_symbol() end)
	map('n', '<leader>vd', function() dgn.open_float() end)
	map('n', '[d', function() dgn.goto_next() end)
	map('n', ']d', function() dgn.goto_prev() end)
	map('n', '<leader>vca', function() buf.code_action() end)
	map('n', '<leader>vrr', function() buf.references() end)
	map('n', '<leader>vrn', function() buf.rename() end)
	map('n', 'F2', function() buf.rename() end)
	--map('n', '<C-h>', function() buf.signature_help() end)
end)
lsp.setup()

