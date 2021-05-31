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
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'preservim/tagbar'
 	Plug 'powerman/vim-plugin-AnsiEsc'
	Plug 'blindFS/vim-taskwarrior'
	Plug 'tools-life/taskwiki'
	Plug 'itchyny/calendar.vim'
	Plug 'voldikss/vim-floaterm'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'lambdalisue/fern.vim'
	Plug 'lifepillar/vim-gruvbox8'
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

filetype plugin on
syntax on

set nocompatible
set encoding=utf-8
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
set splitbelow splitright
set nohlsearch
set nobackup
set nowritebackup
set noswapfile
set noruler
set list
set listchars=tab:▸\ ,eol:¬,nbsp:␣,extends:…,precedes:<,extends:>,trail:·
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" }}
" ===========================================================================

" ===========================================================================
" FUNCTIONS {{

let s:hidden_all = 1
function! ToggleHiddenAll()
	if s:hidden_all  == 0
		let s:hidden_all = 1
		set noshowmode
		set noruler
		set laststatus=0
		set noshowcmd
	else
		let s:hidden_all = 0
		set showmode
		set ruler
		set laststatus=2
		set showcmd
	endif
endfunction

function! s:goyo_enter()
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status off
		silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	endif
	set noshowmode
endfunction

function! s:goyo_leave()
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status on
		silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	endif
	set showmode
endfunction

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

" enable goyo when write email
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo
autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" toggle tmux statusline when goyo is enable
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}
" ===========================================================================

" ===========================================================================
" PLUGINS SETTINGS {{

" vimwiki
let g:vimwiki_list = [{
			\ 'path': '~/dox/wiki/',
			\ 'syntax': 'markdown',
			\ 'ext': '.md',
			\ 'diary_rel_path': 'journal/',
			\ 'diary_index': 'journal',
			\ 'diary_header': 'Journal'
			\ }]

let g:vimwiki_ext2syntax = {
			\ '.md': 'markdown',
			\ '.markdown': 'markdown',
			\ '.mdown': 'markdown'
			\ }

let g:vimwiki_markdown_link_ext = 1


" taskwiki
let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1


" vim matchup
let g:matchup_matchparen_offscreen = {'method': 'popup'}


" floaterm
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_title=0
let g:floaterm_autoclose=1


" tmux navigator
let g:tmux_navigator_disable_when_zoomed = 1


" gruvbox8
set termguicolors
colorscheme gruvbox8

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

nnoremap <silent> <leader>b :call ToggleHiddenAll()<CR>
nnoremap <silent> <leader>e :Fern . -drawer -toggle -reveal=% -width=35<cr>
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>g :FloatermNew lazygit<cr>
nnoremap <silent> <leader>l :FloatermNew lf<cr>
nnoremap <silent> <leader>t :FloatermToggle<cr>
nnoremap <silent> <leader>z :Goyo \| set linebreak<CR>

" }}
" ===========================================================================
