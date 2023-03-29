return {
  {
    'SmiteshP/nvim-navic',
    dependencies = {
      'neovim/nvim-lspconfig', -- Used and configured in nvim-lspconfig
    },
    init = function()
      -- vim.b.navic_lazy_update_context = true
    end,
    opts = {},
  },
}
