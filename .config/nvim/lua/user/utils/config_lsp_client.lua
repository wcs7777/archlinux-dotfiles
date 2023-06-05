return function(name, server, opts)
	if server.name == name then
		return vim.tbl_deep_extend(
			'force',
			require('user.config.lsp.' .. name),
			opts,
		)
	else
		return opts
	end
end
