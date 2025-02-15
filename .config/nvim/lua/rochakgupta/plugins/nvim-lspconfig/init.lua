return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason-lspconfig.nvim', -- Configured in mason-lspconfig.lua
    {
      'hrsh7th/cmp-nvim-lsp', -- Configured in nvim-cmp.lua
      cond = vim.g.rg_nvim_cmp,
    },
    {
      'saghen/blink.cmp', -- Configured in blink.lua
      cond = vim.g.rg_blink,
    },
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
    'mfussenegger/nvim-jdtls',
    'b0o/schemastore.nvim',
  },
  config = function()
    require('rochakgupta.plugins.nvim-lspconfig.ui')
    require('rochakgupta.plugins.nvim-lspconfig.lsp')
  end,
}
