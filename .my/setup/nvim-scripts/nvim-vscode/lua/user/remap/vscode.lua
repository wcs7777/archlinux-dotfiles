print 'hello from nvim'

local vscode = require('user.utils.vscode')
local map = require('user.utils.map').map
local notify = vscode.notify
local notifyVisual = vscode.notifyVisual
local mapNotify = vscode.mapNotify
local mapNotifyVisual = vscode.mapNotifyVisual
local vscodeCmd = vscode.vscodeCmd
local vscodeCmdVisual = vscode.vscodeCmdVisual

-- interaction with vscode commands through <leader>h + key
vscodeCmdVisual('c', 'workbench.action.showCommands')
vscodeCmd('e', 'workbench.action.quickOpen')
vscodeCmd('t', 'workbench.action.gotoSymbol')
vscodeCmd('b', 'workbench.action.toggleSidebarVisibility')
vscodeCmd('s', 'workbench.action.toggleStatusbarVisibility')
vscodeCmd('l', 'workbench.action.toggleActivityBarVisibility')
vscodeCmd('m', 'workbench.action.toggleMenuBar')
vscodeCmd('o', 'workbench.action.files.openFile')
vscodeCmd('p', 'workbench.action.togglePanel')
vscodeCmd('r', 'workbench.action.reloadWindow')
--common remap translation
mapNotify('n', '<leader>w', 'workbench.action.files.save')
mapNotify('n', '<leader>e', 'workbench.view.explorer')
mapNotify('n', 'gx', 'editor.action.openLink')
map({ 'n', 'x' }, '<leader>ay', function()
	vim.fn.VSCodeNotify('editor.action.selectAll')
	vim.fn.VSCodeNotify('editor.action.clipboardCopyAction')
end)
map({ 'n', 'x' }, '<leader>ap', function()
	vim.fn.VSCodeNotify('editor.action.selectAll')
	vim.fn.VSCodeNotify('editor.action.clipboardPasteAction')
end)
mapNotifyVisual({ 'n', 'x' }, '<leader>sy', 'editor.action.clipboardCopyAction')
mapNotifyVisual({ 'n', 'x' }, '<leader>sp', 'editor.action.clipboardPasteAction')
--mapNotifyVisual({ 'n', 'x' }, '>', 'editor.action.indentLines')
--mapNotifyVisual({ 'n', 'x' }, '<', 'editor.action.outdentLines')
-- enable vscode multicursor
map({ 'x' }, '<C-S-l>', function()
	vim.fn.VSCodeNotify('editor.action.selectHighlights')
	vim.fn.VSCodeNotify('addCursorsAtSearchResults')
	vim.api.nvim_input('<Esc>i')
end)
-- enable toggle block comment
mapNotifyVisual('x', '<C-S-c>', 'editor.action.blockComment')
--mapNotifyVisual('x', '<C-d>', 'editor.action.copyLinesDownAction')
-- fix gJ to join lines without space between them
map('n', 'gJ', 'Jx')

