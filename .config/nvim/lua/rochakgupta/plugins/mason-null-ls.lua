return {
  {
    -- Formatting and linting
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim', -- Used and configured in nvim-lspconfig.lua
      'nvimtools/none-ls.nvim',
    },
    config = function()
      require('mason').setup()
      local null_ls = require('null-ls')
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      null_ls.setup({
        border = require('rochakgupta.settings').border,
        sources = {
          formatting.black,
          formatting.stylua,
          formatting.prettierd,
          formatting.clang_format.with({
            extra_args = { '--style', 'webkit' },
          }),
          formatting.shfmt.with({
            filetypes = { 'sh', 'zsh' },
          }),
          diagnostics.shellcheck,
        },
      })
      require('mason-null-ls').setup({
        ensure_installed = nil,
        automatic_installation = true,
      })
    end,
  },
}
