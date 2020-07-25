"\
" | Neovim Configuration
" | by: Nugraha, Rizki
" | https://github.com/nugrhrizki/dotfiles
"/

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

"\_Basic_/"
filetype plugin on
syntax enable
let mapleader = ' '
let g:netrw_banner = 0
let g:netrw_liststyle = 3
set clipboard+=unnamedplus
set mouse=a
set encoding=utf-8
set expandtab
set number relativenumber
set path+=**
set shiftround
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2
set wildignore+=**/node_modules/**,*.o,*.obj,**/elm-stuff/**

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
tnoremap <C-a> <C-\><C-N>:<c-u>WhichKey '<Space>'<CR>
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

"\_Color Scheme_/"
set termguicolors
colorscheme codedark

"-| Git Gutter |-"
let g:gitgutter_map_keys = 0

"-| Which Key Mapping |-"
let g:which_key_map = {}

"->> Root <<-"
let g:which_key_map[' '] = [ ':GFiles'              , 'Find file in project' ]
let g:which_key_map['.'] = [ ':Files'               , 'Find file' ]
let g:which_key_map['?'] = [ ':Helptags'            , 'Help' ]
let g:which_key_map['e'] = [ ':CocCommand explorer' , 'Explorer' ]

"->> Buffer <<-"
let g:which_key_map.b = {
      \ 'name' : '+buffers',
      \ 'b' : [ ':Buffers'   , 'Search files in buffer' ],
      \ 'l' : [ ':BLines'    , 'Search lines in buffer' ],
      \ 't' : [ ':BTags'     , 'Search tags in buffer' ],
      \ 'c' : [ ':BCommits'  , 'Search Commit in buffer' ]
      \ }

"->> File <<-"
let g:which_key_map.f = {
      \ 'name' : '+file',
      \ 'Q' : [':wqa'     , 'Save-Exit'],
      \ 'S' : [':sav'     , 'Save as'],
      \ 'c' : [':close'   , 'Close'],
      \ 'h' : [':sp'      , 'Split open'],
      \ 'n' : [':enew'    , 'New'],
      \ 'o' : [':e'       , 'Open'],
      \ 'q' : [':qa'      , 'Exit'],
      \ 's' : [':w'       , 'Save'],
      \ 't' : [':tabnew'  , 'Tab open' ],
      \ }

"->> Git <<-"
let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 'c' : [ ':Commits'  , 'Git commits' ],
      \ 'g' : [ ':Git'      , 'Fugitive git' ],
      \ 'p' : [ ':Gpush'    , 'Git push' ],
      \ 'v' : [ ':vert Git' , 'Vertical Fugitive git' ],
      \ 'h' : {
      \   'name' : '+hunk',
      \   'N' : [ ':GitGutterPrevHunk'             , 'Goto previous hunk' ],
      \   'h' : [ ':GitGutterLineHighlightsToggle' , 'Toggle highlights hunk' ],
      \   'n' : [ ':GitGutterNextHunk'             , 'Goto next hunk' ],
      \   'p' : [ ':GitGutterPreviewHunk'          , 'Preview the hunk under cursor' ],
      \   's' : [ ':GitGutterStageHunk'            , 'Stage the hunk under cursor' ],
      \ },
      \ }

"->> Coc <<-"
let g:which_key_map.c = {
      \ 'name' : '+code',
      \ }

"->> Neovim <<-"
let g:which_key_map.n = {
      \ 'name' : '+editor',
      \ 'c' : [ ':Colors'                , 'Color schemes' ],
      \ 'f' : [ ':Filetypes'             , 'File types' ],
      \ 'n' : [ ':set number!'           , 'Toggle linenumber' ],
      \ 'r' : [ ':set relativenumber!'   , 'Toggle relativenumber' ],
      \ 't' : [ ':terminal'              , 'New terminal' ],
      \ }

"->> Wiki <<-"
let g:which_key_map.w = {
      \ 'name' : '+wiki',
      \ 'd' : 'Delete current wiki',
      \ 'h' : 'Convert wiki to html',
      \ 'i' : 'Open diary index',
      \ 'r' : 'Rename current wiki',
      \ 's' : 'Select and open index',
      \ 't' : 'Open index in a tab',
      \ 'w' : 'Open index',
      \ ' ' : {
      \     'name' : '+more',
      \     'i' : 'Update diary section',
      \     'm' : 'Open diary wiki file for tomorrow',
      \     't' : 'Tabs open diary wiki for today',
      \     'w' : 'Open diary wiki file for today',
      \     'y' : 'Open diary wiki file for yesterday',
      \   },
      \ }


call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_use_floating_win = 0
let g:which_key_sep = '⮚'

highlight default link WhichKey          Operator
highlight default link WhichKeySeperator Normal
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

set timeoutlen=300

"-| Fzf |-"
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, { 'options': [
    \ '--reverse',
    \ '--info=inline',
    \ '--algo=v1'
    \ ]}, <bang>0)

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <f2> <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='codedark'
