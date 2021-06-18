local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function()
	use 'junegunn/goyo.vim'
	use { 'sainnhe/sonokai',
		config = function()
			vim.g.sonokai_style = 'atlantis'
			vim.g.sonokai_enable_italic = 1
			vim.g.sonokai_disable_italic_comment = 0
			vim.cmd('colo sonokai')
		end }
	use { 'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = 'popup' }
		end }
	use { 'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require'gitsigns'.setup()
		end }
	use 'sheerun/vim-polyglot'
	use 'nvim-lua/lsp-status.nvim'
	use { 'vimwiki/vimwiki',
		config = function()
			vim.g.vimwiki_list = { {path= '~/dox/wiki/', syntax= 'markdown', ext= '.md'}}
		end }
	use 'preservim/tagbar'
	use { 'norcalli/nvim-colorizer.lua', config = function() require'colorizer'.setup() end }
	use { 'voldikss/vim-floaterm',
		config = function()
			vim.g.floaterm_autoinsert = 1
			vim.g.floaterm_width = 0.8
			vim.g.floaterm_height = 0.8
			vim.g.floaterm_title = 0
			vim.g.floaterm_autoclose = 1
		end }
	use { 'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			vim.g.nvim_tree_width = 35
			vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
			vim.g.nvim_tree_gitignore = 1
			vim.g.nvim_tree_auto_close = 1
			vim.g.nvim_tree_follow = 1
			vim.g.nvim_tree_git_hl = 1
		end }
	use { 'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} } }
	use { 'akinsho/nvim-bufferline.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function() require'bufferline'.setup() end }
	use { 'antoinemadec/FixCursorHold.nvim', config = function() vim.g.cursorhold_updatetime = 100 end }
	use 'neovim/nvim-lspconfig'
	use 'norcalli/snippets.nvim'
	use { 'hrsh7th/nvim-compe',
		config = function()
			require'compe'.setup {
				enabled = true;
				autocomplete = true;
				debug = false;
				min_length = 1;
				preselect = 'enable';
				throttle_time = 80;
				source_timeout = 200;
				incomplete_delay = 400;
				max_abbr_width = 100;
				max_kind_width = 100;
				max_menu_width = 100;
				documentation = false;

				source = {
					path = true;
					buffer = true;
					calc = true;
					nvim_lsp = true;
					nvim_lua = true;
					snippets_nvim = true;
				};
			}
		end }
	use 'wbthomason/packer.nvim'
end)
