return {
  'nvim-treesitter/nvim-treesitter-context',
  cmd = 'TSContextEnable',
  config = function()
    require('treesitter-context').setup({
      enable = false,
      mode = 'topline',
    })
  end,
}
