return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim', -- Configured in mason.lua
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'SmiteshP/nvim-navic', -- Configured in nvim-navic.lua
    'SmiteshP/nvim-navbuddy', -- Configured in nvim-navbuddy.lua
    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      cond = vim.g.rg_fidget,
      opts = {
        window = {
          blend = 0,
        },
      },
    },
    {
      'folke/neodev.nvim', -- TODO: Switch to folke/lazydev.nvim for Neovim >= v0.10.0
      opts = {},
    },
    {
      'mfussenegger/nvim-jdtls',
      dependencies = {
        'mfussenegger/nvim-dap',
      },
    },
    'b0o/schemastore.nvim',
  },
  config = function()
    require('rochakgupta.plugins.nvim-lspconfig.ui')
    require('rochakgupta.plugins.nvim-lspconfig.lsp')
    require('rochakgupta.plugins.nvim-lspconfig.autoformat')
  end,
}
