return {
  'nvim-treesitter/nvim-treesitter-context',
  keys = {
    { '<leader>tc', '<cmd>TSContextToggle<CR>', desc = 'TreesitterContext: Toggle' },
  },
  config = function()
    require('treesitter-context').setup({
      enable = false,
      mode = 'topline',
      multiline_threshold = 1,
      separator = vim.g.rg_color ~= 'tokyonight' and '' or nil,
    })
  end,
}
