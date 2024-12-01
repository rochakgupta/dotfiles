return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    local tools = require('rochakgupta.plugins.conform.formatters')
    tools = vim.tbl_extend('force', tools, require('rochakgupta.plugins.none-ls.linters'))
    require('mason-tool-installer').setup({
      ensure_installed = tools,
    })
  end,
}
