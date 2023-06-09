vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

local set = vim.opt
local tabsize = 2

set.backup = false
set.colorcolumn = { '' }
set.compatible = false
set.completeopt = { 'menuone', 'noselect' }
set.cursorline = true
set.cursorlineopt = { 'number' }
set.fileencoding = 'utf-8'
set.foldmethod = 'manual'
set.guicursor = { 'a:block', 'i-r:blinkwait0-blinkon1000', 'o:hor1000' }
set.hlsearch = false
set.ignorecase = true
set.incsearch = true
-- set.iskeyword:append { '-' }
set.linebreak = true
set.list = false
set.listchars = { space = '·', tab = '->' }
set.modeline = false
set.mouse = { n = true, v = true, c = true, h = true, r = true, i = false }
set.number = true
set.pumheight = 10
set.relativenumber = true
set.scrolloff = 2
set.shiftwidth = tabsize
set.showmode = false
set.showtabline = 2
set.sidescrolloff = 2
set.signcolumn = 'yes'
set.smartcase = true
set.smartindent = true
set.softtabstop = tabsize
set.spell = false
set.spelloptions = 'camel'
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = tabsize
-- set.textwidth = 78
set.timeout = true
set.timeoutlen = 3000
set.title = true
set.ttimeoutlen = 50
set.undodir = os.getenv('HOME') .. '/.vim/undodir'
set.undofile = true
set.wildmenu = true
set.wrap = false

if vim.fn.executable('rg') then
	set.grepprg = 'rg --vimgrep --smart-case --hidden'
	set.grepformat = { '%f:%l:%c:%m' }
end
