vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
	disable_netrw = true,
	sort_by = 'case_sensitive',
	actions = {
		open_file = {
			resize_window = false,
		},
	},
	view = {
		width = '120',
	},
	renderer = {
		icons = {
			show = {
				git = true,
				file = false,
				folder = false,
				folder_arrow = true,
			},
			glyphs = {
				folder = {
					arrow_closed = '▶',
					arrow_open = '◢',
				},
				git =  {
					unstaged = '✗',
					staged = '✓',
					unmerged = '⌥',
					renamed = '➜',
					untracked = '★',
					deleted = '⊖',
					ignored = '◌',
				},
			},
		},
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
