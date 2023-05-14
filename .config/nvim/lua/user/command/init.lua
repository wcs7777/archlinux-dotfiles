vim.api.nvim_create_user_command('Vr', function(opts)
	vim.cmd('vertical resize ' .. opts.fargs[1])
end, { nargs = 1 })
