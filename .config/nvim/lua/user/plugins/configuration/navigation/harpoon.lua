local map = require('user.utils.map').map
local fn = require('user.utils.map').function_wrapper
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

map('n', '<leader>ha', mark.add_file,        'Harpoon add file')
map('n', '<leader>hr', mark.rm_file,         'Harpoon remove file')
map('n', '<leader>he', ui.toggle_quick_menu, 'Harpoon quick menu')
map('n', '<leader>hp', ui.nav_prev,          'Harpoon previous file')
map('n', '<leader>hn', ui.nav_next,          'Harpoon next file')
map('n', '<leader>h1', fn(ui.nav_file, 1),   'Harpoon file 1')
map('n', '<leader>h2', fn(ui.nav_file, 2),   'Harpoon file 2')
map('n', '<leader>h3', fn(ui.nav_file, 3),   'Harpoon file 3')
map('n', '<leader>h4', fn(ui.nav_file, 4),   'Harpoon file 4')
map('n', '<M-1>',      fn(ui.nav_file, 1),   'Harpoon file 1')
map('n', '<M-2>',      fn(ui.nav_file, 2),   'Harpoon file 2')
map('n', '<M-3>',      fn(ui.nav_file, 3),   'Harpoon file 3')
map('n', '<M-4>',      fn(ui.nav_file, 4),   'Harpoon file 4')