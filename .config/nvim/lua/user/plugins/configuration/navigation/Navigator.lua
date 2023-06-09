local navigator = require('Navigator')
local utils_map = require('user.utils.map')
local map = utils_map.map
local unmap = utils_map.unmap

navigator.setup({
	auto_save = true,
	disable_on_zoom = true,
})

unmap('n', '<C-h>', '<C-w>h', 'Go to the window on the left')
unmap('n', '<C-j>', '<C-w>j', 'Go to the window below')
unmap('n', '<C-k>', '<C-w>k', 'Go to the window above')
unmap('n', '<C-l>', '<C-w>l', 'Go to the window on the right')
unmap('t', '<C-h>', '<C-\\><C-N><C-w>h', 'Go to the window on the left')
unmap('t', '<C-j>', '<C-\\><C-N><C-w>j', 'Go to the window below')
unmap('t', '<C-k>', '<C-\\><C-N><C-w>k', 'Go to the window above')
unmap('t', '<C-l>', '<C-\\><C-N><C-w>l', 'Go to the window on the right')

map({ 'n', 't' }, '<C-h>', navigator.left, 'Go to the window on the left')
map({ 'n', 't' }, '<C-j>', navigator.down, 'Go to the window below')
map({ 'n', 't' }, '<C-k>', navigator.up, 'Go to the window above')
map({ 'n', 't' }, '<C-l>', navigator.right, 'Go to the window on the right')
map({ 'n', 't' }, '<C-\\>', navigator.previous, 'Go to the previoius window')
