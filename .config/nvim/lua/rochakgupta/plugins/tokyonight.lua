local transparent = require('rochakgupta.settings').transparent

return {
  {
    -- Colorscheme
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = true,
    opts = {
      style = 'night',
      transparent = transparent,
      styles = {
        keywords = { italic = false },
        sidebars = transparent and 'transparent' or 'dark',
        floats = transparent and 'transparent' or 'dark',
      },
    },
  },
}
