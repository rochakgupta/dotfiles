return {
  'hasansujon786/nvim-navbuddy',
  dependencies = {
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    local actions = require('nvim-navbuddy.actions')

    require('nvim-navbuddy').setup({
      window = {
        border = vim.g.rg_border,
        size = { height = '75%', width = '90%' },
        sections = {
          left = {
            size = '20%',
          },
          mid = {
            size = '30%',
          },
          right = {
            preview = 'always',
          },
        },
      },
      mappings = {
        ['<Down>'] = actions.next_sibling(),
        ['<Up>'] = actions.previous_sibling(),
        ['<Left>'] = actions.parent(),
        ['<Right>'] = actions.children(),
      },
      lsp = {
        auto_attach = true,
      },
    })
    vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>', { desc = 'Navbuddy: Open', silent = true })
  end,
}
