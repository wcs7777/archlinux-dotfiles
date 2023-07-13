vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
	filters = {
		dotfiles = true,
	},
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = false,
    side = "left",
    width = 30,
    preserve_window_proportions = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
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
				default = '',
				symlink = '',
				folder = {
					arrow_closed = '',
					arrow_open = '',
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
})
