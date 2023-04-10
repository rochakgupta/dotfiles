return {
  {
    -- Code context
    'nvim-treesitter/nvim-treesitter-context',
    lazy = true,
    cmd = 'TSContextEnable',
    config = function()
      require('treesitter-context').setup({
        enable = false,
        mode = 'topline',
        separator = '-',
      })
    end,
  },
}
