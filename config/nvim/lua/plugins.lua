local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function()
	use 'junegunn/goyo.vim'
	use 'sainnhe/sonokai'
	use 'andymass/vim-matchup'
	use { 'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require'gitsigns'.setup()
		end }
	use { 'glepnir/galaxyline.nvim',
		branch = 'main',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
	}
	use 'sheerun/vim-polyglot'
	use 'vimwiki/vimwiki'
	use 'preservim/tagbar'
	use { 'norcalli/nvim-colorizer.lua', config = function() require'colorizer'.setup() end }
	use 'voldikss/vim-floaterm'
	use 'hrsh7th/nvim-compe'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
	use 'rafamadriz/friendly-snippets'
	use 'neovim/nvim-lspconfig'
	use { 'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use { 'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} } }
	use { 'akinsho/nvim-bufferline.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function() require'bufferline'.setup() end }
	use { 'antoinemadec/FixCursorHold.nvim', config = function() vim.g.cursorhold_updatetime = 100 end }
	use 'wbthomason/packer.nvim'
end)
