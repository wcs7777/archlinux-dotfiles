require('user.remap.global')

local isNotVscode = require('user.utils.vscode').isNot
local map = require('user.utils.map').map

if isNotVscode() then
	require('user.remap.local')
else
	require('user.remap.vscode')
end

