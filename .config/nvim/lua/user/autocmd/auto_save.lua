local strip_whitespaces_to_the_right = require('user.utils.strip_whitespaces').strip_whitespaces_to_the_right
local remove_extra_new_lines_on_the_end = require('user.utils.strip_whitespaces').remove_extra_new_lines_on_the_end
local auto_save = vim.api.nvim_create_augroup('user_auto_save', { clear = true })

vim.api.nvim_create_autocmd('BufLeave', {
	pattern = '*',
	group = auto_save,
	desc = 'Automatically save on leaving file',
	callback = function(args)
		pcall(function ()
			if args.file ~= '' and vim.fn.getbufinfo(args.buf)[1].changed == 1 then
				strip_whitespaces_to_the_right()
				remove_extra_new_lines_on_the_end()
				vim.cmd('update')
			end
		end)
	end
})
