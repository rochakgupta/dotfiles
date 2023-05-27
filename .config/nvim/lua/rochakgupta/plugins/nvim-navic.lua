local settings = require('rochakgupta.settings')

return {
  {
    -- Display symbols in the form of breadcrumbs
    'SmiteshP/nvim-navic',
    lazy = settings.navic,
    init = function()
      -- vim.b.navic_lazy_update_context = true
    end,
    opts = {
      -- Manually attached in nvim-lspconfig
      -- lsp = {
      --   auto_attach = settings.navic
      -- },
    },
  },
}
