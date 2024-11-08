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

    local sources = {
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
    }

    local mason_registry = require('mason-registry')
    if mason_registry.is_installed('ktfmt') then
      local helpers = require('null-ls.helpers')
      local methods = require('null-ls.methods')
      local FORMATTING = methods.internal.FORMATTING
      local ktfmt_path = mason_registry.get_package('ktfmt'):get_install_path() .. '/ktfmt'
      table.insert(
        sources,
        helpers.make_builtin({
          name = 'ktfmt',
          meta = {
            url = 'https://github.com/facebook/ktfmt',
            description = 'Reformats Kotlin source code to comply with community standard conventions.',
          },
          method = FORMATTING,
          filetypes = { 'kotlin' },
          generator_opts = {
            command = ktfmt_path,
            args = {
              '--kotlinlang-style',
              '-',
            },
            to_stdin = true,
          },
          factory = helpers.formatter_factory,
        })
      )
    else
      require('rochakgupta.utils').notify_warn('Install ktfmt via mason')
    end

    null_ls.setup({
      border = vim.g.rg_border,
      sources = sources,
    })

    require('mason-null-ls').setup({
      ensure_installed = nil,
      automatic_installation = true,
    })
  end,
}
