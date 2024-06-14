return {
  'jay-babu/mason-null-ls.nvim',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  dependencies = {
    'williamboman/mason.nvim', -- Configured in mason.lua
    {
      'nvimtools/none-ls.nvim',
      dependencies = {
        -- Builtins moved out of none-ls
        -- https://github.com/nvimtools/none-ls.nvim/discussions/81
        'gbprod/none-ls-shellcheck.nvim',
      },
    },
  },
  config = function()
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting
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
        require('none-ls-shellcheck.diagnostics'),
        require('none-ls-shellcheck.code_actions'),
      },
    })
    require('mason-null-ls').setup({
      ensure_installed = nil,
      automatic_installation = true,
    })
  end,
}
