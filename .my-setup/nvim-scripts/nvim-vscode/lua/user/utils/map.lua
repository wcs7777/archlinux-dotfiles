local M = {}

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		if type(opts) == 'string' then
			local desc = type(rhs) == 'string' and rhs .. ' - ' or ''
			options.desc = desc .. opts
		else
			options = vim.tbl_extend('force', options, opts)
		end
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

return M

