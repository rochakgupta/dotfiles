local transparent = require('rochakgupta.settings').transparent

return {
  {
    -- Colorscheme
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    lazy = true,
    opts = {
      disable_background = transparent,
      disable_float_background = transparent,
      disable_italics = true,
    },
  },
}
