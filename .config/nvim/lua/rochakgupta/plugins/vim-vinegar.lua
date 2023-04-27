return {
  {
    -- Improve default netrw experience
    cond = function()
      return require('rochakgupta.settings').vinegar
    end,
    'tpope/vim-vinegar',
  },
}
