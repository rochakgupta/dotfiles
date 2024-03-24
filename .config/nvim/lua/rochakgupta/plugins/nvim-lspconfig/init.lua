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

      -- Java
      'mfussenegger/nvim-jdtls',

      -- Schema store
      'b0o/schemastore.nvim',

      -- Preview LSP results in buffer
      {
        'rmagatti/goto-preview',
        dependencies = {
          'nvim-telescope/telescope.nvim', -- Used and configued in telescope
        },
        config = function()
          require('goto-preview').setup({
            references = {
              telescope = require('telescope.config').values,
            },
            post_open_hook = function()
              -- add preview window to buffer list
              local buffer_num = vim.api.nvim_get_current_buf() -- current buffer
              vim.api.nvim_buf_set_option(buffer_num, 'buflisted', true)
            end,
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
