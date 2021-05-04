local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Plugin Manager
	use 'neovim/nvim-lspconfig' -- neovim lsp
	use 'hrsh7th/nvim-compe' -- completion
	use 'nvim-treesitter/nvim-treesitter' -- syntax highlight
	use { -- fuzzy search
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use { -- file tree
		'kyazdani42/nvim-tree.lua',
		requires = {'kyazdani42/nvim-tree.lua'}
	}
	use 'elixir-lang/vim-elixir' -- elixir
	use '9mm/vim-closer' -- Autopairs
	use 'tpope/vim-commentary' -- Commenter
	use 'norcalli/nvim-colorizer.lua' -- Colorizer
	use {'lifepillar/vim-gruvbox8', as = 'gruvbox8'} -- Colorscheme
	use 'SirVer/ultisnips' -- Track the engine.
	use 'honza/vim-snippets' -- Snippets are separated from the engine.
	use 'vimwiki/vimwiki'
end)
