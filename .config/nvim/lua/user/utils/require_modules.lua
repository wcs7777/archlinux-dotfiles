return function(path, modules)
	for _, module in ipairs(modules) do
		require(path .. module)
	end
end
