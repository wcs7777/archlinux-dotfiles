local set = vim.opt
return function(option, values)
	local current = set[option]:get()
	if values ~= nil then
		if type(values[1]) == 'string' then
			set[option] = current == values[1] and values[2] or values[1]
		else
			set[option] = vim.deep_equal(current, values[1]) and values[2] or values[1]
		end
	else
		set[option] = not current
	end
end

