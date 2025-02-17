return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.align').setup()

    require('mini.bracketed').setup({
      buffer = { options = { wrap = false } },
      comment = { options = { wrap = false } },
      conflict = { options = { wrap = false } },
      diagnostic = { options = { wrap = false } },
      file = { options = { wrap = false } },
      indent = { options = { wrap = false } },
      jump = { options = { wrap = false } },
      location = { options = { wrap = false } },
      oldfile = { options = { wrap = false } },
      quickfix = { options = { wrap = false } },
      treesitter = { options = { wrap = false } },
      undo = { options = { wrap = false } },
      window = { options = { wrap = false } },
      yank = { options = { wrap = false } },
    })

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
