return {
  'mfussenegger/nvim-lint',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- Configured in mason-tool-installer.lua
  },
  cond = vim.g.rg_nvim_lint,
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      sh = { 'shellcheck' },
      zsh = { 'shellcheck' },
    }

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('NvimLint', { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
