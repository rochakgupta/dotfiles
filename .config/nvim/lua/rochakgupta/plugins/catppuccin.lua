return {
  {
    -- Colorscheme
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = true,
    opts = {
      transparent_background = require('rochakgupta.settings').transparent,
      term_colors = true,
      styles = {
        conditionals = {},
      },
    },
  },
}
