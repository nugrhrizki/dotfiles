local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

local lspconfig = require'lspconfig'

-- lspconfig.html.setup {
-- 	capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
-- 	capabilities = capabilities;
-- 	filetypes = { "css", "scss", "sass", "less" },
-- }

lspconfig.bashls.setup{
	capabilities = capabilities,
}

-- lspconfig.gdscript.setup{
-- 	capabilities = capabilities,
-- }

-- lspconfig.jsonls.setup {
-- 	commands = {
-- 		Format = {
-- 			function()
-- 				vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
-- 			end
-- 		}
-- 	}
-- }

-- lspconfig.yamlls.setup{
-- 	capabilities = capabilities,
-- }

-- lspconfig.dartls.setup{
-- 	capabilities = capabilities,
-- }

-- lspconfig.tsserver.setup{
-- 	capabilities = capabilities,
-- }

-- lspconfig.ccls.setup {
--   init_options = {
--     compilationDatabaseDirectory = "build";
--     index = {
--       threads = 0;
--     };
--     clang = {
--       excludeArgs = { "-frounding-math"} ;
--     };
--   }
-- }

lspconfig.elmls.setup{
	capabilities = capabilities,
}

-- lspconfig.tailwindcss.setup{
-- 	capabilities = capabilities,
-- }
