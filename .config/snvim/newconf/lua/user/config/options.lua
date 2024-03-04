vim.g.maplocalleader = " "
vim.g.mapleader = " "

local tabsize = 4

vim.opt.backup = false
vim.opt.colorcolumn = { "" }
vim.opt.compatible = false
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.cursorline = true
vim.opt.cursorlineopt = { "number" }
vim.opt.fileencoding = "utf-8"
vim.opt.foldmethod = "manual"
vim.opt.guicursor = { "a:block", "i-r:blinkwait0-blinkon1000", "o:hor1000" }
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
-- vim.opt.iskeyword:append { "-" }
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.listchars = { space = "·", tab = "->" }
vim.opt.modeline = false
vim.opt.mouse = { n = true, v = true, c = true, h = true, r = true, i = false }
vim.opt.number = true
vim.opt.pumblend = 0
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 2
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- vim.opt.shiftround = true
vim.opt.shiftwidth = tabsize
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = tabsize
vim.opt.spell = false
vim.opt.spelllang = { "en" }
vim.opt.spelloptions = "camel"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = tabsize
-- vim.opt.textwidth = 78
vim.opt.timeout = true
vim.opt.timeoutlen = 1000
vim.opt.title = true
vim.opt.ttimeoutlen = 50
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.virtualedit = "block"
vim.opt.wildmenu = true
vim.opt.wrap = false

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

if vim.fn.executable("rg") then
	vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
	vim.opt.grepformat = { "%f:%l:%c:%m" }
end
