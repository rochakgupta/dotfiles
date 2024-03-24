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

      -- Document symbol visibility
      'SmiteshP/nvim-navbuddy',

      -- Useful status updates for LSP
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        cond = function()
          return require('rochakgupta.settings').fidget
        end,
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

      -- Preview LSP code actions
      {
        'aznhe21/actions-preview.nvim',
        dependencies = {
          'nvim-telescope/telescope.nvim', -- Used and configued in telescope
        },
        config = function()
          require('actions-preview').setup({
            telescope = require('telescope.config').values,
          })
        end,
      },
    },
    config = function()
      require('rochakgupta.plugins.nvim-lspconfig.ui')
      require('rochakgupta.plugins.nvim-lspconfig.lsp')
      require('rochakgupta.plugins.nvim-lspconfig.autoformat')
    end,
  },
}
