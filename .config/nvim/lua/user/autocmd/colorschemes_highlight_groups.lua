vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = '*',
	group = vim.api.nvim_create_augroup('user_colorscheme_vert_split', { clear = true }),
	desc = 'Set HIghlight group for VertSplit',
	callback = function(args)
		vim.cmd [[highlight! VertSplit guibg=NONE guifg=LightGray]]
		vim.cmd [[highlight! EndOfBuffer guifg=bg]]
	end
})
