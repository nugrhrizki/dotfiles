local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function()
	use 'junegunn/goyo.vim'
	use 'LukeSmithxyz/vimling'
	use 'andymass/vim-matchup'
	use 'sheerun/vim-polyglot'
	use 'vimwiki/vimwiki'
	use 'voldikss/vim-floaterm'
	use { 'shaunsingh/nord.nvim',
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = false
			require('nord').set()
		end
	}
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('lualine').setup {
				options = {
					theme = 'nord',
					section_separators = '',
					component_separators = ''
				}
			}
		end
	}
	use 'hrsh7th/nvim-compe'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
	use 'rafamadriz/friendly-snippets'
	use 'norcalli/snippets.nvim'
	use 'neovim/nvim-lspconfig'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use { 'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} }
	}
	use 'wbthomason/packer.nvim'
end)
