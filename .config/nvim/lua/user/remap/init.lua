local utils_map = require('user.utils.map')
local map = utils_map.map
local fn = utils_map.function_wrapper
local duplicate_current_line = utils_map.duplicate_current_line
local duplicate_selection = utils_map.duplicate_selection
local insert_new_lines_below = utils_map.insert_new_lines_below
local insert_new_lines_above = utils_map.insert_new_lines_above
local join_lines_without_space = utils_map.join_lines_without_space
local toggle_background_color = utils_map.toggle_background_color
local toggle_option = require('user.utils.toggle_option')
local selection_bounds = require('user.utils.selection_bounds')

-- _Cursor_movement
-- _Miscellaneous
-- _Navigation
-- _Normal_mode
-- _Text
-- _Toggle_option
-- _Window

-- _Cursor_movement
map('n', '<C-d>', '<C-d>zz', 'Move forward 1/2 a screen and center line')
map('n', '<C-u>', '<C-u>zz', 'Move backward 1/2 a screen and center line')
map('n', '<Down>', 'gj', 'Visual down')
map('n', '<Up>',   'gk', 'Visual up')
map('n', '<End>',  'g$', 'Visual end')
map('n', '<Home>', 'g0', 'Visual home')
map('n', 'n', 'nzzzv', 'Go to next search result and center line')
map('n', 'N', 'Nzzzv', 'Go to previous search result and center line')

-- _Miscellaneous
map('n', '<Leader>cs', fn(print, ' '), 'Clear status bar')
map('n', '<C-q>', fn(vim.cmd, 'quit'), 'Quit')
map('n', '<Leader>tt', ':new term://zsh<CR>', 'Open zsh below')
map('n', '<Leader>ttv', ':vnew term://zsh<CR>', 'Open zsh to the side')
map('n', '<Leader>w', vim.cmd.update, 'Save buffer')
map('n', '<Leader>x', '<cmd>!chmod 744 %<CR>', 'Make buffer executable')

-- _Navigation
map('n', '<Leader>bl', vim.cmd.ls, 'List buffers')
map('n', '<Leader>bs', '<C-^>', 'Buffer switching')
map('n', '<M-h>', vim.cmd.bprevious, 'Next buffer')
map('n', '<M-l>', vim.cmd.bnext, 'Previous buffer')
map('n', '<Leader>e', vim.cmd.NvimTreeToggle, 'Toggle NvimTree')
map('n', '<Leader>pv', vim.cmd.NvimTreeFocus, 'Focus NvimTree')

-- _Normal_mode
map({ 'n', 'v', 'o', 'l', 't' }, '<C-[>', '<C-\\><C-N>', 'Back to normal mode')
map({ 'n', 'v', 'o', 'l' },      '<C-c>', '<C-\\><C-N>', 'Back to normal mode')

-- _Text
map('i', '<C-BS>',  '<C-\\><C-o>"_db', 'Delete previous word')
map('i', '<C-Del>', '<C-\\><C-o>"_dw', 'Delete next word')
map('i', '<C-H>',   '<C-\\><C-o>"_db', 'Delete previous word')
map('n', '<Leader>ap', 'ggVG"+p', 'Replace all with system register')
map('n', '<Leader>ay', 'ggVG"+y', 'Select all to system register')
map('n', '<Leader>cl', 'viwgu', 'Lower case inner word')
map('n', '<Leader>cu', 'viwgU', 'Upper case inner word')
map('n', '<Leader>jl', join_lines_without_space, 'Join lines without space')
map('n', '<Leader>K', insert_new_lines_above, 'Insert new lines above')
map('n', '<Leader>k', insert_new_lines_below, 'Insert new lines below')
map('n', '<Leader>ld', duplicate_current_line, 'Duplicate line')
map('v', '<Leader>ld', duplicate_selection, 'Duplicate selection')
map('v', '<Leader>p', '"_dP', 'Replace keeping register')
map('v', '<S-TAB>', '<gv', 'Dedent keeping selection')
map('v', '<TAB>',   '>gv', 'Indent keeping selection')
map('v', 'J', [[:m '>+1<CR>gv=gv]], 'Move selection below')
map('v', 'K', [[:m '<-2<CR>gv=gv]], 'Move selection above')
map({ 'n', 'v' }, '<Leader>d', '"_d', 'Delete to black hole register')
map({ 'n', 'v' }, '<Leader>o', 'o<Esc>O', 'Insert mode with line above and below')
map({ 'n', 'v' }, '<Leader>sp', '"+p', 'Paste from system register')
map({ 'n', 'v' }, '<Leader>sy', '"+y', 'Yank to system register')

-- _Toggle_option
map('n', '<Leader>ubc', toggle_background_color, 'Toggle background')
map('n', '<Leader>ubt', vim.cmd.TransparentToggle, 'Toggle transparent background')
map('n', '<Leader>ucc', fn(toggle_option, 'colorcolumn', { {}, { '78' } }), 'Toggle colorcolumn')
map('n', '<Leader>ucl', fn(toggle_option, 'cursorlineopt', { { 'number' }, { 'both' } }), 'Toggle cursorlineopt')
map('n', '<Leader>uli', fn(toggle_option, 'list'), 'Toggle list')
map('n', '<Leader>urn', fn(toggle_option, 'relativenumber'), 'Toggle relativenumber')
map('n', '<Leader>usp', fn(toggle_option, 'spell'), 'Toggle spell')
map('n', '<Leader>uwr', fn(toggle_option, 'wrap'), 'Toggle wrap lines')
map('n', '<M-z>', fn(toggle_option, 'wrap'), 'Toggle wrap lines')

-- _Window
map('n', '<C-h>', '<C-w>h', 'Go to the window on the left')
map('n', '<C-j>', '<C-w>j', 'Go to the window below')
map('n', '<C-k>', '<C-w>k', 'Go to the window above')
map('n', '<C-l>', '<C-w>l', 'Go to the window on the right')
map('t', '<C-h>', '<C-\\><C-N><C-w>h', 'Go to the window on the left')
map('t', '<C-j>', '<C-\\><C-N><C-w>j', 'Go to the window below')
map('t', '<C-k>', '<C-\\><C-N><C-w>k', 'Go to the window above')
map('t', '<C-l>', '<C-\\><C-N><C-w>l', 'Go to the window on the right')
map('n', '<C-Left>',  fn(vim.cmd, 'vertical resize -1'), 'Increase window width')
map('n', '<C-Right>', fn(vim.cmd, 'vertical resize +1'), 'Decrease window width')
map('n', '<C-Up>',   fn(vim.cmd, 'resize -1'), 'Increase window height')
map('n', '<C-Down>', fn(vim.cmd, 'resize +1'), 'Decrease window height')
map('n', '<Leader>th', '<C-w>t<C-w>H', 'Make horizontal split vertical')
map('n', '<Leader>tk', '<C-w>t<C-w>K', 'Make vertical split horizontal')

-- map('n', '<C-BS>', fn(print, 'hello'))
