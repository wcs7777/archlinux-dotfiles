vim.api.nvim_create_autocmd('VimEnter', {
	pattern = '*',
	group = vim.api.nvim_create_augroup('user_set_cwd', { clear = true }),
	desc = 'Set current working directory when entering neovim',
	callback = function(args)
		vim.cmd('cd ' .. vim.fn.fnamemodify(args.file, ':p:h'))
	end
})
