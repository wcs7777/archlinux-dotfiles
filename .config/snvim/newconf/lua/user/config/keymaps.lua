local u = require("user.utils")
local cmd = u.wrap_cmd
local fn = u.wrap_function
local keymap = u.set_keymap
local toggle = u.toggle_option

-- _Cursor_movement
-- _Miscellaneous
-- _Navigation
-- _Normal_mode
-- _Text
-- _Toggle_option
-- _Window

-- _Cursor_movement
keymap("n", "<C-d>",  "<C-d>zz", "Move forward 1/2 a screen and center line")
keymap("n", "<C-u>",  "<C-u>zz", "Move backward 1/2 a screen and center line")
keymap("n", "<Down>", "gj",      "Visual down")
keymap("n", "<Up>",   "gk",      "Visual up")
keymap("n", "<End>",  "g$",      "Visual end")
keymap("n", "<Home>", "g0",      "Visual home")
keymap("n", "n",      "nzzzv",   "Go to next search result and center line")
keymap("n", "N",      "Nzzzv",   "Go to previous search result and center line")

-- _Miscellaneous
keymap("n", "<leader>cs",  fn(print, " "),              "Clear status bar")
keymap("n", "<leader>x",   cmd("!chmod 744 %"),         "Make buffer executable")
keymap("n", "<leader>ffp", [[:echo expand("%:p")<CR>]], "Show current file full path")

-- _Navigation
keymap("n", "<leader>bs", "<C-^>",                 "Buffer switching")
keymap("n", "<leader>e",  cmd("NvimTreeToggle"),   "Toggle NvimTree")
keymap("n", "<leader>pv", cmd("NvimTreeFindFile"), "Focus NvimTree")

-- _Normal_mode
keymap({ "n", "v", "o", "l", "t" }, "<C-[>", "<C-\\><C-N>", "Back to normal mode")
keymap({ "n", "v", "o", "l" },      "<C-c>", "<C-\\><C-N>", "Back to normal mode")

-- _Text
keymap("n",          "<leader>ap", [[ggVG"+p]],              "Replace all with system register")
keymap("n",          "<leader>ay", [[ggVG"+y]],              "Select all to system register")
keymap("n",          "<leader>cl", "guiw",                   "Lower case inner word")
keymap("n",          "<leader>cu", "gUiw",                   "Upper case inner word")
keymap("n",          "<leader>il", u.insert_new_lines_below, "Insert new lines below")
keymap("n",          "<leader>iL", u.insert_new_lines_above, "Insert new lines above")
keymap("n",          "<leader>dl", u.duplicate_current_line, "Duplicate line")
keymap("v",          "<leader>dl", u.duplicate_selection,    "Duplicate selection")
keymap("v",          "<leader>p",  u.paste_without_yank,     "Paste without yank")
keymap("v",          "<M-j>",      [[:m ">+1<CR>gv=gv]],     "Move selection below")
keymap("v",          "<M-k>",      [[:m "<-2<CR>gv=gv]],     "Move selection above")
keymap("v",          "<S-TAB>",    "<gv",                    "Dedent keeping selection")
keymap("v",          "<TAB>",      ">gv",                    "Indent keeping selection")
keymap({ "n", "v" }, "<leader>d",  [["_d]],                  "Delete to black hole register")
keymap({ "n", "v" }, "<leader>o",  "o<Esc>O",                "Insert mode with line above and below")
keymap({ "n", "v" }, "<leader>sp", [["+p]],                  "Paste from system register")
keymap({ "n", "v" }, "<leader>sy", [["+y]],                  "Yank to system register")

-- _Toggle_option
keymap("n", "<leader>ucc", toggle("colorcolumn",  {}, { "78" }),               "Toggle colorcolumn")
keymap("n", "<leader>ucl", toggle("cursorlineopt",  { "number" }, { "both" }), "Toggle cursorlineopt")
keymap("n", "<leader>uli", toggle("list"),                                     "Toggle list")
keymap("n", "<leader>urn", toggle("relativenumber"),                           "Toggle relativenumber")
keymap("n", "<leader>usp", toggle("spell"),                                    "Toggle spell")
keymap("n", "<leader>uwr", toggle("wrap"),                                     "Toggle wrap lines")
keymap("n", "<leader>uhl", toggle("hlsearch"),                                 "Toggle highlight search")
keymap("n", "<M-z>",       toggle("wrap"),                                     "Toggle wrap lines")

-- _Window
keymap("n", "<C-h>",      "<C-w>h",                   "Go to the window on the left")
keymap("n", "<C-j>",      "<C-w>j",                   "Go to the window below")
keymap("n", "<C-k>",      "<C-w>k",                   "Go to the window above")
keymap("n", "<C-l>",      "<C-w>l",                   "Go to the window on the right")
keymap("t", "<C-h>",      "<C-\\><C-N><C-w>h",        "Go to the window on the left")
keymap("t", "<C-j>",      "<C-\\><C-N><C-w>j",        "Go to the window below")
keymap("t", "<C-k>",      "<C-\\><C-N><C-w>k",        "Go to the window above")
keymap("t", "<C-l>",      "<C-\\><C-N><C-w>l",        "Go to the window on the right")
keymap("n", "<C-Left>",   cmd("vertical resize -1"),  "Increase window width")
keymap("n", "<C-Right>",  cmd("vertical resize +1"),  "Decrease window width")
keymap("n", "<C-Up>",     cmd("resize -1"),           "Increase window height")
keymap("n", "<C-Down>",   cmd("resize +1"),           "Decrease window height")
keymap("n", "<leader>bo", cmd([[:%bdelete!|e#|bd#]]), "Close all buffers but current")
keymap("n", "<leader>th", "<C-w>t<C-w>H",             "Make horizontal split vertical")
keymap("n", "<leader>tk", "<C-w>t<C-w>K",             "Make vertical split horizontal")
