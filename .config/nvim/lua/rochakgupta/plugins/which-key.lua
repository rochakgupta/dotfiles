return {
  {
    -- Suggest available keybindings with typing
    'folke/which-key.nvim',
    cond = function()
      return require('rochakgupta.settings').which_key
    end,
    opts = {},
  },
}
