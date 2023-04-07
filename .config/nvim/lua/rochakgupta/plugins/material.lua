local settings = require('rochakgupta.settings')

return {
  {
    -- Colorscheme
    'marko-cerovac/material.nvim',
    priority = 1000,
    lazy = settings.colorscheme ~= 'material',
    init = function()
      vim.g.material_style = 'deep ocean'
    end,
    opts = {
      styles = {
        comments = { italic = true },
      },
      plugins = {
        'dap',
        'gitsigns',
        'indent-blankline',
        'nvim-cmp',
        'nvim-navic',
        'nvim-tree',
        'nvim-web-devicons',
        'telescope',
        'which-key',
      },
      disable = {
        colored_cursor = true,
        background = settings.transparent,
      },
      lualine_style = 'stealth',
    },
  },
}
