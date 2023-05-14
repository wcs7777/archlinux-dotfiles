local telescope = require('telescope')
local builtin = require('telescope.builtin')
local map = require('user.utils.map').map

map('n', '<leader>pf', builtin.find_files, 'Project files')
map('n', '<leader>gf', builtin.git_files, 'Git files')
map('n', '<leader>lg', builtin.live_grep, 'Find by string')
map('n', '<leader>tb', builtin.builtin, 'Telescope builtin')
map('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, 'Project string')
local shortcuts = {
	['<C-e>'] = 'close',
	['<C-y>'] = 'select_default',
}
telescope.setup({
	defaults = {
		mappings = {
			i = shortcuts,
			n = shortcuts,
		}
	}
})
pcall(function()
	telescope.load_extension('harpoon')
end)

