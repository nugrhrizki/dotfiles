local cmd = vim.cmd

cmd('autocmd! FileType which_key')
cmd('autocmd  FileType which_key set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler')
