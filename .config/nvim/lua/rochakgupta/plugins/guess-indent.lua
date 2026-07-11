return {
  'nmac427/guess-indent.nvim',
  cond = vim.g.rg_guess_indent,
  config = function()
    require('guess-indent').setup({})
  end,
}
