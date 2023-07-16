local set = vim.opt
local tabsize = 2

set.background = 'light'
set.completeopt = { 'menuone', 'noselect' }
set.cursorlineopt = 'number'
set.cursorline = true
set.fileencoding = 'utf-8'
set.fillchars:append 'vert:|'
set.foldmethod = 'manual'
set.lcs:append '·'
set.list = false
set.mouse = 'a'
set.nu = true
set.pumheight = 10
set.relativenumber = true
set.scrolloff = 8
set.shiftwidth = tabsize
set.showtabline = 2
set.signcolumn = 'yes'
set.smartindent = true
set.softtabstop = tabsize
set.spell = false
set.spelloptions = 'camel'
set.tabstop = tabsize
set.title = true
set.wrap = false

vim.cmd 'colorscheme lunaperche'

pcall(function()
	set.foldexpr = 'nvim_treesitter#foldexpr()'
end)

local strip_whitespaces = vim.api.nvim_create_augroup('strip_whitespaces', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	group = strip_whitespaces,
	desc = 'Strip whitespaces to the right of all lines on save',
	callback = function()
		if not vim.b.no_strip_whitespaces then
			vim.cmd [[%s/\(\S\)\s\+$/\1/e]]
		end
	end
})
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	group = strip_whitespaces,
	desc = 'Remove extra new lines on the of the file',
	callback = function()
		if not vim.b.no_strip_whitespaces then
			local last = vim.fn.line('$')
			local extra = vim.fn.prevnonblank(last) + 2
			if extra <= last then
				local pos = vim.api.nvim_win_get_cursor(0)
				if pos[1] >= extra then
					pos[1] = extra - 1
					pos[2] = 0
					if pos[1] < 0 then
						pos[1] = 0
					end
				end
				vim.cmd(extra .. ',' .. last .. 'delete _')
				vim.api.nvim_win_set_cursor(0, pos)
			end
		end
	end
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'markdown' },
	group = strip_whitespaces,
	desc = 'Black list for strip whitespaces',
	callback = function()
		vim.b.no_strip_whitespaces = true
	end
})

