local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

--local current_folder = vim.fn.expand('~') .. '/.config/nvim/lua/user/plugins'
--vim.api.nvim_create_autocmd('BufWritePost', {
--	pattern = current_folder .. '/*.lua',
--	group = vim.api.nvim_create_augroup('packer_user_config', { clear = true }),
--	command = 'source ' .. current_folder .. '/packer.lua | PackerSync'
--})

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	vim.notify 'fail requiring packer'
	return
end

packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float { border = 'rounded' }
		end
	}
}

local isNotVscode = require('user.utils.vscode').isNot
return packer.startup(function(use)
	local global_plugins = require('user.plugins.global')
	if table.getn(global_plugins) > 1 then
		use(global_plugins)
	end

	if isNotVscode() then
		local local_plugins = require('user.plugins.local')
		if table.getn(local_plugins) > 1 then
			use(local_plugins)
		end
	else
		local vscode_plugins = require('user.plugins.vscode')
		if table.getn(vscode_plugins) > 1 then
			use(vscode_plugins)
		end
	end

	if packer_bootstrap then
		packer.sync()
	end

end)

