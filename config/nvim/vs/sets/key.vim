let mapleader = " "
let localmapleader = " "

" quick key :3
nnoremap <silent> <C-p>          :Telescope fd<cr>
nnoremap <silent> <C-b>          :Telescope buffers<cr>
nnoremap <silent> <leader>e      :NvimTreeToggle<cr>
nnoremap <silent> <leader>p      :Telescope commands<cr>
nnoremap <silent> <leader>g      :FloatermNew lazygit<cr>
nnoremap <silent> <leader>l      :FloatermNew lf<cr>
nnoremap <silent> <leader>t      :FloatermToggle<cr>
nnoremap <silent> <leader>z      :Goyo<cr>

" completion
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <Tab>     compe#confirm('<Tab>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
