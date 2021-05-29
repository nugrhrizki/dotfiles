" ===========================================================================
" PLUGIN {{

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
	Plug 'junegunn/goyo.vim'
	Plug 'vimwiki/vimwiki'
	Plug 'andymass/vim-matchup'
call plug#end()

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\| PlugInstall --sync | source $MYVIMRC
\| endif

" }}
" ===========================================================================

" ===========================================================================
" GENERIC {{

let mapleader = " "
let localmapleader = " "

set title
set clipboard+=unnamedplus

set guioptions=a
set mouse=a

set backspace=indent,eol,start
set completeopt=menuone,noselect
set laststatus=1
set relativenumber number

set hidden
set ignorecase
set smartcase
set incsearch
set timeoutlen=200
set shortmess+=c
set updatetime=300

set noexpandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

set nohlsearch
set nobackup
set nowritebackup
set noswapfile

set list
set listchars=tab:▸\ ,eol:¬,nbsp:␣,extends:…,precedes:<,extends:>,trail:·

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" }}
" ===========================================================================

" ===========================================================================
" FUNCTIONS {{

" }}
" ===========================================================================

" ===========================================================================
" AUTOCOMMANDS {{

" remove whitespace
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

" disble autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" }}
" ===========================================================================

" ===========================================================================
" KEYBINDS {{

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

vmap < <gv
vmap > >gv

" }}
" ===========================================================================

" ===========================================================================
" PLUGINS SETTINGS {{

let g:vimwiki_list = [{
			\ 'path': '~/dox/wiki/',
			\ 'syntax': 'markdown',
			\ 'ext': '.md',
			\ 'diary_rel_path': 'journal/',
			\ 'diary_index': 'journal',
			\ 'diary_header': 'Journal'
			\ }]

" }}
" ===========================================================================
