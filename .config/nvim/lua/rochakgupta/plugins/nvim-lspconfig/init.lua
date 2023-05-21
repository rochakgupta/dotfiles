return {
  {
    -- LSP configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- nvim-cmp source for built-in LSP client
      'hrsh7th/cmp-nvim-lsp',

      -- Useful status updates for LSP
      {
        'j-hui/fidget.nvim',
        opts = {
          window = {
            blend = 0,
          },
        },
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      {
        'folke/neodev.nvim',
        opts = {},
      },

      -- Schema store
      'b0o/schemastore.nvim',
    },
    config = function()
      require('rochakgupta.plugins.nvim-lspconfig.ui')
      require('rochakgupta.plugins.nvim-lspconfig.lsp')
      require('rochakgupta.plugins.nvim-lspconfig.autoformat')
    end,
  },
}
