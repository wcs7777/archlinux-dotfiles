return function(category, plugins)
	for _, plugin in ipairs(plugins) do
		if packer_plugins and packer_plugins[plugin] and packer_plugins[plugin].loaded then
			require('user.plugins.configuration.' .. category .. '.' .. string.gsub(plugin, '%.', '_'))
		end
	end
end
