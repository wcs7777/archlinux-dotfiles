local map = require('user.utils.map').map
local suffix = '<leader>j'
local M = {}

function M.is()
	return vim.g.vscode ~= nil
end

function M.isNot()
	return not M.is()
end

function M.notify(command, ...)
	local args = {...}
	return function()
		vim.fn.VSCodeNotify(command, args)
	end
end

function M.notifyVisual(command, ...)
	local args = {...}
	return function()
		vim.fn.VSCodeNotifyVisual(command, 1, args)
	end
end

function M.mapNotify(mode, lhs, command, opts, ...)
	local args = {...}
	map(mode, lhs, M.notify(command, args, opts))
end

function M.mapNotifyVisual(mode, lhs, command, opts, ...)
	local args = {...}
	map(mode, lhs, M.notifyVisual(command, args), opts)
end

function M.vscodeCmd(key, command)
	M.mapNotify({ 'n', 'x' }, suffix .. key, command)
end

function M.vscodeCmdVisual(key, command)
	M.mapNotifyVisual({ 'n', 'x' }, suffix .. key, command)
end

return M

