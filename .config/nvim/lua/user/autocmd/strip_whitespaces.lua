local strip_whitespaces_to_the_right = require('user.utils.strip_whitespaces').strip_whitespaces_to_the_right
local remove_extra_new_lines_on_the_end = require('user.utils.strip_whitespaces').remove_extra_new_lines_on_the_end
local strip_whitespaces = vim.api.nvim_create_augroup('user_strip_whitespaces', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	group = strip_whitespaces,
	desc = 'Strip whitespaces to the right of all lines on save',
	callback = strip_whitespaces_to_the_right,
})
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	group = strip_whitespaces,
	desc = 'Remove extra new lines on the of the file',
	callback = remove_extra_new_lines_on_the_end,
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'markdown' },
	group = strip_whitespaces,
	desc = 'Black list for strip whitespaces',
	callback = function()
		vim.b.user_no_strip_whitespaces = true
	end
})
