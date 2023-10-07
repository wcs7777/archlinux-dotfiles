local map = require('user.utils.map').map

vim.cmd [[IBLDisable]]
map('n', '<Leader>uri', ':IBLToggle<CR>', 'Toggle render indentation guide')
