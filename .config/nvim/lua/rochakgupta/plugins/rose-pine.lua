local settings = require('rochakgupta.settings')

return {
  {
    -- Colorscheme
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    lazy = settings.colorscheme ~= 'rose-pine',
    opts = {
      disable_background = settings.transparent,
      disable_float_background = settings.transparent,
      disable_italics = true,
    },
  },
}
