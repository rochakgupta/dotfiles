local settings = require('rochakgupta.settings')

return {
  {
    -- Colorscheme
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = settings.colorscheme ~= 'catppuccin',
    opts = {
      transparent_background = settings.transparent,
      term_colors = true,
      styles = {
        conditionals = {},
      },
    },
  },
}
