local set = vim.opt

set.backup = false
set.compatible = false
set.guicursor = 'a:block-nCursor,i-r:blinkon1000'
set.hlsearch = false
set.ignorecase = true
set.incsearch = true
set.modeline = false
set.smartcase = true
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.timeoutlen = 3000
set.timeout = true
set.ttimeoutlen = 50
set.undodir = os.getenv('HOME') .. '/.vim/undodir'
set.undofile = true
set.wildmenu = true

vim.g.mapleader = ' '

