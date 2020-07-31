"\_Install plugin manager_/"
if ! filereadable(system('echo -n "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
        \ > ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


"\_Define plugin_/"
call plug#begin('~/.local/share/nvim/site/')

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ayu-theme/ayu-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
Plug 'elixir-editors/vim-elixir'
Plug 'ryanoasis/vim-devicons'
Plug 'elmcast/elm-vim'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'tomasiser/vim-code-dark'

call plug#end()

"\_Auto install plugin_/"
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

source ~/.config/nvim/plugins/lookandfeel.vim
source ~/.config/nvim/plugins/keybindings.vim
source ~/.config/nvim/plugins/miscellaneous.vim
