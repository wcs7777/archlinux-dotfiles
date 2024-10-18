local map = require('user.utils.map').map
local harpoon = require('harpoon')
local telescope_conf = require('telescope.config').values

harpoon:setup()

local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end
	require('telescope.pickers').new({}, {
		prompt_title = 'Harpoon',
		finder = require('telescope.finders').new_table({
			results = file_paths,
		}),
		previewer = telescope_conf.file_previewer({}),
		sorter = telescope_conf.generic_sorter({}),
	}):find()
end

map('n', '<leader>ht', function() toggle_telescope(harpoon:list()) end,             'Harpoon telescope')
map('n', '<leader>ha', function() harpoon:list():add() end,                         'Harpoon add file')
map('n', '<leader>hr', function() harpoon:list():remove() end,                      'Harpoon remove file')
map('n', '<leader>he', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, 'Harpoon quick menu')
map('n', '<leader>hp', function() harpoon:list():prev() end,                        'Harpoon previous file')
map('n', '<leader>hn', function() harpoon:list():next() end,                        'Harpoon next file')
map('n', '<M-1>',      function() harpoon:list():select(1) end,                     'Harpoon file 1')
map('n', '<M-2>',      function() harpoon:list():select(2) end,                     'Harpoon file 2')
map('n', '<M-3>',      function() harpoon:list():select(3) end,                     'Harpoon file 3')
map('n', '<M-4>',      function() harpoon:list():select(4) end,                     'Harpoon file 4')
map('n', '<M-5>',      function() harpoon:list():select(5) end,                     'Harpoon file 5')
map('n', '<M-6>',      function() harpoon:list():select(6) end,                     'Harpoon file 6')
map('n', '<M-7>',      function() harpoon:list():select(7) end,                     'Harpoon file 7')
map('n', '<M-8>',      function() harpoon:list():select(8) end,                     'Harpoon file 8')
map('n', '<M-9>',      function() harpoon:list():select(9) end,                     'Harpoon file 9')
