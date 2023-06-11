function ColorMyPencils(scheme, background, transparent_bg, termguicolors)
	--[[ background = background or 'dark'
	scheme = scheme or 'rose-pine' ]]
	background = background or 'light'
	scheme = scheme or 'PaperColor'
	transparent_bg = transparent_bg or false
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
	pcall(require, 'user.plugins.configuration.colorscheme.' .. scheme)
end

ColorMyPencils()
