-- local theme = require('lualine.themes.modus-vivendi')
local theme = require('lualine.themes.powerline_dark')
local colors = {
	blue   = '#65D1FF',
	green  = '#3EFFDC',
	violet = '#FF61EF',
	yellow = '#FFDA7B',
	black  = '#101010',
}
theme.normal.a.bg = colors.blue
theme.insert.a.bg = colors.green
theme.visual.a.bg = colors.violet
theme.command = {
	a = {
		gui = 'bold',
		bg = colors.yellow,
		fg = colors.black,
	},
}
require('lualine').setup {
	options = {
		-- theme = 'papercolor_light',
		-- theme = 'powerline_dark',
		theme = 'modus-vivendi',
	},
}
