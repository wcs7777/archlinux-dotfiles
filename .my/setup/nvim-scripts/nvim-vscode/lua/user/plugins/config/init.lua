require('user.plugins.config.global')
local isNotVscode = require('user.utils.vscode').isNot

if isNotVscode() then
	require('user.plugins.config.local')
else
	require('user.plugins.config.vscode')
end

