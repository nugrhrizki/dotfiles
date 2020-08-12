"\_Git Gutter_/"
let g:gitgutter_map_keys = 0

"\_Fzf_/"
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, { 'options': [
    \ '--reverse',
    \ '--info=inline',
    \ '--algo=v1'
    \ ]}, <bang>0)
