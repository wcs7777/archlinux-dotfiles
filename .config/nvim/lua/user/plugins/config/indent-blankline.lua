local map = require('user.utils.map').map

vim.cmd [[IndentBlanklineDisable!]]
map('n', '<Leader>uri', ':IndentBlanklineToggle!<CR>', 'Toggle render indentation guide')
