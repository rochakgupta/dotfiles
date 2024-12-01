return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim', -- Configured in mason.lua
  },
  config = function()
    require('mason-lspconfig').setup({
      ensure_installed = require('rochakgupta.plugins.nvim-lspconfig.servers'),
    })
  end,
}
