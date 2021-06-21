local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
	capabilities = capabilities,
}

require'lspconfig'.cssls.setup {
	capabilities = capabilities;
	filetypes = { "css", "scss", "sass", "less" },
}

require'lspconfig'.bashls.setup{
	capabilities = capabilities,
}

require'lspconfig'.gdscript.setup{
	capabilities = capabilities,
}

require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

require'lspconfig'.yamlls.setup{
	capabilities = capabilities,
}

require'lspconfig'.dartls.setup{
	capabilities = capabilities,
}
