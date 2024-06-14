return {
  'nvim-treesitter/nvim-treesitter-context', -- Configured in nvim-treesitter.lua
  cmd = 'TSContextEnable',
  config = function()
    require('treesitter-context').setup({
      enable = false,
      mode = 'topline',
    })
  end,
}
