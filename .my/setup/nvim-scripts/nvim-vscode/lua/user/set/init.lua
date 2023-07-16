require('user.set.global')

local isNotVscode = require('user.utils.vscode').isNot

if isNotVscode() then
	require('user.set.local')
end

