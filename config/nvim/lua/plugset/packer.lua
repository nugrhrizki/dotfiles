local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function()
	use 'junegunn/goyo.vim'
	use 'junegunn/fzf.vim'
	use { 'junegunn/fzf',
		run = function() vim.fn['fzf#install']() end
	}
	use 'LukeSmithxyz/vimling'
	use 'andymass/vim-matchup'
	use 'sheerun/vim-polyglot'
	use 'etdev/vim-hexcolor'
	use 'vimwiki/vimwiki'
	use 'hrsh7th/nvim-compe'
	use 'norcalli/snippets.nvim'
	use 'neovim/nvim-lspconfig'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use 'wbthomason/packer.nvim'
end)
