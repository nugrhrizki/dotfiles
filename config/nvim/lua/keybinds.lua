local bind = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.api.nvim_exec(
[[
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
]],
true)

bind('n', '<C-j>', '<C-w>j', opts)
bind('n', '<C-k>', '<C-w>k', opts)
bind('n', '<C-l>', '<C-w>l', opts)
bind('n', '<C-h>', '<C-w>h', opts)

bind('n', '<leader>e', ':NvimTreeToggle<cr>'       , opts)
bind('n', '<leader>f', ':Telescope fd<cr>'            , opts)
bind('n', '<leader>g', ':FloatermNew lazygit<cr>'  , opts)
bind('n', '<leader>l', ':FloatermNew lf<cr>'       , opts)
bind('n', '<leader>t', ':FloatermToggle<cr>'       , opts)
bind('n', '<leader>z', ':Goyo | set linebreak<CR>' , opts)

bind('v', '<', '<gv', {})
bind('v', '>', '>gv', {})
