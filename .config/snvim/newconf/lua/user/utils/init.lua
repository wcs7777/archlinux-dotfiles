local M = {}

function M.set_keymap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		if type(opts) == 'string' then
			options.desc = opts
		else
			options = vim.tbl_extend('force', options, opts)
		end
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

function M.wrap_function(fn, ...)
	local args = {...}
	return function()
		return fn(unpack(args))
	end
end

function M.wrap_cmd(cmd)
	return function()
		return vim.cmd(cmd)
	end
end

function M.selection_bounds()
	local first = vim.fn.getcurpos()[2]
	local last = vim.fn.line('v')
	if (first > last) then
		first, last = last, first
	end
	return first, last
end

function M.duplicate_current_line()
	local line = vim.fn.line('.')
	for _ = 1, vim.v.count1 do
		vim.cmd (line .. ' copy ' .. line)
	end
end

function M.duplicate_selection()
	local first, last = M.selection_bounds()
	local cmd = (first .. ',' .. last .. ' copy ' .. last)
	for _ = 1, vim.v.count1 do
		vim.cmd (cmd)
	end
	vim.api.nvim_input('<ESC>')
	vim.api.nvim_win_set_cursor(0, { last + 1, 0 })
end

function M.insert_new_lines_below()
	local pos = vim.api.nvim_win_get_cursor(0)
	vim.cmd ('normal ' .. vim.v.count1 .. 'o')
	vim.api.nvim_win_set_cursor(0, pos)
end

function M.insert_new_lines_above()
	local p = vim.api.nvim_win_get_cursor(0)
	p[1] = p[1] + vim.v.count1
	vim.cmd ('normal ' .. vim.v.count1 .. 'O')
	vim.api.nvim_win_set_cursor(0, p)
end

function M.paste_without_yank()
	local content = vim.fn.getreg('"')
	vim.cmd('normal! ""p')
	vim.fn.setreg('"', content)
end

function M.toggle_option(option, v1, v2)
	return function()
		local current = vim.opt[option]:get()
		if v1 ~= nil then
			if type(v1) == 'string' then
				vim.opt[option] = current == v1 and v2 or v1
			else
				vim.opt[option] = vim.deep_equal(current, v1) and v2 or v1
			end
		else
			vim.opt[option] = not current
		end
	end
end

function M.has_module(module)
	local has = pcall(require, module)
	return has
end

function M.is_buffer_empty()
	local bufnr = vim.api.nvim_get_current_buf()
	return (
		vim.api.nvim_buf_line_count(bufnr) == 1 and
		vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)[1] == ''
	)
end

function M.strip_whitespaces_to_the_right()
	if not vim.b.user_no_strip_whitespaces then
		vim.cmd [[%s/\(\S\)\s\+$/\1/e]]
	end
end

function M.remove_extra_new_lines_on_the_end()
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
