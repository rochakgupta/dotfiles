return {
  {
    -- Colorscheme
    'marko-cerovac/material.nvim',
    priority = 1000,
    lazy = true,
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
        background = require('rochakgupta.settings').transparent,
      },
      lualine_style = 'stealth',
    },
  },
}
