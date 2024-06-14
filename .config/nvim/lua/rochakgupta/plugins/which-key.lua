return {
  {
    -- Suggest available keybindings with typing
    'folke/which-key.nvim',
    cond = require('rochakgupta.settings').which_key,
    opts = {},
  },
}
