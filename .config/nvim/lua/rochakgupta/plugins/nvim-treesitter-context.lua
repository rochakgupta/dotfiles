return {
  'nvim-treesitter/nvim-treesitter-context',
  keys = {
    { '<leader>ct', '<cmd>TSContextToggle<CR>', desc = 'Toggle Treesitter Context' },
  },
  config = function()
    require('treesitter-context').setup({
      enable = false,
      mode = 'topline',
      multiline_threshold = 1,
      separator = vim.g.rg_colorscheme ~= 'tokyonight' and '' or nil,
    })
  end,
}
