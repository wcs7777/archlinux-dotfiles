local plugins = {
	{ 'nvim-treesitter/nvim-treesitter', as = 'treesitter', run = ':TSUpdate' },
	{ 'nvim-treesitter/playground',      as = 'playground' },
	--[[ {
		{ 'VonHeikemen/lsp-zero.nvim', as = 'lsp-zero' },
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },						 -- Required
			{ 'williamboman/mason.nvim' },					 -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },				 -- Required
			{ 'hrsh7th/cmp-nvim-lsp' },		 -- Required
			{ 'hrsh7th/cmp-buffer' },			 -- Optional
			{ 'hrsh7th/cmp-path' },				 -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' },		 -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },						 -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}, ]]
}
return plugins

