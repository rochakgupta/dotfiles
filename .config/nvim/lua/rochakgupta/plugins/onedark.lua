local settings = require('rochakgupta.settings')

return {
  {
    -- Colorscheme
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = settings.colorscheme ~= 'onedark',
    opts = {
      transparent = settings.transparent,
    },
  },
}
