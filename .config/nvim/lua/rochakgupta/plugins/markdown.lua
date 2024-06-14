return {
  'MeanderingProgrammer/markdown.nvim',
  ft = 'markdown',
  name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Configured in nvim-treesitter.lua
  },
  config = function()
    require('render-markdown').setup({})
  end,
}
