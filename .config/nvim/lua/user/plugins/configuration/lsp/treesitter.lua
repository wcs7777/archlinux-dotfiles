require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'bash',
		'c',
		'css',
		'html',
		'javascript',
		'lua',
		'query',
		'regex',
		'rust',
		'sql',
		'typescript',
		'vim',
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
		filetypes = {
			'html',
			'javascript',
			'javascriptreact',
			'svelte',
			'typescript',
			'typescriptreact',
			'vue',
			'xml',
		},
	},
}
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
