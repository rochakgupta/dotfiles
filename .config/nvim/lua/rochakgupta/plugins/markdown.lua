return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Configured in nvim-treesitter.lua
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('render-markdown').setup({
      heading = {
        position = 'inline',
      },
    })
  end,
}
