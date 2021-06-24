" delete whitespace
au BufWritePre * %s/\s\+$//e
au BufWritePre * %s/\n\+\%$//e
au BufWritePre *.[ch] %s/\%$/\r/e

au BufWritePre *.elm lua vim.lsp.buf.formatting()

" writings email mode
au BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
au BufRead,BufNewFile /tmp/neomutt* :Goyo
au BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
au BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" floaterm repl mode
au FileType floaterm setlocal nornu nonu signcolumn=no
