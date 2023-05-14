require('user.set')
require('user.plugin_manager')
require('user.remap')
require('user.autocmd')
require('user.command')

--[[
local map_keys = require('user.utils.map_keys')
local mapped = map_keys(require('user.plugins'), {
	['setup'] = 'init',
	['requires'] = 'dependencies',
	['as'] = 'name',
	['opt'] = 'lazy',
	['run'] = 'build',
	['lock'] = 'pin',
	['tag'] = 'version',
	['after'] = 'dependencies',
	['wants'] = 'dependencies',
})
for _, row in pairs(mapped) do
	print(vim.inspect(row))
end
]]
