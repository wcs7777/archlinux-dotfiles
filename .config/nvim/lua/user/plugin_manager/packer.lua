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

local current_folder = vim.fn.expand('~') .. '/.config/nvim/lua/user/plugins'
vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = current_folder .. '/*.lua',
	group = vim.api.nvim_create_augroup('packer_user_config', { clear = true }),
	command = [[!nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync']]
})

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

return packer.startup(function(use)
	--[[ local lazy_to_packer = require('user.utils.map_keys')
	local plugins = lazy_to_packer(require('user.plugins', {
		['init'] = 'setup',
		['dependencies'] = 'requires',
		['name'] = 'as',
		['lazy'] = 'opt',
		['build'] = 'run',
		['pin'] = 'lock',
		['version'] = 'tag',
	})
	use(plugins) ]]
	use(require('user.plugins'))
	if packer_bootstrap then
		packer.sync()
	end
end)

