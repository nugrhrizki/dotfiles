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
	Plug 'junegunn/seoul256.vim'
	Plug 'vimwiki/vimwiki'
	Plug 'andymass/vim-matchup'
	Plug 'tpope/vim-fugitive'
	Plug 'preservim/tagbar'
	Plug 'ElmCast/elm-vim'
	Plug 'voldikss/vim-floaterm'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'lambdalisue/fern.vim'

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
set relativenumber number
set hidden
set ignorecase
set smartcase
set incsearch
set timeoutlen=500
set shortmess+=c
set updatetime=500
set autoindent
set noexpandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set noshowmode
set noruler
set laststatus=2
set noshowcmd
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

let s:hidden_all = 0
function! ToggleHiddenAll()
	if s:hidden_all  == 0
		let s:hidden_all = 1
		set showmode
		set ruler
		set laststatus=0
		set showcmd
	else
		let s:hidden_all = 0
		set noshowmode
		set noruler
		set laststatus=2
		set noshowcmd
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

function! s:hijack_directory() abort
	let path = expand('$:p')
	if !isdirectory(path)
		return
	endif
	bwipeout %
	execute printf('Fern %s', fnameescape(path))
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

" use fern by default to explore dir
augroup my-fern-hijack
	autocmd!
	autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

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


" seoul256
colorscheme seoul256


" fern
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

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

" ===========================================================================
" STATUSLINE {{

set laststatus=2
set statusline=
set statusline+=%{Space()}
set statusline+=%{StatuslineMode()}
set statusline+=%{Space()}
set statusline+=%1*
set statusline+=%{Space()}
set statusline+=%2*
set statusline+=%f
set statusline+=%1*
set statusline+=%{Space()}
set statusline+=%m
set statusline+=%h
set statusline+=%r
set statusline+=%{Space()}
set statusline+=%{Space()}
set statusline+=%l
set statusline+=:
set statusline+=%L
set statusline+=%{Space()}
set statusline+=%P
set statusline+=%=
set statusline+=%{&ff}
set statusline+=%{Space()}
set statusline+=%{Space()}
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=%{Space()}
set statusline+=%{Space()}
set statusline+=%3*
set statusline+=%{b:gitbranch}
set statusline+=%2*
set statusline+=%y
set statusline+=%1*
set statusline+=%{Space()}

function! Space()
	return " "
endfunction

hi User1 cterm=none gui=none ctermbg=black ctermfg=white guibg=black guifg=white
hi User2 cterm=bold gui=bold ctermbg=black ctermfg=white guibg=black guifg=white
hi User3 cterm=none gui=none ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen

function! StatuslineMode()
	let l:mode=mode()
	if l:mode==#"n"
		return "NORMAL"
	elseif l:mode==?"v"
		return "VISUAL"
	elseif l:mode==#"i"
		return "INSERT"
	elseif l:mode==#"R"
		return "REPLACE"
	elseif l:mode==?"s"
		return "SELECT"
	elseif l:mode==#"t"
		return "TERMINAL"
	elseif l:mode==#"c"
		return "COMMAND"
	elseif l:mode==#"!"
		return "SHELL"
	endif
endfunction

function! StatuslineGitBranch()
	let b:gitbranch=""
	if &modifiable
		try
			let l:dir=expand('%:p:h')
			let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
			if !v:shell_error
			let b:gitbranch="  ".substitute(l:gitrevparse, '\n', '', 'g')."  "
			endif
		catch
		endtry
	endif
endfunction

augroup GetGitBranch
	autocmd!
	autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

" }}
" ===========================================================================
