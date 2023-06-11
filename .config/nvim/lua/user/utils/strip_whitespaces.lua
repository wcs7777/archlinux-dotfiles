local M = {}

M.strip_whitespaces_to_the_right = function()
	if not vim.b.user_no_strip_whitespaces then
		vim.cmd [[%s/\(\S\)\s\+$/\1/e]]
	end
end

M.remove_extra_new_lines_on_the_end = function()
	if not vim.b.user_no_strip_whitespaces then
		local last = vim.fn.line('$')
		local extra = vim.fn.prevnonblank(last) + 1
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

return M
