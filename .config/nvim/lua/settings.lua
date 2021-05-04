local buffer = vim.bo
local global = vim.o
local globvars = vim.g
local window = vim.wo

-- global options
global.clipboard = 'unnamedplus'
global.completeopt = "menuone,noselect"
global.hidden = true
global.listchars = 'tab:▸ ,eol:¬,nbsp:␣,extends:…,precedes:<,extends:>,trail:·'
global.mouse = 'a'
global.shiftwidth = 4
global.smartcase = true
global.smarttab = true
global.softtabstop = 4
global.swapfile = false
global.tabstop = 4
global.termguicolors = true

-- window-local options
window.colorcolumn = '81'
window.listchars = 'tab:▸ ,eol:¬,nbsp:␣,extends:…,precedes:<,extends:>,trail:·'
window.list = true
window.number = true
window.relativenumber = true

-- buffer-local options
buffer.expandtab = false
buffer.shiftwidth = 4
buffer.softtabstop = 4
buffer.tabstop = 4

-- global-variable options

-- Nvim Tree
globvars.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
globvars.nvim_tree_auto_close = 1
globvars.nvim_tree_indent_markers = 1
globvars.nvim_tree_follow = 1

-- Elixir
globvars.elm_setup_keybindings = 0
globvars.elm_format_autosave = 1

