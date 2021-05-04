require('plugins')
require('settings')
require('keymapps')
require('utils')

vim.api.nvim_command('colorscheme gruvbox8')

require('colorizer').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.bashls.setup{ capabilities = capabilities }
require'lspconfig'.cssls.setup{ capabilities = capabilities }
require'lspconfig'.elmls.setup{ capabilities = capabilities }
require'lspconfig'.html.setup{ capabilities = capabilities }
require'lspconfig'.pyright.setup{ capabilities = capabilities }
require'lspconfig'.tsserver.setup{ capabilities = capabilities }
require'lspconfig'.elixirls.setup{
	cmd = { '/home/nugrhrizki/.local/share/elixir-ls/language_server.sh' },
	capabilities = capabilities,
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- vsnip = true;
	tags = true;
	ultisnips = true;
	nvim_treesitter = true;
  };
}

