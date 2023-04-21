return {
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    cond = function()
      return require('rochakgupta.settings').indent_blankline
    end,
    opts = {
      show_current_context = true,
      show_trailing_blankline_indent = false,
    },
  },
}
