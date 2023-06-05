local M = {}

local function default_options(opts)
	local options = { noremap = true, silent = true }
	if opts then
		if type(opts) == 'string' then
			local desc = type(rhs) == 'string' and rhs .. ' - ' or ''
			options.desc = desc .. opts
		else
			options = vim.tbl_extend('force', options, opts)
		end
	end
	return options
end

function M.map(mode, lhs, rhs, opts)
	return vim.keymap.set(mode, lhs, rhs, default_options(opts))
end

function M.unmap(mode, lhs, rhs, opts)
	return vim.keymap.del(mode, lhs, default_options(opts))
end

function M.create_buf_map(buffer)
	return function(mode, lhs, rhs, opts)
		local options = default_options(opts)
		options = vim.tbl_extend('force', options, { buffer = buffer })
		return vim.keymap.set(mode, lhs, rhs, options)
	end
end

function M.function_wrapper(fn, ...)
	local args = {...}
	return function()
		return fn(unpack(args))
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

function M.join_lines_without_space()
	local first = 0
	local last = 0
	local mode = vim.api.nvim_get_mode()['mode']
	local cmd = 'normal! Jx'
	if mode == 'n' then
		first = vim.fn.line('.')
		last = first + vim.v.count1
	else
		first, last = M.selection_bounds()
	end
	for _ = 1, last - first do
		vim.cmd(cmd)
	end
end

function M.toggle_background_color()
	local background = ''
	local colorscheme = ''
	if vim.opt.background:get() == 'light' then
		background = 'dark'
		colorscheme = 'rose-pine'
	else
		background = 'light'
		colorscheme = 'paper'
	end
	local ok = pcall(function()
		vim.opt.background = background
		vim.cmd ('colorscheme ' ..  colorscheme)
	end)
	if not ok then
		print('Fail setting ' .. colorscheme .. ' with ' .. background .. ' background')
	end
end

function M.paste_without_yank()
	local content = vim.fn.getreg('"')
	vim.cmd('normal! ""p')
	vim.fn.setreg('"', content)
end

return M
