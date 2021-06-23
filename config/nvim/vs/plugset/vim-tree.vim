let g:nvim_tree_width = 35
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_show_icons = {
			\ 'git': 1,
			\ 'folders': 0,
			\ 'files': 0,
			\ 'folder_arrows': 0,
			\ }
