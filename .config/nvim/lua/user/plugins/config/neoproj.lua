vim.api.nvim_create_autocmd('VimLeavePre', {
	pattern = '*',
	group = vim.api.nvim_create_augroup('user_save_session', { clear = true }),
	desc = 'Save session on leave neovim',
	callback = function()
		if vim.g.project_root ~= nil then
			require('neoproj').save_session()
		end
	end,
})
