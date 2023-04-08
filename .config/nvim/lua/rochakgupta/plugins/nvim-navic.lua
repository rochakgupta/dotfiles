return {
  {
    -- Display symbols in the form of breadcrumbs
    'SmiteshP/nvim-navic',
    dependencies = {
      'neovim/nvim-lspconfig', -- Used and configured in nvim-lspconfig
    },
    lazy = true,
    init = function()
      -- vim.b.navic_lazy_update_context = true
    end,
    opts = {},
  },
}
