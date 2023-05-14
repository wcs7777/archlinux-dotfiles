local autocmds = {
	'set_cwd',
	'auto_save',
	'strip_whitespaces',
}
for _, autocmd in pairs(autocmds) do
	require('user.autocmd.' .. autocmd)
end

