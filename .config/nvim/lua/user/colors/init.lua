function ColorMyPencils(scheme, background, transparent_bg, termguicolors)
	--[[ background = background or 'dark'
	scheme = scheme or 'rose-pine' ]]
	background = background or 'light'
	scheme = scheme or 'paper'
	transparent_bg = transparent_bg or true
	termguicolors = termguicolors or true
	vim.opt.background = background
	vim.opt.termguicolors = termguicolors
	local scheme_found = pcall(vim.cmd, 'colorscheme ' .. scheme)
	if not scheme_found then
		print('colorscheme ' .. scheme .. ' not found!')
	end
	pcall(function()
		if transparent_bg then
			vim.cmd('TransparentEnable')
		else
			vim.cmd('TransparentDisable')
		end
	end)
end

ColorMyPencils()

