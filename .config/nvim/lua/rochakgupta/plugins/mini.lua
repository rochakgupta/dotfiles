return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.align').setup()

    require('mini.bracketed').setup()

    require('mini.comment').setup()

    require('mini.move').setup()

    require('mini.operators').setup({
      evaluate = {
        prefix = '',
      },
      exchange = {
        prefix = '<leader>e',
      },
      multiply = {
        prefix = '',
      },
      replace = {
        prefix = '<leader>r',
      },
      sort = {
        prefix = '',
      },
    })
  end,
}
