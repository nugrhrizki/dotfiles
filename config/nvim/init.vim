lua require 'init'

let mapleader = " "
let localmapleader = " "

filetype plugin on
syntax on

set title
set titlestring=\ %t\ %m\ %f
set clipboard+=unnamedplus
set mouse=a
set completeopt=menuone,noselect
set number relativenumber
set hidden
set ignorecase
set smartcase
set incsearch
set timeoutlen=300
set signcolumn=yes
set shortmess+=c
set updatetime=300
set autoindent
set noexpandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set termguicolors
set tabstop=4
set noshowmode
set noshowcmd
set noruler
set splitbelow splitright
set nohlsearch
set nobackup
set nowritebackup
set noswapfile
set modelineexpr
set list
set listchars=tab:▸\ ,eol:¬,nbsp:␣,extends:…,precedes:<,extends:>,trail:·
set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

augroup Whitespace
	au!
	au BufWritePre * %s/\s\+$//e
	au BufWritePre * %s/\n\+\%$//e
	au BufWritePre *.[ch] %s/\%$/\r/e
augroup END

augroup Neomutt
	au!
	au BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	au BufRead,BufNewFile /tmp/neomutt* :Goyo
	au BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	au BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>
augroup END

augroup Floaterm
	au!
	au FileType floaterm setlocal nornu nonu signcolumn=no
augroup END

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

nnoremap <silent> <leader>e :NvimTreeToggle<cr>
nnoremap <silent> <leader>f :Telescope fd<cr>
nnoremap <silent> <leader>g :FloatermNew lazygit<cr>
nnoremap <silent> <leader>l :FloatermNew lf<cr>
nnoremap <silent> <leader>t :FloatermToggle<cr>
nnoremap <silent> <leader>z :Goyo<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

source ~/.config/nvim/vimscript/floaterm.vim
source ~/.config/nvim/vimscript/nvim-compe.vim
source ~/.config/nvim/vimscript/sonokai.vim
source ~/.config/nvim/vimscript/vim-matchup.vim
source ~/.config/nvim/vimscript/vim-tree.vim
source ~/.config/nvim/vimscript/vimwiki.vim
