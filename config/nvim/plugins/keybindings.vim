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
