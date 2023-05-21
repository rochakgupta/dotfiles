return {
  {
    'ellisonleao/glow.nvim',
    keys = {
      { mode = 'n', '<leader>g', '<cmd>Glow<CR>', desc = 'Open [G]low' },
    },
    opts = {
      border = require('rochakgupta.settings').border,
      width = 1000, -- Upper bound. Set to an incredibly large number to use full width.
      width_ratio = 1,
      height_ratio = 0.9,
    },
  },
}
