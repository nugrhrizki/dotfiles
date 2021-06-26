let mapleader = " "
let localmapleader = " "

" quick key :3
nnoremap <silent> <leader>e      :NvimTreeToggle<cr>
nnoremap <silent> <leader>g      :FloatermNew lazygit<cr>
nnoremap <silent> <leader>l      :FloatermNew lf<cr>
nnoremap <silent> <leader>t      :FloatermToggle<cr>
nnoremap <silent> <leader>z      :Goyo \| set linebreak<cr>
nnoremap <silent> <leader>d      :call ToggleDeadKeys()<cr>

" completion
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
