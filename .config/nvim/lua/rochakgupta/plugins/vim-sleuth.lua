return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  cond = function()
    return require('rochakgupta.settings').sleuth
  end,
}
