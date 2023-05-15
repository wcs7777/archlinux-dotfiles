local map = require('user.utils.map').map

map('n', '<leader>th', '<C-w>t<C-w>H', 'Make horizontal split vertical')
map('n', '<leader>tk', '<C-w>t<C-w>K', 'Make vertical split horizontal')
map('n', '<leader>pv', vim.cmd.Ex, ':Ex - Open netrw')
map({ 'n', 'x' }, '<leader>o', 'o<Esc>O', 'Insert mode with line above and below')
--map('n', '<leader>l', 'yyp', 'Duplicate line')
map('n', '<leader>ld', function()
	local line = vim.fn.line('.')
	for _ = 1, vim.v.count1 do
		vim.cmd (line .. ' copy ' .. line)
	end
end,
	'Duplicate line'
)
map('x', '<leader>ld', function()
	local first = vim.fn.getcurpos()[2]
	local last = vim.fn.line('v')
	if (first > last) then
		first, last = last, first
	end
	local range = last - first
	local cmd = first .. ',' .. last .. ' copy ' .. last
	for _ = 1, vim.v.count1 do
		vim.cmd (cmd)
	end
	vim.api.nvim_input('<ESC>')
	vim.api.nvim_win_set_cursor(0, { last + 1, 0 })
end,
	'Duplicate selection'
)
map('n', 'n', 'nzzzv', 'Go to next search result and center line')
map('n', 'N', 'Nzzzv', 'Go to previous search result and center line')
map('n', '<C-d>', '<C-d>zz', 'Move forward 1/2 a screen and center line')
map('n', '<C-u>', '<C-u>zz', 'Move backward 1/2 a screen and center line')
map('x', 'J', [[:m '>+1<CR>gv=gv]], 'Move selection below')
map('x', 'K', [[:m '<-2<CR>gv=gv]], 'Move selection above')
map('x', '<leader>p', '"_dP', 'Replace keeping register')
map({'n', 'x'}, '<leader>d', '"_d', 'Delete to black hole register')
map({'n', 'x'}, '<leader>y', '"+y', 'Yank to system clipboard')
map({'n', 'x'}, '<leader>Y', '"+Y', 'Yank to end of line to system clipboard')
map('n', '<leader>cs', function() print ' ' end, 'Clear status bar')
map('n', '<leader>k', function()
	local p = vim.api.nvim_win_get_cursor(0)
	vim.cmd ('normal ' .. vim.v.count1 .. 'o')
	vim.api.nvim_win_set_cursor(0, p)
end,
	'insert new lines below'
)
map('n', '<leader>K', function()
	local p = vim.api.nvim_win_get_cursor(0)
	p[1] = p[1] + vim.v.count1
	vim.cmd ('normal ' .. vim.v.count1 .. 'O')
	vim.api.nvim_win_set_cursor(0, p)
end,
	'insert new lines above'
)
map('n', '<M-h>', ':bprevious<CR>', 'Next buffer')
map('n', '<M-l>', ':bnext<CR>', 'Previous buffer')
map('n', '<leader>bs', '<C-^>', 'Buffer switching')
map('n', '<leader>bl', ':ls<CR>', 'List buffers')
map('x', '<S-TAB>', '<gv', 'Dedent keeping selection')
map('x', '<TAB>', '>gv', 'Indent keeping selection')

