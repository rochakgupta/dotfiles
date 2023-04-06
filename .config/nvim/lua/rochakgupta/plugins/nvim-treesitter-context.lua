return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        enable = false,
        mode = 'topline',
        separator = '-',
      })
    end,
  },
}
