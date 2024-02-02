local white = '#F0F0F0'

require('newpaper').setup({
	colors = {
		white = white,
		bg = white,
		disabled = '#7f7f7f',
	},
	colors_advanced = {
		booleans = '#349479',
		cursor = '#ABC2FF',
		search_bg = '#AFD7FF',
	},
	italic_strings      = false,
	italic_comments     = false,
	italic_doc_comments = false,
	italic_functions    = false,
	italic_variables    = false,
})
