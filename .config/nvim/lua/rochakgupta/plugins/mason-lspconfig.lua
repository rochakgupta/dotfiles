return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim', -- Configured in mason.lua
  },
  config = function()
    require('mason-lspconfig').setup({
      ensure_installed = require('rochakgupta.plugins.nvim-lspconfig.servers').get_mason_names(),
      -- Servers are enabled explicitly in nvim-lspconfig/lsp.lua instead, so that
      -- jdtls is not started here as well as by nvim-jdtls.
      automatic_enable = false,
    })
  end,
}
