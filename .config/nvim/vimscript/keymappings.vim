noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

vmap < <gv
vmap > >gv

nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}

let g:which_key_map['h'] = [ '<C-W>s'						, 'split below']
let g:which_key_map['T'] = [ ':Rg'							, 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'						, 'split right']
let g:which_key_map['z'] = [ 'Goyo'							, 'zen' ]

let g:which_key_map.t = {
	\ 'name' : '+terminal' ,
	\ 'f' : [':FloatermNew fzf'									, 'fzf'],
	\ 'g' : [':FloatermNew lazygit'								, 'git'],
	\ 'd' : [':FloatermNew lazydocker'							, 'docker'],
	\ 'n' : [':FloatermNew node'								, 'node'],
	\ 'p' : [':FloatermNew python'								, 'python'],
	\ 'l' : [':FloatermNew lf'									, 'lf'],
	\ 'y' : [':FloatermNew ytop'								, 'ytop'],
	\ 's' : [':FloatermNew ncdu'								, 'ncdu'],
	\ }

let g:which_key_map.f = {
	\ 'name' : '+files' ,
	\ 'f' : [':Files'									, 'Search files' ],
	\ 's' : [':w<cr>'									, 'Save file' ],
	\ 'S' : [':w '										, 'Save file as ...' ],
	\ }

let g:which_key_map.o = {
	\ 'name' : '+open',
	\ 'p' : [':Fern . -drawer -toggle -reveal=% -width=35', 'Project sidebar' ],
	\ 't' : [':FloatermToggle'							, 'Toggle floaterm' ],
	\ 'T' : [':FloatermNew --wintype=split --height=6'	, 'Floaterm' ],
	\ }

call which_key#register('<Space>', "g:which_key_map")

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
