return {
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim', -- Used and configured in nvim-lspconfig.lua
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
      local null_ls = require('null-ls')
      local formatting = null_ls.builtins.formatting
      null_ls.setup({
        sources = {
          formatting.black,
          formatting.stylua,
          formatting.prettierd,
        },
      })
      require('mason-null-ls').setup({
        ensure_installed = nil,
        automatic_installation = true,
        automatic_setup = false,
      })
    end,
  },
}
