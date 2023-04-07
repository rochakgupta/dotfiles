local settings = require('rochakgupta.settings')

return {
  {
    -- Colorscheme
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = settings.colorscheme ~= 'tokyonight',
    opts = {
      style = 'night',
      transparent = settings.transparent,
      styles = {
        keywords = { italic = false },
        sidebars = settings.transparent and 'transparent' or 'dark',
        floats = settings.transparent and 'transparent' or 'dark',
      },
    },
  },
}
