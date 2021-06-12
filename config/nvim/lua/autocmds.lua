local api = vim.api

-- TODO: replace this once we can define autocmd using lua

-- delete whitespace
api.nvim_exec(
[[
augroup Whitespace
	au!
	au BufWritePre * %s/\s\+$//e
	au BufWritePre * %s/\n\+\%$//e
	au BufWritePre *.[ch] %s/\%$/\r/e
augroup END
]],
true)

api.nvim_exec(
[[
augroup Neomutt
	au!
	au BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	au BufRead,BufNewFile /tmp/neomutt* :Goyo
	au BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	au BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>
augroup END
]],
true)

api.nvim_exec(
[[
augroup Floaterm
	au!
	au FileType floaterm setlocal nornu nonu signcolumn=no
augroup END
]],
true)


-- set statusline
api.nvim_exec([[
augroup Statusline
	au!
	au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
	au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
	au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline('explorer')
augroup END
]], false)
