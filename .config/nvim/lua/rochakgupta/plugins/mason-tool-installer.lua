return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    local tools = require('rochakgupta.plugins.conform.formatters')
    if vim.g.rg_nvim_lint then
      tools = vim.tbl_extend('force', tools, require('rochakgupta.plugins.nvim-lint.linters'))
    end
    if vim.g.rg_none_ls then
      tools = vim.tbl_extend('force', tools, require('rochakgupta.plugins.none-ls.linters'))
    end
    require('mason-tool-installer').setup({
      ensure_installed = tools,
    })
  end,
}
