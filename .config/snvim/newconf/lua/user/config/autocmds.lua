local u = require("user.utils")

local function augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*",
	group = augroup("auto_save"),
	desc = "Automatically save on leaving file",
	callback = function(args)
		if args.file ~= "" and vim.fn.getbufinfo(args.buf)[1].changed == 1 then
			vim.cmd("update")
		end
	end
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	group = augroup("colorscheme_vert_split"),
	desc = "Set HIghlight group for VertSplit",
	callback = function(_)
		vim.cmd [[highlight! VertSplit guibg=NONE guifg=LightGray]]
		vim.cmd [[highlight! EndOfBuffer guifg=bg]]
	end
})

vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	group = augroup("set_cwd"),
	desc = "Set current working directory when entering neovim",
	callback = function(args)
		vim.cmd("cd " .. vim.fn.fnamemodify(args.file, ":p:h"))
	end
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = augroup("remove_extra_whitespace"),
	desc = "Remove whitespaces to the right of all lines and the end of the file on save",
	callback = function(_)
		if not u.is_buffer_empty() then
			u.remove_extra_new_lines_on_the_end()
			if not vim.bo.filetypes:match("markdown") then
				u.strip_whitespaces_to_the_right()
			end
		end
	end
})
