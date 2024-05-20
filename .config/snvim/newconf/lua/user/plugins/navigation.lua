return {
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				spelling = { enabled = true },
				show_help = false,
				triggers_nowait = {},
			})
			vim.opt.timeoutlen = 900
		end,
	},
}
