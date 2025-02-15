return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('snacks').setup({
      indent = {
        enabled = vim.g.rg_snacks_indent and not vim.g.started_by_firenvim,
        animate = {
          enabled = false,
        },
      },
    })
  end,
}
