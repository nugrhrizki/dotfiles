"\
" | Neovim Configuration
" | by: Nugraha, Rizki
" | https://github.com/nugrhrizki/dotfiles
"/

"\_Basic_/"
filetype plugin on
syntax enable
let mapleader = ' '
let g:netrw_banner = 0
let g:netrw_liststyle = 3
set clipboard+=unnamedplus
set encoding=utf-8
set expandtab
set mouse=a
set noswapfile
set number relativenumber
set path+=**
set shiftround
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2
set wildignore+=**/node_modules/**,*.o,*.obj,**/elm-stuff/**
" set guiheadroom=0 " if you are using gvim uncomment this

"\_Mapping_/"
inoremap <C-s> <Esc>:w<cr>
nnoremap <C-s> <Esc>:w<cr>
vnoremap <C-s> <Esc>:w<cr>
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

"\_Auto Commands_/"
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
autocmd BufWritePost *init.vim, source %
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"\_Plugins_/"
source ~/.config/nvim/plugin.vim
