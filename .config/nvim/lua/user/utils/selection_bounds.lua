return function()
	local first = vim.fn.getcurpos()[2]
	local last = vim.fn.line('v')
	if (first > last) then
		first, last = last, first
	end
	return first, last
end
