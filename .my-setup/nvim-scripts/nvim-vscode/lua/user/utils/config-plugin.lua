local p = packer_plugins

return function(plugin)
	if p and p[plugin] and p[plugin].loaded then
		require('user.plugins.config.' .. string.gsub(plugin, '%.', '-'))
	end
end

