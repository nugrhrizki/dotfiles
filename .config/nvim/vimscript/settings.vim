let mapleader=" "

set title
set clipboard+=unnamedplus
set colorcolumn=81
set nu rnu

set backspace=indent,eol,start
set completeopt=menuone,noselect

set go=a
set mouse=a

set hidden
set ignorecase
set smartcase
set incsearch
set timeoutlen=100

set noexpandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

set nohlsearch
set noshowmode
set noswapfile

set list
set listchars=tab:▸\ ,eol:¬,nbsp:␣,extends:…,precedes:<,extends:>,trail:·

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

set termguicolors
set bg=dark
colorscheme gruvbox8

" == == == PLUGINS == == == "
" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Floaterm
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_title=0
let g:floaterm_autoclose=1

" which key
let g:which_key_use_floating_win = 0
