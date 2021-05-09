noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

vmap < <gv
vmap > >gv

nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

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
