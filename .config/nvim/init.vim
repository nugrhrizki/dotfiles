if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug '9mm/vim-closer'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'liuchengxu/vim-which-key'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'voldikss/vim-floaterm'
call plug#end()

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\| PlugInstall --sync | source $MYVIMRC
\| endif

let mapleader=" "
set backspace=indent,eol,start
set completeopt=menuone,noselect
set hidden
set ignorecase
set incsearch
set list
set listchars=tab:▸\ ,eol:¬,nbsp:␣,extends:…,precedes:<,extends:>,trail:·
set mouse=a
set noswapfile
set nu rnu
set smartcase
set smarttab
set termguicolors
set timeoutlen=100

set title
set bg=dark
set go=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode

set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set colorcolumn=81

colorscheme gruvbox8

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

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

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

lua << EOF
require'colorizer'.setup(
	{'*';},
	{
		RGB      = true;
		RRGGBB   = true;
		names    = true;
		RRGGBBAA = true;
		rgb_fn   = true;
		hsl_fn   = true;
		css      = true;
		css_fn   = true;
	})
EOF

" Floaterm
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_title=0
let g:floaterm_autoclose=1

" which key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_use_floating_win = 0

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map =  {}

let g:which_key_map['e'] = [ ':CocCommand explorer'			, 'explorer' ]
let g:which_key_map['f'] = [ ':Files'						, 'search files' ]
let g:which_key_map['h'] = [ '<C-W>s'						, 'split below']
let g:which_key_map['T'] = [ ':Rg'							, 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'						, 'split right']
let g:which_key_map['z'] = [ 'Goyo'							, 'zen' ]

let g:which_key_map.t = {
	\ 'name' : '+terminal' ,
	\ ';' : [':FloatermNew --wintype=popup --height=6'			, 'terminal'],
	\ 'f' : [':FloatermNew fzf'									, 'fzf'],
	\ 'g' : [':FloatermNew lazygit'								, 'git'],
	\ 'd' : [':FloatermNew lazydocker'							, 'docker'],
	\ 'n' : [':FloatermNew node'								, 'node'],
	\ 'p' : [':FloatermNew python'								, 'python'],
	\ 'r' : [':FloatermNew lf'									, 'lf'],
	\ 't' : [':FloatermToggle'									, 'toggle'],
	\ 'y' : [':FloatermNew ytop'								, 'ytop'],
	\ 's' : [':FloatermNew ncdu'								, 'ncdu'],
	\ }

call which_key#register('<Space>', "g:which_key_map")

command! -nargs=0 Prettier :CocCommand prettier.formatFile

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
