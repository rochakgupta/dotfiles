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
    'hasansujon786/nvim-navbuddy', -- Configured in nvim-navbuddy.lua
    {
      'j-hui/fidget.nvim',
      cond = vim.g.rg_fidget,
      opts = {
        progress = {
          ignore_done_already = true,
          ignore_empty_message = true,
          display = {
            render_limit = 3,
            done_ttl = 1,
          },
        },
        notification = {
          window = {
            -- relative = 'win',
            tabstop = 2,
            winblend = 100,
            max_width = 100,
          },
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
