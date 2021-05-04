local map = vim.api.nvim_set_keymap

map('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- explorer
map('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- just better
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

-- compe
map('i', '<C-Space>', 'compe#complete()', { noremap = true, silent = true, expr = true })
map('i', '<Tab>', 'compe#confirm()', { noremap = true, silent = true, expr = true })
map('i', '<C-e>', 'compe#close("<C-e>")', { noremap = true, silent = true, expr = true })
map('i', '<C-f>', 'compe#scroll({ "delta": +4 })', { noremap = true, silent = true, expr = true })
map('i', '<C-d>', 'compe#scroll({ "delta": -4 })', { noremap = true, silent = true, expr = true })

