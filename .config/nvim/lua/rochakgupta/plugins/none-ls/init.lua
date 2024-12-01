return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- Configured in mason-tool-installer.lua
    -- Builtins moved out of none-ls
    -- https://github.com/nvimtools/none-ls.nvim/discussions/81
    'gbprod/none-ls-shellcheck.nvim',
  },
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    require('null-ls').setup({
      border = vim.g.rg_border,
      sources = {
        require('none-ls-shellcheck.diagnostics'),
        require('none-ls-shellcheck.code_actions'),
      },
    })
  end,
}
