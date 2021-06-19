local bind = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

bind('n', '<C-j>', '<C-w>j', opts)
bind('n', '<C-k>', '<C-w>k', opts)
bind('n', '<C-l>', '<C-w>l', opts)
bind('n', '<C-h>', '<C-w>h', opts)

bind('v', '<', '<gv', {})
bind('v', '>', '>gv', {})
